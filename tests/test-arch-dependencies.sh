#!/usr/bin/env sh
#
# NormalNvim test to ensure all dependencies install correctly on arch linux




# DETECT AUR CLIENT
# -----------------
if command -v paru > /dev/null 2>&1; then AUR_CMD="paru -S --needed --noconfirm";
elif command -v yay > /dev/null 2>&1; then AUR_CMD="yay -S --needed --noconfirm"; fi

# INSTALL DEPENDENCIES
# --------------------
if [ -n "$AUR_CMD" ]; then

  echo "------------------------"
  echo "NormalNvim dependencies"
  echo "------------------------"
  "$AUR_CMD" ranger-git \
  python-pynvim \
  fd \
  git-delta \
  grcov \
  rustup \
  yarn \
  python-pytest
  yarn global add jest
  cargo install cargo-nextest
  printf '\n\n\n\n'

  echo "----------------------------"
  echo "Compiler.nvim dependencies"
  echo "----------------------------"
  "$AUR_CMD" \
  mingw-w64 \
  dotnet-runtime \
  dotnet-sdk \
  aspnet-runtime-bin \
  mono \
  jdk-openjdk \
  dart \
  kotlin \
  elixir \
  npm \
  nodejs \
  typescript \
  make \
  go \
  nasm \
  r \
  nuitka \
  pyinstaller \
  python \
  ruby \
  perl \
  lua \
  swift-bin
  printf '\n\n\n\n'

  echo "------------------------"
  echo "Dooku.nvim dependencies"
  echo "------------------------"
  "$AUR_CMD" \
  doxygen
  go install golang.org/x/tools/cmd/godoc@latest
  yarn global add typedoc jdoc
else
  echo "ERROR: You must have 'paru' or 'yay' installed so we can use the AUR."
fi
