# Appearance
echo "Setting graphite menus, blue highlight..."
## Graphite appearance
defaults write -g 'AppleAquaColorVariant' -int 6

# Light sensor
echo "Preventing ambient light sensor from playing havoc with brightness..."
## Disable display auto brightness
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
## Disable keyboard auto brightness
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false

# Dock
echo "Setting dock to hidden left middle, small, no animations, etc..."
## Place dock on left middle
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock pinning -string "middle"
## No dock application bouncing
defaults write com.apple.dock no-bouncing -bool true
## Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true
## Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36
## Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
## Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true
## Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
## Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
killall Dock

# Mission Control
echo 'Disabling Mission Control...'
## No dashboard screen space
defaults write com.apple.dashboard dashboard-enabled-state 1
## Don't reorder spaces based on recently used
defaults write com.apple.dock mru-spaces -bool false

# Trackpad
echo "Setting trackpad to tap to click/drag..."
## Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
## Allow dragging (on tap-drag)
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
## Disable the Launchpad gesture
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Keyboard
echo "Setting caps lock to control, spelling preferences..."
## No autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
## Spellcheck in real English ;)
defaults write NSGlobalDomain NSPreferredSpellServerLanguage en_GB

# Screenshots
echo "Setting screenshots to store .png to desktop..."
## Save to desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
## Save PNGs
defaults write com.apple.screencapture type -string "png"
## Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Sound
echo "Setting annoying sounds to off..."
## Disable boot sound effext
sudo nvram SystemAudioVolume="%00"
## No UI sounds - finder paste, trash, etc.
defaults write com.apple.systemsound 'com.apple.sound.uiaudio.enabled' -int 0

# Finder
echo "Setting Finder to expand, cleaning up sidebar, displaying info in status/title bar..."
## Don't hide ~/Library
chflags nohidden ~/Library
## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
## Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
## Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true
## Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
## Show path bar
defaults write com.apple.finder ShowPathbar -bool true
## Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
## Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
## Use column view
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder MyDocsLibrarySavedViewStyle -string "clmv"
## Hide tags
defaults write com.apple.finder ShowRecentTags -int 0
## Don't show disks on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
## Set default location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
## Setup sidebar
defaults write com.apple.sidebarlists "networkbrowser" "{
    Controller=CustomListItems;
    CustomListItems=();
    CustomListProperties={
        \"com.apple.NetworkBrowser.backToMyMacEnabled\"=0;
        \"com.apple.NetworkBrowser.bonjourEnabled\"=0;
        \"com.apple.NetworkBrowser.connectedEnabled\"=0;
    };
}"
osascript << 'END'
tell application "System Events"
    tell property list file "~/Library/Preferences/com.apple.sidebarlists.plist"
        tell property list item "systemitems"
            set value of property list item "ShowEjectables" to false
            set value of property list item "ShowHardDisks" to true
            set value of property list item "ShowRemovable" to true
            set value of property list item "ShowServers" to true
        end tell
    end tell
end tell
END
killall Finder
## Show ~/Library
chflags nohidden "${HOME}/Library"

# Printing
echo "Setting print menu to expand, application to close on finish..."
## Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
## Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Text
echo "Setting 'smart' quotes/dashes to off..."
## Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
## Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Locale
echo "Setting language and locale options..."
## Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=GBP"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Users
## Disable guest
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist "GuestEnabled" -bool false
defaults write com.apple.AppleFileServer guestAccess -bool false
defaults write oom.apple.smb.server AllowGuestAccess -bool false
## Immediate require password
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
## Ask for username on login
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true

# Misc application mgmt
echo "Setting application warnings off, no terminate inactive, and auto updates..."
## Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
## Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
## Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"
## Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
