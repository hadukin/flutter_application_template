#!/usr/bin/env bash

rm -f pubspec_overrides.yaml
echo "lib done"

for package in 'packages/domain' 'packages/network' 'packages/storage' 'packages/data' 'packages/di'
do
  cd $package

  if [ -f "pubspec_overrides.yaml" ] ; then
    rm "pubspec_overrides.yaml"
  fi

  echo $package 'done'
  cd ../../
done

echo "all done"
