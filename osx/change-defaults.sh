#!/bin/bash

set -eux
# Make TextEdit open with a blank file by default
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# Show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Sort folders first
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Add Quit menu to Finder
defaults write com.apple.finder QuitMenuItem -bool true

# Avoid creating .DS_Store files
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Make ~/Library visible
chflags nohidden ~/Library

# Show attachments as icons in Mail.app
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes

# Disable press and hold feature
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable the Input Source popup in Sonoma
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0
