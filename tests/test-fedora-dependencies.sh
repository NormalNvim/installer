#!/usr/bin/env bash
#
# NormalNvim test to check if all Fedora dependencies still exist.


# Imports
source "$(dirname "$0")/test-utils.sh" # Functions to check packages


# CHECK DEPENDENCIES
# -----------------------------------------------------------------------------

echo "--------------------------------------"
echo "NormalNvim dependencies - Fedora Linux"
echo "--------------------------------------"
# fedora
echo "- Fedora packages -"
dependencies=(
    "luarocks/luarocks/"
    "rust-fd-find/fd-find"
    "rust-git-delta/git-delta"
    "rustup/rustup"
    "pytest/python3-pytest"
)
check_fedora_dependencies "${dependencies[@]}" || exit 1

# npm
printf '\n%s\n' "- NPM packages -"
dependencies=(
    "yarn"
    "jest"
)
check_npm_dependencies "${dependencies[@]}" || exit 1

# cargo
printf '\n%s\n' "- Cargo packages -"
dependencies=(
    "cargo-nextest"
    "grcov"
    "yazi-fm"
)
check_cargo_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "--------------------------"
echo "Compiler.nvim dependencies"
echo "--------------------------"
# fedora
echo "- Fedora packages -"
dependencies=(
    "gcc/gcc"
    "binutils/binutils"  # includes ld
    "dotnet6.0/dotnet"
    "dotnet6.0/dotnet-runtime-6.0"
    "dotnet6.0/dotnet-sdk-6.0"
    "dotnet6.0/aspnetcore-runtime-6.0"
    "mono/mono-complete"
    "java-21-openjdk/java-21-openjdk"
    "elixir/elixir"
    "nodejs/nodejs"
    "nodejs/npm"
    "typescript/typescript"
    "make/make"
    "golang/golang"
    "nasm/nasm"
    "R-rlang/R-rlang"
    "ruby/ruby"
    "perl/perl"
    "lua/lua"
    "swift-lang/swift-lang"
    "gcc/gcc-gfortran"
)
check_fedora_dependencies "${dependencies[@]}" || exit 1

# python
printf '\n%s\n' "- Python packages -"
dependencies=(
    "Nuitka"
    "pyinstaller"
)
check_python_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "-----------------------"
echo "Dooku.nvim dependencies"
echo "-----------------------"
# Fedora
echo "- Fedora packages -"
dependencies=(
    "doxygen"
    "lua-ldoc"
    "rubygem-yard"
)
check_fedora_dependencies "${dependencies[@]}" || exit 1

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




# info
echo "-----------------------"
echo "Unsuported dependencies"
echo "-----------------------"
echo "  * dart"
echo "  * flutter"
echo "  * kotlin"
printf '\n\n\n\n'




echo "-------------------------------"
echo "SUCCESS: All deps are available"
echo "-------------------------------"
