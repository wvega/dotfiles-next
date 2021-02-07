# set the default directory for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads"

# show items ordered by Date Added
defaults write com.apple.finder FXPreferredGroupBy -string "Date Added"

# search the current folder when performing a search
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# move the dock to the left side of the screen
defaults write com.apple.dock orientation left

# reduce the size of the icons
defaults write com.apple.dock tilesize -int 25

# automatically hide the dock
defaults write com.apple.dock autohide -bool true

# make the animation faster
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3

killall Dock
