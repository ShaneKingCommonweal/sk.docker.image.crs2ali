#!/usr/bin/env bash


user_registry="registry-vpc.cn-shanghai.aliyuncs.com/sk-sh"

# L1
for iname in `ls ./cr1`
do
  for tname in `ls ./cr1/${iname}`
  do
    if [ ! -f ./cr1/${iname}/${tname}/s.d ] ; then
      docker pull ${user_registry}/${iname}:${tname}
      docker tag ${user_registry}/${iname}:${tname} ${iname}:${tname}
    fi
  done
done

# L2
for rname in `ls ./cr2`
do
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
done

# L3
for rname in `ls ./cr3`
do
  for nname in `ls ./cr3/${rname}`
  do
    for iname in `ls ./cr3/${rname}/${nname}`
    do
      for tname in `ls ./cr3/${rname}/${nname}/${iname}`
      do
        if [ -f ./cr3/${rname}/${nname}/${iname}/${tname}/l.d ] ; then
          docker pull ${user_registry}/${rname}_${nname}_${iname}:${tname}
          docker tag ${user_registry}/${rname}_${nname}_${iname}:${tname} ${rname}/${nname}/${iname}:${tname}
        fi

        if [ -f ./cr3/${rname}/${nname}/${iname}/${tname}/s.d ] ; then
          docker pull ${user_registry}/${iname}:${tname}
          docker tag ${user_registry}/${iname}:${tname} ${rname}/${nname}/${iname}:${tname}
        fi
      done
    done
  done
done
