#!/usr/bin/env sh

ssh-agent &
sxhkd        -c ~/.sxhkdrc 2>&1 > /tmp/sxhkd.log &
exec bspwm   -c ~/.bspwmrc 2>&1 > /tmp/bspwm.log
