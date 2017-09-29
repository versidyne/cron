#!/bin/sh

folder="/mnt/xvdc/services/forge/"
service="java"
description="Minecraft Forge"
process=`ps uxw | grep $service | grep -v grep | awk '{print $11}'`

if [ -z "$process" ]; then
  echo "Couldn't find $description running, restarting it."
  cd "$folder"
  screen -d -m java -server -Xms2048m -Xmx3092m -XX:PermSize=512m -XX:+AggressiveOpts -XX:+UseFastAccessorMethods -XX:+OptimizeStringConcat -XX:+UseBiasedLocking -XX:MaxGCPauseMillis=5 -XX:+CMSParallelRemarkEnabled -XX:ParallelGCThreads=4 -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar FTBServer-1.7.10-1448.jar nogui
  echo "$description started!"
fi
