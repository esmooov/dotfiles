#!/usr/bin/env bash

PROGRAM="$(basename "$0")"

case $1 in
    --enable)
        TOUCHPAD_EVENT='enable'
        ;;
    --disable)
        TOUCHPAD_EVENT='disable'
        ;;

    *)
        echo "Usage:                                   "
        echo "  $PROGRAM <OPTIONS>                     "
        echo "                                         "
        echo "Options:                                 "
        echo "  --enable         enable the touchpad.  "
        echo "  --disable        disable the touchpad. "
        echo "                                         "
        ;;
esac

gsettings set org.gnome.desktop.peripherals.touchpad send-events $TOUCHPAD_EVENT
