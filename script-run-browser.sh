#!/bin/bash


epiphany-browser $1 &
sleep 40
xte "key F11" -x:0
