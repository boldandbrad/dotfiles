#!/bin/zsh

echo
echo "Configuring macOS Dock..."

dockutil --no-restart --remove all

dockutil --no-restart --add "/System/Applications/Photos.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Bear.app"
dockutil --no-restart --add "/Applications/Todoist.app"
dockutil --no-restart --add "/Applications/Canary Mail.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Parcel.app"
dockutil --no-restart --add "/Applications/Dashlane.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Signal.app"
dockutil --no-restart --add "/Applications/Discord.app"
dockutil --no-restart --add "/Applications/Hyper.app"
dockutil --no-restart --add "/Applications/VSCodium.app"
dockutil --no-restart --add "/Applications/Linear.app"
dockutil --no-restart --add "/Applications/Numbers.app"

killall Dock

echo "Dock has been setup!"
