#!/bin/zsh

# setup macOS dock
if type dockutil &>/dev/null; then
  echo
  echo "Configuring macOS Dock..."

  dockutil --no-restart --remove all

  killall Dock

  echo "Dock has been setup!"
fi

# map caps lock key to escape
# courtesy of https://stackoverflow.com/a/46460200/19295049
if type hidutil &>/dev/null; then
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
  # TODO: remove once symlink can be handled by aliae
  # symlink launch agent to ensure change isn't lost on reboot
  ln -sf $DOTFILES/scripts/macos/launch_agents/com.boldandbrad.CapsLockEscape.plist ~/Library/LaunchAgents/com.boldandbrad.CapsLockEscape.plist
  launchctl load com.boldandbrad.CapslockEscape.plist
fi
