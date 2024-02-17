#!/usr/bin/env sh
#
# NormalNvim installer.
# Supports: Arch, Ubuntu, MacOS, Termux


# Detect OS
IS_ARCH=$(if [ -f /etc/os-release ] && grep -q "NAME=\"Arch Linux\"" /etc/os-release; then echo "true"; else echo "false"; fi)
IS_UBUNTU=$(if [ -f /etc/os-release ] && grep -q "NAME=\"Ubuntu\"" /etc/os-release; then echo "true"; else echo "false"; fi)
IS_MACOS=$(if [ -d /Applications ] && [ -d /System ]; then echo "true"; else echo "false"; fi)
IS_TERMUX=$(if [ -x "$(command -v pkg)" ] && [ -d "$HOME/.termux" ]; then echo "true"; else echo "false"; fi)

# Currently unused
IS_WSL=$(if grep -q Microsoft /proc/version; then echo "true"; else echo "false"; fi)
IS_FEDORA=$(if [ -f /etc/fedora-release ]; then echo "true"; else echo "false"; fi)
IS_NIXOS=$(if [ -d /etc/nixos ] && [ -f /etc/os-release ] && grep -q "NAME=\"NixOS\"" /etc/os-release; then echo "true"; else echo "false"; fi)




## INSTALL NormalNvim
###############################################################################
echo "Welcome to NormalNvim!"
echo "=================================================================="
echo "This installer will ask you for confirmation on every step before:"
echo "=================================================================="
echo "1) Clone NormalNvim on '~/.config/nvim'."
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
  echo "ERROR: The directory '~/.config/nvim' already exist. "\
    "Please move it to a different location before installing NormalNvim."
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
  echo "SKIPPED: No GitHub username provided. You will get updated from:"
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
read answer
answer_lowercase=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
if [ -z "$answer_lowercase" ] || [ "$answer_lowercase" = "y" ] || [ "$answer_lowercase" = "yes" ]; then




  ## ARCH INSTALLER (dependencies)
  #############################################################################
  if [ "$IS_ARCH" = "true" ]; then
    echo "Arch Linux detected."

    # DETECT AUR CLIENT
    # -----------------
    if command -v paru > /dev/null 2>&1; then AUR_CMD="paru";
    elif command -v yay > /dev/null 2>&1; then AUR_CMD="yay"; fi

    # INSTALL DEPENDENCIES
    # --------------------
    if [ -n "$AUR_CMD" ]; then
      "$AUR_CMD" -S --needed ranger-git python-pynvim fd git-delta grcov rustup yarn python-pytest dotnet-sdk swift-bin && yarn global add jest typedoc jdoc && cargo install cargo-nextest && "$AUR_CMD" -S --needed mingw-w64 dotnet-runtime dotnet-sdk aspnet-runtime-bin mono jdk-openjdk dart kotlin elixir npm nodejs typescript make go nasm r nuitka pyinstaller python ruby perl lua doxygen && go install golang.org/x/tools/cmd/godoc@latest
    else
      echo "ERROR: You must have 'paru' or 'yay' installed so we can use the AUR."
    fi




  # UBUNTU INSTALLER (dependencies)
  #############################################################################
  elif [ "$IS_UBUNTU" = "true" ]; then
    echo "Ubuntu detected."
    sudo apt update && sudo apt install yarn ranger fd-find && pip install pynvim pytest && yarn add global jest typedoc jdoc && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && cargo install git-delta grcov && wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && chmod +x ./dotnet-install.sh && ./dotnet-install.sh && rm -f ./dotnet-install.sh && sudo apt install mingw-w64 dotnet-sdk-7.0 mono-complete default-jdk nasm r-base rustc golang-go python ruby perl lua5.3 kotlin elixir make nodejs npm doxygen && sudo npm install -g typescript && pip install pyinstaller && pip install nuitka && go install golang.org/x/tools/cmd/godoc@latest && sudo snap install dart flutter --classic && wget https://swift.org/builds/swift-5.5-release/ubuntu2004/swift-5.5-RELEASE/swift-5.5-RELEASE-ubuntu20.04.tar.gz && tar -xzf swift-5.5-RELEASE-ubuntu20.04.tar.gz && sudo mv swift-5.5-RELEASE-ubuntu20.04 /opt/swift && export PATH=/opt/swift/usr/bin:"${PATH}"




  # MACOS INSTALLER (dependencies)
  #############################################################################
  elif [ "$IS_MACOS" = "true" ]; then
    echo "MacOS detected."
    brew tap dart-lang/dart flutter/flutter homebrew/cask && brew install rustup-init yarn ranger pynvim pytest fd rip-delta && cargo install grcov && yarn add global jest typedoc jdoc && brew install --cask dotnet-sdk flutter && brew install mingw-w64 dotnet mono openjdk rust go nasm r pyinstaller python perl lua dart kotlin elixir node typescript swift make doxygen && pip install nuitka && go install golang.org/x/tools/cmd/godoc@latest




  # IS_TERMUX (dependencies)
  #############################################################################
  elif [ "$IS_TERMUX" = "true" ]; then
    echo "Termux detected."
    pkg install -y clang ranger binutils fd yarn rust swift && pip install pynvim pytest nuitka pyinstaller && yarn add global jest typedoc jdoc && pkg install -y dotnet-sdk mono openjdk-17 kotlin rust golang nasm python ruby perl lua53 dart nodejs elixir make doxygen && npm install -g typescript && go install golang.org/x/tools/cmd/godoc@latest && cargo install git-delta grcov




  # ERROR: OS NOT DETECTED
  #############################################################################
  else
    echo "ERROR: It seems your OS is not Arch Linux, Ubuntu, MacOS or Termux."
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
nvim -c ':NvimUpdatePlugins' -c ':MasonInstall lua-language-server prettierd eslint-lsp typescript-language-server css-lsp asm-lsp netcoredbg json-lsp codelldb firefox-debug-adapter chrome-debug-adapter rust-analyzer clangd omnisharp bash-language-server shellcheck jedi-language-server pylama flake8 autopep8 autoflake debugpy ruby-lsp taplo ktlint yaml-language-server neocmakelsp angular-language-server ansible-language-server dockerfile-language-server docker-compose-language-service helm-ls fsautocomplete fantomas perlnavigator kotlin-language-server svelte-language-server phpactor stylua csharpier bash-debug-adapter asmfmt java-test google-java-format dart-debug-adapter gopls golangci-lint gofumpt golangci-lint-langserver kotlin-debug-adapter rubocop beautysh gersemi cmakelint eslint_d markuplint php-cs-fixer phpstan delve matlab-language-server zls elixir-ls php-debug-adapter' -c ':TSInstall all' 2>&1
