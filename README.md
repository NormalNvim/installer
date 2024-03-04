# Installer
Shell script to install NormalNvim in a single step.

## Supported operative systems

* Arch based Linux distros
* Ubuntu based Linux distros
* Fedora based Linux distros
* MacOS (homebrew)
* Termux

## Supported GitHub actions
The fact a installer has a GitHub action, mean the installer is very stable; If any dependency cease to exist on the repositories of a distro, we will inmediatelly know.

* [Arch](https://github.com/NormalNvim/installer/blob/main/tests/test-arch-dependencies.sh)
* [Ubuntu](https://github.com/NormalNvim/installer/blob/main/tests/test-ubuntu-dependencies.sh)
* [MacOs](https://github.com/NormalNvim/installer/blob/main/tests/test-macos-dependencies.sh)
* [Termux](https://github.com/NormalNvim/installer/blob/main/tests/test-termux-dependencies.sh)
* [Fedora](https://github.com/NormalNvim/installer/blob/main/tests/test-fedora-dependencies.sh)

## What to do if a dependency fail to install
* Go into [actions](https://github.com/NormalNvim/installer/actions).
* Click the most recent one.
* Click the test of your operative system.

And check if there is any dependency that doesn't exist anymore. If you send us a PR since you are on it, everyone will benefit from it.
