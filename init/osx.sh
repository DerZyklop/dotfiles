#!/usr/bin/env bash

# ~/.osx — https://mths.be/osx

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for f in ./osx/*; do
  sh $f
done

###############################################################################
# Kill affected applications                                                  #
###############################################################################

# for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
#   "Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "Spectacle" \
#   "SystemUIServer" "Terminal" "Transmission" "Twitter" "iCal"; do
#   killall "${app}" > /dev/null 2>&1
# done
# echo "Done. Note that some of these changes require a logout/restart to take effect."
