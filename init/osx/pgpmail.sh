#!/usr/bin/env bash

###############################################################################
# GPGMail 2                                                                   #
###############################################################################

echo 'Setting up GPGMail'

# Disable signing emails by default
defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false
