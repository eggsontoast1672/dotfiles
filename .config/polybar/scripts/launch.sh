#!/bin/sh

killall -q polybar
polybar 2>&1 | tee -a /tmp/polybar.log & disown
