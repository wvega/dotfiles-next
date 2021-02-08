# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Composer
export PATH="${HOME}/.composer/vendor/bin:${PATH}"

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Add path to binaries from mysql@5.7 formula
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Custom binaries
export PATH="$HOME/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"
