#!/bin/bash


epiphany-browser $1 &
sleep 40
xte "key F11" -x:0


# Prevent Screen Sleep
while :
do
  sleep 100
  xte "key F1" -x:0
done
