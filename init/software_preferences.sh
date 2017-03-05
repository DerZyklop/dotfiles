#!/bin/sh

echo "⬇${purple} ./init/software_preferences.sh${reset}"

for f in ./init/osx/*; do
  read -p "${green}Should i set preferences for $(basename $f .sh)? [yN] ${reset}" -n 1 -r
  echo "\nAllright!"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "·${purple} sh $f${reset}"
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
