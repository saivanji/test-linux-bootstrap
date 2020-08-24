#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "󰂲"
else
  ALIAS=$(echo info | bluetoothctl | grep -Po 'Alias: \K.+')
  if [[ $ALIAS ]]
  then 
    echo "󰂱 "$ALIAS
  else
    echo "󰂯"
  fi
fi
