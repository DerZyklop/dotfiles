#!/bin/sh

for f in ./init/osx/*; do
  $f

  echo "${green}Want to set preferences for $(basename $f .sh)?"
  read -p "Should i? [yN] ${reset}" -n 1 -r
  echo "\nAllright!"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh $f
  fi
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
