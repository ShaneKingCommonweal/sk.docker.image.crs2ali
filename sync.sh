#!/usr/bin/env bash

#alicr_user_name
#alicr_pass_word
#gh_user_name
#GH_TOKEN

# rname: registry name
# nname: namespace name
# iname: image name
# tname: tag name

# pname: this project name


syncCount=0
doneCount=0
pname="image.crs2ali.sh"
user_registry="registry.cn-shanghai.aliyuncs.com/sk-sh"

SECONDS=0

source ./pipe.sh
pipe_init 30

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

[[ -d ${pname} ]] && rm -rf ./${pname}
git clone "https://github.com/${gh_user_name}/${pname}.git"

function ptp()
{
  echo "$1 -> $2"
  docker pull $1
  docker tag $1 $2
  docker push $2
}

commit()
{
  git -C ./${pname} pull
  git -C ./${pname} add -A
  git -C ./${pname} commit -m "sync images at $(date +'%Y-%m-%d %H:%M')"
  git -C ./${pname} push -f "https://${gh_user_name}:${GH_TOKEN}@github.com/${gh_user_name}/${pname}.git" mirror:mirror
  echo 1 > ./commit.done
}

function images()
{
  # L1
  for iname in `ls ./${pname}/cr1`
  do
    for tname in `ls ./${pname}/cr1/${iname}`
    do
      if [ -f ./${pname}/cr1/${iname}/${tname}/s.f ] && [ ! -f ./${pname}/cr1/${iname}/${tname}/s.d ] ; then
        if [ `docker pull ${user_registry}/${iname}:${tname} | wc -l` -le 2 ] ; then
          let syncCount=$syncCount+1
          echo -e "${yellow} pull ${user_registry}/${iname}:${tname} not found!"
          pipe_run "ptp ${iname}:${tname} ${user_registry}/${iname}:${tname}"
        else
          let doneCount=$doneCount+1
          touch ./${pname}/cr1/${iname}/${tname}/s.d
        fi
      fi
    done
  done

  # L2
  for rname in `ls ./${pname}/cr2`
  do
    for iname in `ls ./${pname}/cr2/${rname}`
    do
      for tname in `ls ./${pname}/cr2/${rname}/${iname}`
      do
        if [ -f ./${pname}/cr2/${rname}/${iname}/${tname}/l.f ] && [ ! -f ./${pname}/cr2/${rname}/${iname}/${tname}/l.d ] ; then
          if [ `docker pull ${user_registry}/${rname}_${iname}:${tname} | wc -l` -le 2 ] ; then
            let syncCount=$syncCount+1
            echo -e "${yellow} pull ${user_registry}/${rname}_${iname}:${tname} not found!"
            pipe_run "ptp ${rname}/${iname}:${tname} ${user_registry}/${rname}_${iname}:${tname}"
          else
            let doneCount=$doneCount+1
            touch ./${pname}/cr2/${rname}/${iname}/${tname}/l.d
          fi
        fi

        if [ -f ./${pname}/cr2/${rname}/${iname}/${tname}/s.f ] && [ ! -f ./${pname}/cr2/${rname}/${iname}/${tname}/s.d ] ; then
          if [ `docker pull ${user_registry}/${iname}:${tname} | wc -l` -le 2 ] ; then
            let syncCount=$syncCount+1
            echo -e "${yellow} pull ${user_registry}/${iname}:${tname} not found!"
            pipe_run "ptp ${rname}/${iname}:${tname} ${user_registry}/${iname}:${tname}"
          else
            let doneCount=$doneCount+1
            touch ./${pname}/cr2/${rname}/${iname}/${tname}/s.d
          fi
        fi
      done
    done
  done

  # L3
  for rname in `ls ./${pname}/cr3`
  do
    for nname in `ls ./${pname}/cr3/${rname}`
    do
      for iname in `ls ./${pname}/cr3/${rname}/${nname}`
      do
        for tname in `ls ./${pname}/cr3/${rname}/${nname}/${iname}`
        do
          if [ -f ./${pname}/cr3/${rname}/${nname}/${iname}/${tname}/l.f ] && [ ! -f ./${pname}/cr3/${rname}/${nname}/${iname}/${tname}/l.d ] ; then
            if [ `docker pull ${user_registry}/${rname}_${nname}_${iname}:${tname} | wc -l` -le 2 ] ; then
              let syncCount=$syncCount+1
              echo -e "${yellow} pull ${user_registry}/${rname}_${nname}_${iname}:${tname} not found!"
              pipe_run "ptp ${rname}/${nname}/${iname}:${tname} ${user_registry}/${rname}_${nname}_${iname}:${tname}"
            else
              let doneCount=$doneCount+1
              touch ./${pname}/cr3/${rname}/${nname}/${iname}/${tname}/l.d
            fi
          fi

          if [ -f ./${pname}/cr3/${rname}/${nname}/${iname}/${tname}/s.f ] && [ ! -f ./${pname}/cr3/${rname}/${nname}/${iname}/${tname}/s.d ] ; then
            if [ `docker pull ${user_registry}/${iname}:${tname} | wc -l` -le 2 ] ; then
              let syncCount=$syncCount+1
              echo -e "${yellow} pull ${user_registry}/${iname}:${tname} not found!"
              pipe_run "ptp ${rname}/${nname}/${iname}:${tname} ${user_registry}/${iname}:${tname}"
            else
              let doneCount=$doneCount+1
              touch ./${pname}/cr3/${rname}/${nname}/${iname}/${tname}/s.d
            fi
          fi
        done
      done
    done
  done

  # L4
  # rname: r name, https://hub.docker.com/r/vmware/registry-photon/

  echo -e "${yellow} syncCount : $syncCount changed!"
  echo -e "${yellow} doneCount : $doneCount changed!"
  if [ ${syncCount} -gt 0 ] ; then
    wait
    commit
  elif [ ${doneCount} -gt 0 ] ; then
    commit
  else
    echo 1 > ./commit.done
  fi
}

images &

while true;
do
  duration=$SECONDS
  if [[ -e ./commit.done ]] || [[ ${duration} -ge ${sec} ]] ; then

    [[ ${duration} -ge ${sec} ]] && echo -e "${red} more than $(expr ${sec} / 60) min,abort this build"

    [[ ! -e ./commit.done ]] && commit

    IFS=$'\n'; for i in $(jobs); do echo "$i"; done
    kill $(jobs -p)
    IFS=$'\n'; for i in $(jobs); do echo "$i"; done
    break

  else
    docker_dir=$(docker info | grep "Docker Root Dir" | cut -d':' -f2)
    used=$(df -h ${docker_dir}|awk '{if(NR>1)print $5}')
    echo -e "${red} duration:${duration}s, docker root dir :${docker_dir}:used:${used}"
    [[ ${used} > '70%' ]] && docker system prune -f -a
    sleep 30
  fi
done

sleep 120
echo -e "${green} bye bye"
