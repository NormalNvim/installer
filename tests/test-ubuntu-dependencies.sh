#!/usr/bin/env bash
#
# NormalNvim test to check if all Ubuntu dependencies still exist.


# Imports
source "$(dirname "$0")/test-utils.sh" # Functions to check packages



# CHECK DEPENDENCIES
# -----------------------------------------------------------------------------


echo "--------------------------------"
echo "NormalNvim dependencies - Ubuntu"
echo "--------------------------------"
# ubuntu
echo "- Ubuntu packages -"
dependencies=(
    "luarocks"
    "yarn"
    "rust-fd-find"
    "python-pytest"
    "delta"
    "rust-grcov"
    "rustup"
)
check_ubuntu_dependencies "${dependencies[@]}" || exit 1

# npm
printf '\n%s\n' "- NPM packages -"
dependencies=(
    "jest"
)
check_npm_dependencies "${dependencies[@]}" || exit 1

# cargo
printf '\n%s\n' "- Cargo packages -"
dependencies=(
    "yazi-fm"
)
check_cargo_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'

echo "--------------------------"
echo "Compiler.nvim dependencies"
echo "--------------------------"
# ubuntu
echo "- Ubuntu packages -"
dependencies=(
    "gcc-defaults" # has gfortran
    "binutils" # contains ld (as we don't use mingw)
    "dotnet8"
    "monodevelop"
    "java-common" # default-jdk
    "nasm"
    "r-base"
    "rustc"
    "golang"
    "python"
    "ruby"
    "perl"
    "lua5.3"
    "kotlin"
    "elixir"
    "make"
    "nodejs"
    "npm"
    "node-typescript"
    "nuitka"
)
check_ubuntu_dependencies "${dependencies[@]}" || exit 1

# snap
printf '\n%s\n' "- Snap packages -"
dependencies=(
    "flutter"
)
check_snap_dependencies "${dependencies[@]}" || exit 1

# python
printf '\n%s\n' "- Python packages -"
dependencies=(
    "pyinstaller" # Will probably provoke a warning on ubuntu, since PEP 688
)
check_python_dependencies "${dependencies[@]}" || exit 1

# You can install dart (but we won't)
# wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg  --dearmor -o /usr/share/keyrings/dart.gpg
# echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
# sudo apt-get update && sudo apt-get install dart
printf '\n\n\n\n'

echo "-----------------------"
echo "Dooku.nvim dependencies"
echo "-----------------------"
# pacman
echo "- Pacman packages -"
dependencies=(
    "doxygen"
    "yard"
)
check_ubuntu_dependencies "${dependencies[@]}" || exit 1

# npm
printf '\n%s\n' "- NPM packages -"
dependencies=(
    "jsdoc"
    "typedoc"
)
check_npm_dependencies "${dependencies[@]}" || exit 1

# go
printf '\n%s\n' "- Go packages -"
dependencies=(
    "godoc"
)
check_go_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "-------------------------------"
echo "SUCCESS: All deps are available"
echo "-------------------------------"
