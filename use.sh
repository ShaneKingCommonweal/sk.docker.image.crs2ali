#!/usr/bin/env bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

user_registry="registry-vpc.cn-shanghai.aliyuncs.com/sk-sh"
rawL3CNames=("registry.cn-hangzhou.aliyuncs.com" "Reserved")

# L1
for iname in `ls ./cr1`
do
  for tname in `ls ./cr1/${iname}`
  do
    if [ ! -f ./cr1/${iname}/${tname}/done.md ] ; then
      docker pull ${user_registry}/${iname}:${tname}
      docker tag ${user_registry}/${iname}:${tname} ${iname}:${tname}
    fi
  done
done

# L2
for uname in `ls ./cr2`
do
  for iname in `ls ./cr2/${uname}`
  do
    for tname in `ls ./cr2/${uname}/${iname}`
    do
      if [ -f ./cr2/${uname}/${iname}/${tname}/done.md ] ; then
        docker pull ${user_registry}/${uname}_${iname}:${tname}
        docker tag ${user_registry}/${uname}_${iname}:${tname} ${uname}/${iname}:${tname}
      fi
    done
  done
done

# L3
for cname in `ls ./cr3`
do
  if [[ "${rawL3CNames[@]}" =~ "$cname" ]] ; then
    echo -e "${yellow} ignore : $cname !"
  else
    for uname in `ls ./cr3/${cname}`
    do
      for iname in `ls ./cr3/${cname}/${uname}`
      do
        for tname in `ls ./cr3/${cname}/${uname}/${iname}`
        do
          if [ -f ./cr3/${cname}/${uname}/${iname}/${tname}/done.md ] ; then
            docker pull ${user_registry}/${cname}_${uname}_${iname}:${tname}
            docker tag ${user_registry}/${cname}_${uname}_${iname}:${tname} ${cname}/${uname}/${iname}:${tname}
          fi
        done
      done
    done
  fi
done
