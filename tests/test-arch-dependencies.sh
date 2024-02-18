#!/usr/bin/env bash
#
# NormalNvim test to check if all arch linux dependencies still exist.




# HELPER FUNCTIONS
# -----------------------------------------------------------------------------

#######################################
# Given a dependency name, check if it exist on the AUR.
# Suitable for GitHub actions, as we don't actually install them.
#######################################
check_dependency() {
    local package_name="$1"
    if ! pacman -Ssq --quiet "^$package_name$"; then
        echo "Package '$package_name' not found in the AUR."
        return 1
    fi
}

#######################################
# Given a list of dependencies, return error if a dep doesn't exist.
#
# Arguments:
#   Dependencies: A list of dependencies like the next example
#   (
#     "python"
#     "python-pynvim"
#     ...
#   )
#
# Returns:
#    0: if all of them exist.
#    1: if at least one of them do not exist.
#######################################
check_dependencies() {
    local dependencies=("$@")

    for dependency in "${dependencies[@]}"; do
        check_package_existence "$dependency" || return 1
    done
}


# CHECK DEPENDENCIES
# -----------------------------------------------------------------------------

echo "------------------------"
echo "NormalNvim dependencies"
echo "------------------------"
dependencies=(
    "ranger-git"
    "python"
    "python-pynvim"
    "fd"
    "git-delta"
    "grcov"
    "rustup"
    "yarn"
    "python-pytest"
)
check_dependencies "${dependencies[@]}" || exit 1

# yarn global add jest
# cargo install cargo-nextest
printf '\n\n\n\n'

echo "----------------------------"
echo "Compiler.nvim dependencies"
echo "----------------------------"
dependencies=(
    "mingw-w64"
    "dotnet-runtime"
    "dotnet-sdk"
    "aspnet-runtime-bin"
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
    "pyinstaller"
    "python"
    "ruby"
    "perl"
    "lua"
    "swift-bin"
)
check_dependencies "${dependencies[@]}" || exit 1
printf '\n\n\n\n'




echo "------------------------"
echo "Dooku.nvim dependencies"
echo "------------------------"
dependencies=(
    "doxygen"
)
check_dependencies "${dependencies[@]}" || exit 1
# go install golang.org/x/tools/cmd/godoc@latest
# yarn global add typedoc jdoc
printf '\n\n\n\n'




echo "----------------------------------------"
echo "SUCCESS: All dependencies are available"
echo "----------------------------------------"
