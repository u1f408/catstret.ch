#!/bin/sh

openbox --replace &
/opt/SUNWut/bin/utscreenresize -s all -l &

REG_OTHER=`/opt/SUNWut/sbin/utuser -p $SUN_SUNRAY_TOKEN | grep "Other Info" | cut -f2 -d=`
if [ "$REG_OTHER" = "" ]
then
        zenity --error --text="freerdp: idk what you want me to do! $SUN_SUNRAY_TOKEN"
        exit 1
fi

exec xterm -e xfreerdp /cert:tofu /f -toggle-fullscreen /dynamic-resolution /gfx +gfx-thin-client /smartcard /bpp:24 $REG_OTHER
