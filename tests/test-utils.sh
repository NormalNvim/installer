#!/usr/bin/env bash
#
# Functions we use to check if a package exist in its respective repo.
#
# Note we check against their web instead of using a cli,
# so they are suitable for GitHub/GitLab actions.




#######################################
# Check if a list of packages exist
# in the Arch repositories
#######################################
check_arch_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url_extra="https://archlinux.org/packages/extra/x86_64/$package_name/"
    local url_extra_any="https://archlinux.org/packages/extra/any/$package_name/"
    local url_core="https://archlinux.org/packages/core/x86_64/$package_name/"
    local url_core_any="https://archlinux.org/packages/core/any/$package_name/"

    # Check if the package exists in the Arch repositores
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
# in AUR
#######################################
check_aur_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://aur.archlinux.org/packages/$package_name"

    # Check if the package exists in AUR
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

    # Check if the package exists in NPM
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
# in Cargo
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
# in Go
#######################################
check_go_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url_tools_cmd="https://pkg.go.dev/golang.org/x/tools/cmd/$package_name"

    # Check if the package exists in the Go repos
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url_tools_cmd")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in Go."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in pip
#######################################
check_python_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://pypi.org/project/$package_name/"

    # Check if the package exists in the Python Pypi
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in the Python Pypi repositories."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in Ubuntu
#######################################
check_ubuntu_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://launchpad.net/ubuntu/+source/$package_name"

    # Check if the package exists in Ubuntu
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in the Ubuntu repositories."
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in Termux
#######################################
# BUG: The search engine return similar terms.
#      For example if we look for python and it doesn't exist but python-lol does,
#      it will return 200
check_termux_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://repology.org/projects/?search=$package_name&inrepo=termux"

    # Check if the package exists in Termux
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in Termux"
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in MacOS homebrew
#######################################
check_homebrew_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://formulae.brew.sh/formula/$package_name"

    # Check if the package exists in MacOS homebrew
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in MacOS homebrew"
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in MacOS homebrew cask
#######################################
check_homebrew_cask_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://formulae.brew.sh/cask/$package_name"

    # Check if the package exists in MacOS homebrew
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in MacOS homebrew cask"
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in Fedora
#######################################
check_fedora_dependencies() {
  error_flag=0 # 0 means no error

  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://packages.fedoraproject.org/pkgs/$package_name/"

    # Check if the package exists in Fedora
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in Fedora"
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in NixOS
#######################################
# BUG: The search engine return similar terms.
#      For example if we look for python and it doesn't exist but python-lol does,
#      it will return 200
check_nixos_dependencies() {
  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://search.nixos.org/packages?query=$package_name/"

    # Check if the package exists in NixOS
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in NixOS"
      error_flag=1
    fi
  done

  return "$error_flag"
}

#######################################
# Check if a list of packages exist
# in Snapcraft
#######################################
check_snap_dependencies() {
  # Iterate over each package name in the array
  for package_name in "$@"; do
    local url="https://snapcraft.io/$package_name"

    # Check if the package exists in Snapcraft
    if [ "$(curl -s -o /dev/null -w "%{http_code}" "$url")" -eq 200 ]; then
      echo "$package_name"
    else
      echo "$package_name → ERROR: It doesn't exist in Snapcraft"
      error_flag=1
    fi
  done

  return "$error_flag"
}
