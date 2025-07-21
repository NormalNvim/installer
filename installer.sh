#!/usr/bin/env sh
#
# NormalNvim installer.
# Supports: Arch, Ubuntu, MacOS, Termux, Fedora, WSL


# Detect OS
IS_ARCH=$(if [ -f /etc/os-release ] && grep -q "NAME=\"Arch Linux\"" /etc/os-release; then echo "true"; else echo "false"; fi)
IS_UBUNTU=$(if [ -f /etc/os-release ] && grep -q "NAME=\"Ubuntu\"" /etc/os-release; then echo "true"; else echo "false"; fi)
IS_MACOS=$(if [ -d /Applications ] && [ -d /System ]; then echo "true"; else echo "false"; fi)
IS_TERMUX=$(if [ -x "$(command -v pkg)" ] && [ -d "$HOME/.termux" ]; then echo "true"; else echo "false"; fi)
IS_FEDORA=$(if [ -f /etc/fedora-release ]; then echo "true"; else echo "false"; fi)

# Currently unused
IS_WSL=$(if grep -q Microsoft /proc/version; then echo "true"; else echo "false"; fi)
IS_NIXOS=$(if [ -d /etc/nixos ] && [ -f /etc/os-release ] && grep -q "NAME=\"NixOS\"" /etc/os-release; then echo "true"; else echo "false"; fi)




## INSTALL NormalNvim
###############################################################################
echo
echo "Welcome to NormalNvim!"
echo "=================================================================="
echo "This installer will ask you for confirmation on every step before:"
echo "=================================================================="
echo "1) Cloning NormalNvim on '~/.config/nvim'."
echo "2) (optional) We will ask you to fork NormalNvim on GitHub, and provide your GitHub username so we can change git remote origin to your fork."
echo "3) (optional) Install system dependencies, to unlock all features."
echo "=================================================================="
echo
echo
echo
echo
echo "Step 1: Cloning NormalNvim on ~/.config/nvim"
echo "------------------------------------------------------------------"
if [ -d ~/.config/nvim ]; then
  echo "ERROR: The directory ~/.config/nvim already exist."
  echo "       Please move it to a different location before installing."
  exit 1
fi
echo "INFO: Installing NormalNvim in '~/.config/nvim'"
git clone https://github.com/NormalNvim/NormalNvim.git ~/.config/nvim
cd ~/.config/nvim || echo 2>&1
echo "------------------------------------------------------------------"
echo "SUCCESS: NormalNvim installed correctly"
echo "------------------------------------------------------------------"
printf "PRESS ENTER TO CONTINUE"
read -r
echo
echo
echo
echo




## DETECT REMOTE ORIGIN
###############################################################################
echo "Step 2: Change git remote origin (optional)"
echo "------------------------------------------------------------------"
echo "* We recommend forking NormalNvim."
echo "* You can do it now."
echo "* We are gonna ask your GitHub username to set your"
echo "  git remote URL to git://github.com/<your_username>/NormalNvim.git"
echo ""
printf "Please, enter your GitHub username [leave blank to skip]: "
read -r github_username

# Check if the username is not empty
if [ -n "$github_username" ]; then
  # Change the remote URL
  git remote set-url origin "git://github.com/$github_username/NormalNvim.git"
  echo "------------------------------------------------------------------"
  echo "SUCCESS: GitHub username provided. You will get updates from:"
  echo "         git://github.com/$github_username/NormalNvim.git"
  echo "------------------------------------------------------------------"
else
  echo "------------------------------------------------------------------"
  echo "SKIPPED: No GitHub username provided. You will get updates from:"
  echo "         git://github.com/NormalNvim/NormalNvim.git"
  echo "------------------------------------------------------------------"
fi
echo
echo
echo
echo




