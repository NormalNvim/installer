#!/usr/bin/env bash
#
# NormalNvim test to check if all arch linux AUR dependencies still exist.


# Imports
source "$(dirname "$0")/test-utils.sh" # Functions to check packages


# CHECK DEPENDENCIES
# -----------------------------------------------------------------------------

echo "------------------------------------"
echo "NormalNvim dependencies - Arch Linux"
echo "------------------------------------"
# pacman
echo "- Pacman packages -"
dependencies=(
    "python"
    "python-pynvim"
    "fd"
    "git-delta"
    "grcov"
    "rustup"
    "yarn"
    "python-pytest"
)
check_arch_dependencies "${dependencies[@]}" || exit 1

# npm
printf '\n%s\n' "- NPM packages -"
dependencies=(
    "jest"
)
check_npm_dependencies "${dependencies[@]}" || exit 1

# cargo
printf '\n%s\n' "- Cargo packages -"
dependencies=(
    "cargo-nextest"
)
check_cargo_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "--------------------------"
echo "Compiler.nvim dependencies"
echo "--------------------------"
# pacman
echo "- Pacman packages -"
dependencies=(
    "mingw-w64-gcc" # includes mingw-w64-bintools whish has 'ld'
    "dotnet-runtime"
    "dotnet-sdk"
    "aspnet-runtime"
    "mono"
    "jdk-openjdk"
    "dart"
    "kotlin"
    "elixir"
    "npm"
    "nodejs"
    "typescript"
    "make"
    "go"
    "nasm"
    "r"
    "nuitka"
    "python"
    "ruby"
    "perl"
    "lua"
)
check_arch_dependencies "${dependencies[@]}" || exit 1

# aur
printf '\n%s\n' "- AUR packages -"
dependencies=(
    "pyinstaller"
    "swift-bin"
)
check_aur_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "-----------------------"
echo "Dooku.nvim dependencies"
echo "-----------------------"
# pacman
echo "- Pacman packages -"
dependencies=(
    "doxygen"
)
check_arch_dependencies "${dependencies[@]}" || exit 1

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
