#!/bin/sh

print_weather() {
  curl -s wttr.in/minsk?QFT
}

print_weather | dzen2 -p -l 36 -w 1376 -x 2200 -y 72 -fn 'Fantasque Sans Mono:size=11' -e 'onstart=hide,togglecollapse;button1=exit;button3=exit'
