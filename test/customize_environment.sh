#!/bin/bash

# The Travis CI Ubuntu Trusty images do not
# have the some of the suites enabled by default.
sudo add-apt-repository multiverse
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ trusty-backports restricted main universe"
sudo apt-get update -qqy

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Install `ShellCheck`
sudo apt-get install -qqy shellcheck
