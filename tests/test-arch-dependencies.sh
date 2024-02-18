#!/usr/bin/env bash
#
# NormalNvim test to check if all arch linux AUR dependencies still exist.




# HELPER FUNCTIONS
# -----------------------------------------------------------------------------

#######################################
# Given a dependency name, check if it exists on the AUR.
# Suitable for GitHub actions, as we don't actually install them.
#######################################
check_dependency() {
  local package_name="$1"
  if ! paru -Qsq --quiet "^$package_name$" >/dev/null 2>&1; then
    return 1
  else
    return 0
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
#    1: if at least one of them does not exist.
#######################################
check_dependencies() {
  local dependencies=("$@")
  local missing_packages=()

  for dependency in "${dependencies[@]}"; do
    if ! check_dependency "$dependency"; then
      missing_packages+=("$dependency")
    fi
  done

  if [ ${#missing_packages[@]} -gt 0 ]; then
    echo "ERROR: Some packages were not found in the AUR."
    printf '%s\n' "${missing_packages[@]}"
    return 1
  else
    printf '%s\n' "${dependencies[@]}"
    return 0
  fi

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
