#! /bin/bash

echo "startup script: `date`" >> ~/.startup.log

sleep 10 # make sure private is mounted
source ~/miniconda3/bin/activate std >> ~/.startup.log
nohup ipython notebook --notebook-dir=~/base >> ~/.startup.log 2>&1 &

