#!/usr/bin/env bash

pname="image.crs2ali.sh"
user_registry="registry.cn-shanghai.aliyuncs.com/sk-sh"

# L2
for uname in `ls ./${pname}/cr2`
do
  for iname in `ls ./${pname}/cr2/${uname}`
  do
    for tname in `ls ./${pname}/cr2/${uname}/${iname}`
    do
      if [ -f ./${pname}/cr2/${uname}/${iname}/${tname}/done.md ] ; then
        docker pull ${user_registry}/${iname}:${tname}
        docker tag ${user_registry}/${iname}:${tname} ${pname}/${uname}:${iname}
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
        if [ -f ./${pname}/cr3/${cname}/${uname}/${iname}/${tname}/done.md ] ; then
          docker pull ${user_registry}/${iname}:${tname}
          docker tag ${user_registry}/${iname}:${tname} ${pname}/${cname}/${uname}:${iname}
        fi
      done
    done
  done
done
