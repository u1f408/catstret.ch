#!/bin/sh

openbox --replace &
/opt/SUNWut/bin/utscreenresize -s all -l &

# get rid of the cursor
cat <<-EOF | xrdb -merge -
Xcursor.theme: InvisibleCursor
EOF

# disable screen blanking
xset s off
xset s noblank
xset -dpms

REG_OTHER=`/opt/SUNWut/sbin/utuser -p $SUN_SUNRAY_TOKEN | grep "Other Info" | cut -f2 -d=`
if [ "$REG_OTHER" = "" ]
then
        zenity --error --text="kiosk-browser: No browser URL provided! $SUN_SUNRAY_TOKEN"
        exit 1
fi

firefox --new-instance --kiosk --private-window "$REG_OTHER"
