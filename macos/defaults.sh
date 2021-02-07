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
