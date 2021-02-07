#!/bin/bash
# vim: set syntax:bash

echo "Updating iTerm2 preferences"

if [ ! -f ~/Library/Preferences/com.googlecode.iterm2.plist ]; then
	echo "No changes were made becuase ~/Library/Preferences/com.googlecode.iterm2.plist doesn't exist."
	echo "Please open the Preferences window in iTerm2 to create that file and try running this script again."
fi

# set the width and height for new windows
plutil-upsert "New Bookmarks.0.Columns" -integer 180 ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.Rows" -integer 44 ~/Library/Preferences/com.googlecode.iterm2.plist

# configure the default font
plutil-upsert "New Bookmarks.0.Normal Font" -string "JetBrainsMono-Regular 12" ~/Library/Preferences/com.googlecode.iterm2.plist

# use the directory from the previous session as the working directory on new panes
plutil-upsert "New Bookmarks.0.Custom Directory" -string "Advanced" ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.AWDS Pane Option" -string "Recycle" ~/Library/Preferences/com.googlecode.iterm2.plist

# use Option+Arrow to move between words
plutil-upsert "New Bookmarks.0.Option Key Sends" -integer 2 ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.Keyboard Map.0xf702-0x280000-0x0" -json '{"Action": 10, "Label":"", "Text": "b"}' ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.Keyboard Map.0xf703-0x280000-0x0" -json '{"Action": 10, "Label":"", "Text": "f"}' ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -remove "New Bookmarks.0.Keyboard Map.0xf702-0x280000" ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -remove "New Bookmarks.0.Keyboard Map.0xf703-0x280000" ~/Library/Preferences/com.googlecode.iterm2.plist

# do not confirm to quit iTerm2
plutil-upsert "PromptOnQuit" -integer 0 ~/Library/Preferences/com.googlecode.iterm2.plist

# quit iTerm2 when all windows are closed
plutil-upsert "QuitWhenAllWindowsClosed" -integer 1 ~/Library/Preferences/com.googlecode.iterm2.plist
