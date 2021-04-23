#!/bin/bash

#HOOKS INTO reload

if [ -f /opt/Element/element-desktop ]; then
    pkill element
    /opt/Element/element-desktop &
fi

pkill signal-desktop
/opt/Signal/signal-desktop &


timeout 0.5 xsettingsd &


true
