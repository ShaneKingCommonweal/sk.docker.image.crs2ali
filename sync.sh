#!/usr/bin/env bash

SECONDS=0

source ./pipe.sh
pipe_init 30

#alicr_user_name
#alicr_pass_word
#gh_user_name
#GH_TOKEN

# cname: company name
# uname: user name
# iname: image name
# tname: tag name

count=0
pname="mirror.crs2ali.sh"
user_registry="registry.cn-shanghai.aliyuncs.com/shaneking-sh"

[[ -d ${pname} ]] && rm -rf ./${pname}
git clone "https://github.com/${gh_user_name}/${pname}.git"

function ptp()
{
  docker pull $1
  docker tag $1 $2
  docker push $2
}

# L2
for uname in `ls ./${pname}/cr2`
do
  for iname in `ls ./${pname}/cr2/${uname}`
    do
      for tname in `ls ./${pname}/cr2/${uname}/${iname}`
      do
        if [[ ! -f ./${pname}/cr2/${uname}/${iname}/${tname}/done.md || `docker pull ${user_registry}/${uname}_${iname}:${tname} | wc -l` -eq 2 ]];then
          pipe_run "ptp ${uname}/${iname}:${tname} ${user_registry}/${uname}_${iname}:${tname}"
          touch ./${pname}/cr2/${uname}/${iname}/${tname}/done.md
          let count=$count+1
        fi
      done
    done
done

# L3
for cname in `ls ./${pname}/cr3`
do
  for uname in `ls ./${pname}/cr3/${cname}`
  do
    for iname in `ls ./${pname}/cr3/${cname}/${uname}`
    do
      for tname in `ls ./${pname}/cr3/${cname}/${uname}/${iname}`
      do
        if [[ ! -f ./${pname}/cr3/${cname}/${uname}/${iname}/${tname}/done.md || `docker pull ${user_registry}/${cname}_${uname}_${iname}:${tname} | wc -l` -eq 2 ]];then
          pipe_run "ptp ${cname}/${uname}/${iname}:${tname} ${user_registry}/${cname}_${uname}_${iname}:${tname}"
          touch ./${pname}/cr3/${cname}/${uname}/${iname}/${tname}/done.md
          let count=$count+1
        fi
      done
    done
  done
done

# L4
# rname: r name, https://hub.docker.com/r/vmware/registry-photon/

wait

if [ $count -gt 0 ];then
  git -C ./${pname} pull
  git -C ./${pname} add -A
  git -C ./${pname} commit -m "sync images at $(date +'%Y-%m-%d %H:%M')"
  git -C ./${pname} push -f "https://${gh_user_name}:${GH_TOKEN}@github.com/${gh_user_name}/${pname}.git" mirror:mirror
fi
