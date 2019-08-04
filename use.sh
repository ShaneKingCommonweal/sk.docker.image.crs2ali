#!/usr/bin/env bash

user_registry="registry-vpc.cn-shanghai.aliyuncs.com/sk-sh"

# L2
for uname in `ls ./cr2`
do
  for iname in `ls ./cr2/${uname}`
  do
    for tname in `ls ./cr2/${uname}/${iname}`
    do
      if [ -f ./cr2/${uname}/${iname}/${tname}/done.md ] ; then
        docker pull ${user_registry}/${iname}:${tname}
        docker tag ${user_registry}/${iname}:${tname} ${uname}/${iname}:${tname}
      fi
    done
  done
done

# L3
for cname in `ls ./cr3`
do
  for uname in `ls ./cr3/${cname}`
  do
    for iname in `ls ./cr3/${cname}/${uname}`
    do
      for tname in `ls ./cr3/${cname}/${uname}/${iname}`
      do
        if [ -f ./cr3/${cname}/${uname}/${iname}/${tname}/done.md ] ; then
          docker pull ${user_registry}/${iname}:${tname}
          docker tag ${user_registry}/${iname}:${tname} ${cname}/${uname}/${iname}:${tname}
        fi
      done
    done
  done
done
