# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Homebrew
if [[ -d /usr/local/bin ]]; then
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

if [[ -d /opt/homebrew/sbin ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# Composer
export PATH="/opt/composer/bin:${HOME}/.composer/vendor/bin:${PATH}"

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Add path to binaries from mysql@5.7 formula
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# add pipx binaries to the path
export PATH="${HOME}/.local/bin:$PATH"

# Custom binaries
export PATH="$HOME/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$HOME/.rvm/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add pyenv shims
eval "$(pyenv init --path)"
