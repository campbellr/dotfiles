#!/bin/sh
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi
echo "mcabber_event_hook('$1', '$2', '$3', '$4')" | awesome-client
