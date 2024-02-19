#!/usr/bin/env bash
#
# Functions we use to check if a package exist on its respective repo.
#
# Note we check against their web instead of using a cli,
# so they are suitable for GitHub/GitLab actions.




#######################################
# Check if a list of packages exist
# on the Arch repositories
#######################################
check_arch_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url_extra="https://archlinux.org/packages/extra/x86_64/$package_name/"
    local url_extra_any="https://archlinux.org/packages/extra/any/$package_name/"
    local url_core="https://archlinux.org/packages/core/x86_64/$package_name/"
    local url_core_any="https://archlinux.org/packages/core/any/$package_name/"

    # Check if the package exists in either the extra or core repository
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url_extra")" -eq 200 ] ||
       [ "$(curl -s -o /dev/null -w "%{http_code}" "$url_extra_any")" -eq 200 ] ||
       [ "$(curl -s -o /dev/null -w "%{http_code}" "$url_core")" -eq 200 ] ||
       [ "$(curl -s -o /dev/null -w "%{http_code}" "$url_core_any")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in the Arch repositories."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# on AUR
#######################################
check_aur_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://aur.archlinux.org/packages/$package_name"

    # Check if the package exists in the AUR
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in AUR."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# on NPM
#######################################
check_npm_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://www.npmjs.com/package/$package_name"

    # Check if the package exists in the NPM
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in NPM."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# on Cargo
#######################################
check_cargo_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://crates.io/api/v1/crates/$package_name"

    # Check if the package exists in Cargo
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in Cargo."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# on Go
#######################################
check_go_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url_tools_cmd="https://pkg.go.dev/golang.org/x/tools/cmd/$package_name"

    # Check if the package exists in either the extra or core repository
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url_tools_cmd")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in Go."
      error_flag=1
    fi
  done

  return "$error_flag"
}
