#!/usr/bin/env bash


user_registry="registry-vpc.cn-shanghai.aliyuncs.com/sk-sh"

# L2
for rname in `ls ./cr2`
do
  if [ "$rname" = "goharbor" ] ; then
    for iname in `ls ./cr2/${rname}`
    do
      for tname in `ls ./cr2/${rname}/${iname}`
      do
        if [ -f ./cr2/${rname}/${iname}/${tname}/l.d ] ; then
          docker pull ${user_registry}/${rname}_${iname}:${tname}
          docker tag ${user_registry}/${rname}_${iname}:${tname} ${rname}/${iname}:${tname}
        fi

        if [ -f ./cr2/${rname}/${iname}/${tname}/s.d ] ; then
          docker pull ${user_registry}/${iname}:${tname}
          docker tag ${user_registry}/${iname}:${tname} ${rname}/${iname}:${tname}
        fi
      done
    done
  fi

done
