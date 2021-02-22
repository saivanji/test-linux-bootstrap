#!/bin/sh
WTTR=$(curl -s wttr.in/Minsk?0QT | grep -Eo "(\-|\+)*[0-9]+.*C")
echo 󰖕 $WTTR
