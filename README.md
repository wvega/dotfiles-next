# Setup macOS

## Add the user's home directory to the Favorites sidebar

1. Open Finder settings and go to the Sidebar tab
2. Check the box for the home directory

## Set the default directory for new Finder windows

```bash
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads"
```

## Show items ordered by Date Added

```bash
defaults write com.apple.finder FXPreferredGroupBy -string "Date Added"
```

## Search the current folder when performing a search

```bash
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
```

## Move the dock to the left side of the screen

```bash
defaults write com.apple.dock orientation left
```

## Reduce the size of the icons

```bash
defaults write com.apple.dock tilesize -int 25
```

## Automatically hide the dock
```bash
defaults write com.apple.dock autohide -bool true
```

## Make the animation faster

```bash
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
```

## Apply all changes

```bash
killall Dock
```

# Accept Xcode license

## Install Xcode and Xcode Command Line Tools

- Install Xcode from the App Store
- Run `xcode-select —install` to install Xcode Command Line Tools
- Run `sudo xcode-select -r`

## Accept license

```bash
#!/bin/bash
# vim: set syntax=bash

if [ ! -f /usr/bin/xcodebuild ]; then
	echo "xcodebuild was not found. No need to accept Xcode and Apple SDKs agreement."
	exit 0
fi

# the section below was extracted from https://stackoverflow.com/a/60906147

XCODE_VERSION=`xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/'`
ACCEPTED_LICENSE_VERSION=`defaults read /Library/Preferences/com.apple.dt.Xcode 2> /dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2`

if [ "$XCODE_VERSION" != "$ACCEPTED_LICENSE_VERSION" ]; then
        echo "Accepting Xcode and Apple SDKs agreement"
        sudo xcodebuild -license accept
fi
```

# Setup Homebrew

## Install Homebrew

Vist https://brew.sh and run the installation script.

## Install Git

```zsh
brew install git
```

## Install remaining dependencies from the Brewfile

```zsh
brew bundle --verbose --file=homebrew/Brewfile
```

# Other Tools

## Create the `bin` directory

```zsh
mkdir -p "${HOME}/bin"
```

## Install `wpv`

```bash
curl --output "${HOME}/bin/wpv" https://raw.githubusercontent.com/smilingrobots/wpv/master/wpv.sh
chmod u+x "${HOME}/bin/wpv"
```

## Add `symlink` command

```
ln -s "${PWD}/.dotfiles/symlink" "${HOME}/bin/symlink"
```

## Add `plutil-upsert` command

```
symlink .dotfiles/plutil-upsert "${HOME}/bin"
```

## Add `php-cs-fixer-safe` command

```
symlink bin/php-cs-fixer-safe "${HOME}/bin"
```

# Setup Git

## Create directory to store configurations

```bash
mkdir -p "${HOME}/.git.d"
```

## Symlink public configuration files

```bash
for file in git/git.d/*.gitconfig; do
    symlink "${file}" "${HOME}/.git.d/$(basename $file)"
done
```

## Symlink private configuration files

```bash
for file in private/git/git.d/*.gitconfig; do
    symlink "${file}" "${HOME}/.git.d/$(basename $file)"
done
```

## Symlink `gitconfig` and `gitignore` files

```bash
symlink "git/gitconfig" "${HOME}/.gitconfig"
symlink "git/gitignore" "${HOME}/.gitignore"
```

# Setup ZSH

## Create `.myzsh`

```bash
mkdir -p "${HOME}/.myzsh"
```

## Symlink auxiliary configuration files

```bash
for file in zsh/*.zsh; do
    symlink "${file}" "${HOME}/.myzsh/$(basename $file)"
done
```

## Symlink private auxiliary configuration files

```bash
symlink "private/zsh" "${HOME}/.myzsh/private"
```

## Symlink `.zshrc`

```bash
symlink "zsh/zshrc" "${HOME}/.zshrc"
```

## Set appropriate permissions for directories that contain completion functions

### Apple Sillicon

```bash
chmod -R 755 /opt/homebrew/share/zsh
chmod -R 755 /opt/homebrew/share/zsh/site-functions
```

### Intel

```bash
chmod -R 755 /usr/local/share/zsh
chmod -R 755 /usr/local/share/zsh/site-functions
```

# Setup iTerm2

## Default Profile

### Set the **Working Directory** setting to use an Advanced Configuration: use current directory for panes and home dir for everything else

```bash
plutil-upsert "New Bookmarks.0.Custom Directory" -string "Advanced" ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.AWDS Pane Option" -string "Recycle" ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Set JetBrains Mono Regular `13` as the font

```bash
plutil-upsert "New Bookmarks.0.Normal Font" -string "JetBrainsMono-Regular 13" ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Configure the Window to use `180` columns and `44` rows

```bash
plutil-upsert "New Bookmarks.0.Columns" -integer 180 ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.Rows" -integer 44 ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Move between words using ⌥← and ⌥→

Follow the instructions from http://superuser.com/a/726781 or execute the following instructions:

```bash
plutil-upsert "New Bookmarks.0.Option Key Sends" -integer 2 ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.Keyboard Map.0xf702-0x280000-0x0" -json '{"Action": 10, "Label":"", "Text": "b"}' ~/Library/Preferences/com.googlecode.iterm2.plist
plutil-upsert "New Bookmarks.0.Keyboard Map.0xf703-0x280000-0x0" -json '{"Action": 10, "Label":"", "Text": "f"}' ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -remove "New Bookmarks.0.Keyboard Map.0xf702-0x280000" ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -remove "New Bookmarks.0.Keyboard Map.0xf703-0x280000" ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Do not confirm to quit iTerm2

```bash
plutil-upsert "PromptOnQuit" -integer 0 ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Quit iTerm2 when all windows are closed

```bash
plutil-upsert "QuitWhenAllWindowsClosed" -integer 1 ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Other settings

- Use `Light Background` as the color preset
- Set the **Scrollback lines** setting to `3000`

# Setup Composer

## Install

First, prepare the installation directory:

```bash
sudo mkdir -p /opt/composer/bin
sudo chown -R "${USER}:admin" /opt/composer
```

```bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt/composer/bin --filename=composer
```

## Add the global `composer.json` and `compose.lock` files

```bash
mkdir -p "${HOME}/.composer"
symlink "composer/composer.json" "${HOME}/.composer/composer.json"
symlink "composer/composer.lock" "${HOME}/.composer/composer.lock"
```

## Install global Composer packages

```bash
composer global install
```
