#!/bin/bash

PID_FILE="/tmp/wlsunset.pid"

if [ -f "$PID_FILE" ]; then
    kill "$(cat "$PID_FILE")"
    rm "$PID_FILE"
    notify-send "Night Light Off"
else
    wlsunset -t 3000 -T 6500 &   # 3000 = دافئ ليلاً، 6500 = عادي نهاراً
    echo $! > "$PID_FILE"
    notify-send "Night Light On"
fi

