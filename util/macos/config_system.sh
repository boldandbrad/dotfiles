#!/bin/zsh

# create hushlogin file
touch ~/.hushlogin

# set desktop wallpaper
# NOTE: this may cause macOS to prompt the user to provide their terminal emulator with home folder access
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"~/Dotfiles/assets/wallpapers/apple-black-4k.png\" as POSIX file"
echo "Set desktop wallpaper!"

# clear macOS dock
defaults delete com.apple.dock persistent-apps
killall Dock
echo "Dock has been cleared!"

# map capslock key to escape
# courtesy of https://stackoverflow.com/a/46460200/19295049
if type hidutil &>/dev/null; then
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
  launchctl load com.boldandbrad.CapslockEscape.plist
fi
echo "Mapped Caps Lock to Esc!"
