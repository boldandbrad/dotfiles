#!/bin/zsh

################################################################
# macos/config_system.sh - set macOS system settings           #
################################################################
# Setup macOS system specific settings and configurations.     #
################################################################

# quit any active System Settings windows to avoid overriding settings
osascript -e 'tell application "System Settings" to quit'

# hush terminal login messages
touch ~/.hushlogin

# set desktop wallpaper
# NOTE: this may cause macOS to prompt the user to provide their terminal emulator with home folder access
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"~/Dotfiles/assets/wallpapers/apple-black-4k.png\" as POSIX file"
echo "Set desktop wallpaper!"

# map caps lock key to escape - courtesy of https://stackoverflow.com/a/46460200/19295049
if type hidutil &>/dev/null; then
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
  launchctl load com.boldandbrad.CapslockEscape.plist
fi
echo "Mapped Caps Lock to Esc!"

################################################################
# macOS system settings                                        #
################################################################

# general #

# TODO: nightshift sunset to sunrise

# TODO: date format to YYYY-MM-DD

# TODO: double click title bar to minimize

# TODO: enable stage manager

# TODO: don't prefer tabs when opening documents

# TODO: ask to keep changes when closing documents

# TODO: don't automatically rearrange spaces based on recent use

# TODO: don't start screensaver when inactive

# TODO: require password immediately

# TODO: enable dictation

# dock #

# dock icon size
defaults write com.apple.dock "tilesize" -int "36"
# autohide dock
defaults write com.apple.dock "autohide" -bool "true"
# autohide dock instantly
defaults write com.apple.dock "autohide-time-modifier" -float "0"
# do not show recent items in dock
defaults write com.apple.dock "show-recents" -bool "false"
# set window minimize animation effect
defaults write com.apple.dock "mineffect" -string "scale"
# clear macOS dock - courtesy of https://stackoverflow.com/a/56137655
defaults delete com.apple.dock persistent-apps
killall Dock

# finder #

# TODO: show hidden files

# show file extensions in finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# show finder pathbar
defaults write com.apple.finder "ShowPathbar" -bool "true"
# sort folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
# open folders in new windows
defaults write com.apple.finder "FinderSpawnTab" -bool "false"
# do not display warning when changing file extensions
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
# TODO: show Connected Servers on desktop

# TODO: new finder windows show Documents

# TODO: set sidebar items -> Home, Dotfiles, Docuemnts, Developer, Applications, Desktop, Pictures, Music, Movies, AirDrop, Downloads

# TODO: search the current folder

killall Finder

# menubar & control center #

# TODO: don't show display, sound, siri, spotlight, or now playing in menubar

# TODO: show bluetooth in menubar

# TODO: show battery in control center

# TODO: show music recognition in control center

# flash time separator
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true"
killall SystemUIServer

# mouse & trackpad #

# TODO: pointer size

# TODO: pointer outline and fill colors

# max mouse cursor speed - requires restart
defaults write NSGlobalDomain com.apple.mouse.scaling -float "3"
# enable tap to click
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool "true"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "true"

# keyboard #

# enable moving ui focus via tab and shift tab
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

echo "macOS configured! Restart may be required for all changes to take place."