## INSTALL DEPENDENCIES
###############################################################################
echo "Step 3: Install system dependencies (optional)"
echo "------------------------------------------------------------------"
printf "Do you want to install the dependencies? [Y/n]"
read -r answer
answer_lowercase=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
if [ -z "$answer_lowercase" ] || [ "$answer_lowercase" = "y" ] || [ "$answer_lowercase" = "yes" ]; then




  ## ARCH INSTALLER (dependencies)
  #############################################################################
  if [ "$IS_ARCH" = "true" ]; then
    echo "Arch Linux detected."

    # DETECT AUR CLIENT
    # -----------------
    if command -v paru > /dev/null 2>&1; then AUR_CMD="paru -S --needed";
    elif command -v yay > /dev/null 2>&1; then AUR_CMD="yay -S --needed"; fi

    # INSTALL DEPENDENCIES
    # --------------------
    if [ -n "$AUR_CMD" ]; then
      eval "$AUR_CMD" "luarocks python" "yazi" "fd" "git-delta" "grcov" "rustup" "yarn" "python-pytest" "gcc" "binutils" "dotnet-runtime" "dotnet-sdk" "aspnet-runtime" "mono" "jdk-openjdk" "kotlin" "elixir" "npm" "nodejs" "typescript" "make" "go" "nasm" "r" "nuitka" "python" "ruby" "perl" "lua" "pyinstaller" "swift-bin" "flutter-bin" "gcc-fortran" "fortran-fpm-bin" "doxygen" "ldoc" "ruby-yard"; yarn global add "jest" "jsdoc" "typedoc"; cargo install "yazi-fm" "cargo-nextest"; go install "golang.org/x/tools/cmd/godoc@latest"
    else
      echo "ERROR: You must have 'paru' or 'yay' installed so we can use the AUR."
    fi




  # UBUNTU INSTALLER (dependencies)
  #############################################################################
  elif [ "$IS_UBUNTU" = "true" ]; then
    echo "Ubuntu detected."
    sudo apt update; sudo apt install --install-if-missing "luarocks" "yarn" "rust-fd-find" "python-pytest" "delta" "rust-grcov" "rustup" "gcc-defaults" "binutils" "dotnet8" "monodevelop" "java-common" "nasm" "r-base" "rustc" "golang" "python" "ruby" "perl" "lua5.3" "kotlin" "elixir" "make" "nodejs" "npm" "node-typescript" "nuitka" "doxygen" "yard"; pip install "pyinstaller"; yarn global add "jest" "jsdoc" "typedoc"; cargo install "yazi-fm"; go install "golang.org/x/tools/cmd/godoc@latest"; sudo snap install --classic "flutter"




  # MACOS INSTALLER (dependencies)
  #############################################################################
  elif [ "$IS_MACOS" = "true" ]; then
    echo "MacOS detected."
    brew install "luarocks" "fd" "git-delta" "rustup" "yarn" "gcc" "binutils" "dotnet" "mono" "openjdk" "dart-sdk" "kotlin" "elixir" "node" "typescript" "make" "rust" "go" "nasm" "r" "ruby" "perl" "lua" "swift" "pyinstaller" "doxygen"; brew install --cask "dotnet-sdk" "flutter"; pip install "pytest" "Nuitka"; yarn add global "jest" "jsdoc" "typedoc"; cargo install "yazi-fm" "cargo-nextest" "grcov"; go install "golang.org/x/tools/cmd/godoc@latest"




  # TERMUX INSTALLER (dependencies)
  #############################################################################
  elif [ "$IS_TERMUX" = "true" ]; then
    echo "Termux detected."
    pkg update; pkg install "tur-repo"; pkg install "luarocks" "yazi" "python" "fd" "git-delta" "yarn" "mono" "openjdk-17" "dart" "kotlin" "elixir" "nodejs" "make" "rust" "golang" "nasm" "python" "ruby" "perl" "liblua52" "swift" "gcc-default" "binutils-libs" "doxygen"; pip install "pytest" "Nuitka" "pyinstaller"; yarn add global "jest" "typescript" "jsdoc" "typedoc"; cargo install "cargo-nextest" "git-delta" "grcov"; go install "golang.org/x/tools/cmd/godoc@latest"




  # FEDORA INSTALLER (dependencies)
  #############################################################################
  elif [ "$IS_FEDORA" = "true" ]; then
    echo "Fedora detected."
    sudo dnf install "luarocks" "rust-fd-find" "rust-git-delta" "rustup" "python3-pytest" "gcc" "binutils" "dotnet6.0" "dotnet-runtime-6.0" "dotnet-sdk-6.0" "aspnetcore-runtime-6.0" "mono-complete" "java-21-openjdk" "elixir" "nodejs" "npm" "typescript" "make" "golang" "nasm" "R-rlang" "ruby" "perl" "lua" "swift-lang" "gcc-gfortran" "doxygen" "lua-ldoc" "rubygem-yard"; pip install "pytest" "Nuitka" "pyinstaller"; npm install -g "yarn" "jest" "typescript" "jsdoc" "typedoc"; cargo install "yazi-fm" "cargo-nextest" "grcov"; go install "golang.org/x/tools/cmd/godoc@latest"




  # ERROR: OS NOT DETECTED
  #############################################################################
  else
    echo "ERROR: It seems your OS is not Arch Linux, Ubuntu, MacOS, Termux, or Fedora."
    echo "Your OS is not directly supported."
    echo "But you can still read the wiki and install the dependencies manually."
  fi




fi # End of install dependencies




# SUCCESS MESSAGE
###############################################################################
echo
echo
echo
echo
echo "NormalNvim has been correctly installed"
echo "========================================"
echo "The first time you open NormalNvim, it will install the next things concurrently:"
echo ""
echo "* PLUGINS:    → You can remove from your config the ones you don't want later."
echo "* MASON:      → Pre-configured LSP servers, linters, formatters and debuggers."
echo "* TREESITTER: → For improved syntax highlighting."
echo ""
echo "========================================"
echo "PRESS ENTER TO OPEN IT"
nvim -c ':MasonInstall ansible-language-server angular-language-server asm-lsp asmfmt bash-debug-adapter bash-language-server checkmake codelldb clangd cmakelint csharpier cucumber-language-server debugpy delve docker-compose-language-service dockerfile-language-server elixir-ls eslint-lsp fantomas findent firefox-debug-adapter fortls fsautocomplete golangci-lint golangci-lint-langserver gopls google-java-format helm-ls html-lsp java-test json-lsp jq jsonlint kotlin-debug-adapter kotlin-language-server ktlint lua-language-server marksman matlab-language-server neocmakelsp netcoredbg omnisharp perlnavigator php-debug-adapter phpactor php-cs-fixer phpstan rubocop pyright autopep8 rust-analyzer selene shellcheck shfmt svelte-language-server stylua taplo typescript-language-server yaml-language-server yamllint yamlfmt zls' -c ':TSInstall all' 2>&1
