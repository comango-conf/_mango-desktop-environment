#!/usr/bin/env bash

#HOOKS INTO wminit


# desktop environment
xsetroot -cursor_name left_ptr
# pulseaudio --start &

# desktop applications
dropbox &
discord &
#which signal-desktop &> /dev/null && signal-desktop &
which thunderbird &> /dev/null && thunderbird &
