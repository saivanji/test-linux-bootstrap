#!/bin/sh
UPDATES=$(checkupdates | wc -l)

if [ $UPDATES != "0" ]; then
  echo 󰏕 $UPDATES
else
  echo
fi
