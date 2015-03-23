#!/usr/bin/env bash

###############################################################################
# Sublime Text                                                                #
###############################################################################

# Install Sublime Text settings
#cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null
# Set Sublime Text as default plain text editor

defaults write com.apple.LaunchServices LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'
