#!/bin/zsh

# set desktop wallpaper
# NOTE: this may cause macOS to prompt the user to provide their terminal emulator with home folder access
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"~/Setup/dotfiles/assets/catppuccin-waves-bg.png\" as POSIX file"

# setup macOS dock
if type dockutil &>/dev/null; then
  echo
  echo "Configuring macOS Dock..."

  dockutil --no-restart --remove all

  killall Dock

  echo "Dock has been setup!"
fi

# map capslock key to escape
# courtesy of https://stackoverflow.com/a/46460200/19295049
if type hidutil &>/dev/null; then
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
  # symlink launch agent to ensure change isn't lost on reboot
  # TODO: remove once symlink can be handled by aliae
  ln -sf $DOTFILES/util/macos/launch_agents/com.boldandbrad.CapsLockEscape.plist ~/Library/LaunchAgents/com.boldandbrad.CapsLockEscape.plist
  launchctl load com.boldandbrad.CapslockEscape.plist
fi
