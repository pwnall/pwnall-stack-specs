#!/bin/sh

# Fulfills environment.md's promises.

set -e  # Exit on errors.
set -u  # Exit on undefined variables.

# OS packages for Debian / Ubuntu.
if command -v apt >/dev/null 2>&1; then
  sudo apt update

  # Homebrew dependencies. Also generally good for building.
  sudo apt install -y build-essential curl file git procps

  # Android AOSP dependencies
  sudo apt install -y bison flex fontconfig gnupg \
      libc6-dev-i386 libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils \
      x11proto-core-dev xsltproc unzip zip zlib1g-dev
fi

# Homebrew for Linux.
if [ "$(uname -s)" = "Linux" ]; then
  if [ ! -d "/home/linuxbrew/.linuxbrew" ]; then
    # Graceful fallback on systems with readonly /home.
    sudo mkdir -p /home/linuxbrew/.linuxbrew >/dev/null 2>&1 | true

    if [ -d "/home/linuxbrew/.linuxbrew" ]; then
      sudo chown "$(id -u -n):$(id -g -n)" "/home/linuxbrew/.linuxbrew"
      sudo chmod 775 "/home/linuxbrew/.linuxbrew"
      git clone --depth=1 https://github.com/Homebrew/brew.git "/home/linuxbrew/.linuxbrew"
    else
      if [ ! -d "$HOME/.linuxbrew" ]; then
        # Graceful fallback on systems with readonly /home.
        mkdir -p "$HOME/.linuxbrew"
        git clone --depth=1 https://github.com/Homebrew/brew.git "$HOME/.linuxbrew"
      fi
    fi
  fi
fi

# Rust via rustup.rs
if [ ! -d "$HOME/.cargo" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
      sh -s -- --profile default --default-toolchain stable --no-modify-path -y
fi

# Make Rust available to the rest of the script.
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  . "$HOME/.cargo/env"
  rustup update
fi

# uv for Python
if [ ! -f "$HOME/.cargo/bin/uv" ]; then
  cargo install --locked uv
fi

# nvm for Node.js
if [ ! -d "$HOME/.nvm" ]; then
  git clone https://github.com/nvm-sh/nvm.git "$HOME/.nvm"
fi

# Make nvm available to the rest of the script.
if [ -d "$HOME/.nvm" ]; then
  . "$HOME/.nvm/nvm.sh"
  . "$HOME/.nvm/bash_completion"
fi

# Node.js
nvm install stable
