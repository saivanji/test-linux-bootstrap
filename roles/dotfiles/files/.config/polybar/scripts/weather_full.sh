#!/bin/sh

print_weather() {
  printf '\n\n   %s Now \n\n'
  curl wttr.in/minsk?QFT
  printf '\n'
}

print_weather | dzen2 -p -l 36 -w 1376 -x 2200 -y 72 -fn 'Fantasque Sans Mono:size=11' -e 'onstart=hide,togglecollapse;button1=exit;button3=exit'
