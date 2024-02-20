#!/usr/bin/env bash
#
# NormalNvim test to check if all MacOS brew dependencies still exist.


# Imports
source "$(dirname "$0")/test-utils.sh" # Functions to check packages


# CHECK DEPENDENCIES
# -----------------------------------------------------------------------------
echo "-------------------------------"
echo "NormalNvim dependencies - MacOS"
echo "-------------------------------"
# homebrew
echo "- Homebrew packages -"
dependencies=(
    "fd"
    "git-delta"
    "rustup-init"
    "yarn"
)
check_homebrew_dependencies "${dependencies[@]}" || exit 1

# python
printf '\n%s\n' "- Python packages -"
dependencies=(
    "pynvim"
    "pytest"
)
check_python_dependencies "${dependencies[@]}" || exit 1

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
    "grcov"
)
check_cargo_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "--------------------------"
echo "Compiler.nvim dependencies"
echo "--------------------------"
# homebrew
echo "- Homebrew packages -"
dependencies=(
    "mingw-w64" # Warning: It might not include 'ld'.
    "dotnet"    # runtime
    "mono"
    "openjdk"
    "dart-sdk"
    "kotlin"
    "elixir"
    "node"
    "typescript"
    "make"
    "go"
    "nasm"
    "r"
    "ruby"
    "perl"
    "lua"
    "swift"
    "pyinstaller"
)
check_homebrew_dependencies "${dependencies[@]}" || exit 1

dependencies=(
    "dotnet-sdk"
)
check_homebrew_cask_dependencies "${dependencies[@]}" || exit 1

# python
printf '\n%s\n' "- Python packages -"
dependencies=(
    "Nuitka"
)
check_python_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "-----------------------"
echo "Dooku.nvim dependencies"
echo "-----------------------"
# homebrew
echo "- Pacman packages -"
dependencies=(
    "doxygen"
)
check_homebrew_dependenciess "${dependencies[@]}" || exit 1

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
