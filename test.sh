eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";

notify-send "Tutorial Script exec" "executed !!!"

echo "Tutorial Script exec" "executed !!!"

