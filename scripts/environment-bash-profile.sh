# .bash_profile fragment that loads the system environment.

# Rust via cargo.rs.
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  . "$HOME/.cargo/env"
fi

# Homebrew on macOS arm64.
if [ -d /opt/homebrew/bin ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew on macOS x64.
if [ -d "$HOME/.homebrew" ]; then
  eval "$($HOME/.homebrew/bin/brew shellenv)"
fi

# Homebrew on Linux.
if [ -d /home/linuxbrew/.linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
if [ -d "$HOME/.linuxbrew" ]; then
  eval "$($HOME/.linuxbrew/bin/brew shellenv)"
fi

# nvm.
if [ -d "$HOME/.nvm" ]; then
  . "$HOME/.nvm/nvm.sh"
  . "$HOME/.nvm/bash_completion"
fi
