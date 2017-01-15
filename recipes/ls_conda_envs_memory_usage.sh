#!/bin/bash

# This script lists the computed memory usage of each conda envionment:

me=`basename "$0"`
for el in $(conda env list); do
  if [[ "$el" == *envs\/* ]] || [[ "$el" == *envs\\* ]]; then
    path=$el
    info=($(du -hs $path))
    echo $env '('${info[0]}')'
  else
    if [[ "$el" != $me ]]; then
      env=$el
    fi
  fi
done

exit
