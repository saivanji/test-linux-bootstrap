#!/bin/sh

CONNECTION=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)

if [ -n "$CONNECTION" ]; then
    echo "󰕥"
else 
    echo "󰦜"
fi
