#!/bin/bash

#HOOKS INTO wminit


# desktop environment
xsetroot -cursor_name left_ptr
pulseaudio --start &


# desktop applications
dropbox &
discord &
/opt/Element/element-desktop &
/opt/Signal/signal-desktop &
thunderbird &
