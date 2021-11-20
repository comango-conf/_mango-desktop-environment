#!/usr/bin/env bash

#HOOKS INTO wminit


# desktop environment
xsetroot -cursor_name left_ptr
pulseaudio --start &



# desktop applications
dropbox &
discord &
/opt/Element/element-desktop &
which signal-desktop &> /dev/null && signal-desktop &
/opt/whatsapp-desktop/WhatsApp &
which thunderbird &> /dev/null && thunderbird &
