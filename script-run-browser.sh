#!/bin/bash


epiphany-browser $1 &
sleep 25
xte "key F11" -x:0
