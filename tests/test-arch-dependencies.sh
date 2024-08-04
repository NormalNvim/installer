#!/usr/bin/env bash
#
# NormalNvim test to check if all arch linux dependencies still exist.


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
    "luarocks"
    "python"
    "fd"
    "git-delta"
    "grcov"
    "rustup"
    "yazi"
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
    "gcc"
    "binutils" # contains ld (as we don't use mingw)
    "dotnet-runtime"
    "dotnet-sdk"
    "aspnet-runtime"
    "mono"
    "jdk-openjdk"
    "kotlin"
    "elixir"
    "npm"
    "nodejs"
    "typescript"
    "make"
    "go"
    "nasm"
    "r"
    "python"
    "ruby"
    "perl"
    "lua"
    "gcc-fortran"
)
check_arch_dependencies "${dependencies[@]}" || exit 1

# aur
printf '\n%s\n' "- AUR packages -"
dependencies=(
    "pyinstaller"
    "nuitka"
    "swift-language"
    "flutter-bin"
    "fortran-fpm-bin"
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
    "ldoc"
    "ruby-yard"
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
