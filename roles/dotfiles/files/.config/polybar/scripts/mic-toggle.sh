#!/bin/sh
if [ $(amixer | grep "Capture.*\[on\]" | wc -c) -eq 0 ]
then
  amixer set Capture cap
else
  amixer set Capture nocap
fi
