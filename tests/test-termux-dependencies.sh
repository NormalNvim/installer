#!/usr/bin/env bash
#
# NormalNvim test to check if all Termux dependencies still exist.


# Imports
source "$(dirname "$0")/test-utils.sh" # Functions to check packages


# CHECK DEPENDENCIES
# -----------------------------------------------------------------------------
echo "--------------------------------"
echo "NormalNvim dependencies - Termux"
echo "--------------------------------"
# termux
echo "- Termux packages -"
dependencies=(
    "tur-repo" # This enable the termux user repository
    "luarocks"
    "python"
    "fd"
    "git-delta"
    "yazi"
    "yarn"
)
check_termux_dependencies "${dependencies[@]}" || exit 1

# python
printf '\n%s\n' "- Python packages -"
dependencies=(
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
    "git-delta"
    "grcov"
)
check_cargo_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "--------------------------"
echo "Compiler.nvim dependencies"
echo "--------------------------"
# termux
echo "- Termux packages -"
dependencies=(
    "mono"
    "openjdk-17"
    "dart"
    "kotlin"
    "elixir"
    "nodejs"
    "make"
    "rust"
    "golang"
    "nasm"
    "python"
    "ruby"
    "perl"
    "liblua52"
    "swift"
    "binutils-libs" # contains ld (as we don't use mingw)
)
check_termux_dependencies "${dependencies[@]}" || exit 1

echo "- Termux packages (TUR) -"
dependencies=(
    "gcc-default" # Has gfortran
)
check_tur_dependencies "${dependencies[@]}" || exit 1

# python
printf '\n%s\n' "- Python packages -"
dependencies=(
    "Nuitka"
)
check_python_dependencies "${dependencies[@]}" || exit 1

printf '\n%s\n' "- Python packages -"
dependencies=(
    "pyinstaller"
)
check_python_dependencies "${dependencies[@]}" || exit 1

echo "-----------------------"
echo "Dooku.nvim dependencies"
echo "-----------------------"
# termux
echo "- Termux packages -"
dependencies=(
    "doxygen"
)
check_termux_dependencies "${dependencies[@]}" || exit 1

# npm
printf '\n%s\n' "- NPM packages -"
dependencies=(
    "jsdoc"
    "typedoc"
    "typescript"
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
echo "  * flutter"
echo "  * r language"
echo "  * dotnet"
printf '\n\n\n\n'

echo "-------------------------------"
echo "SUCCESS: All deps are available"
echo "-------------------------------"
