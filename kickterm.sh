#!/usr/bin/bash
KICKTERM_WIDFILE=$HOME/.kickterm.wid
if [ -f $KICKTERM_WIDFILE ]; then
	KICKTERM_WID=$(<$KICKTERM_WIDFILE)
	wmctrl -l | cut -d ' ' -f 1 | grep $KICKTERM_WID > /dev/null
	if [[ $? -eq 0 ]]; then
		ACTIVE_WID_DECIMAL=$((16#$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | cut -b 3-)))
		KICKTERM_WID_DECIMAL=$((16#$(echo $KICKTERM_WID | cut -b 3-)))
		if [[ $ACTIVE_WID_DECIMAL -eq $KICKTERM_WID_DECIMAL ]]; then
			wmctrl -iY $KICKTERM_WID
		else
			wmctrl -iR $KICKTERM_WID
		fi
		exit 0
	fi
fi

KICKTERM_NAME=KickTerm_$(date +%s)
gnome-terminal
wmctrl -r :SELECT: -N $KICKTERM_NAME
KICKTERM_WID=$(wmctrl -l | grep $KICKTERM_NAME | cut -d ' ' -f 1)
echo $KICKTERM_WID > $KICKTERM_WIDFILE
wmctrl -r $KICKTERM_NAME -b add,above
wmctrl -r $KICKTERM_NAME -b add,skip_taskbar
wmctrl -R $KICKTERM_NAME -b add,fullscreen
