#!/bin/bash
# Get all installed packages using apt 
installed_packages=$(dpkg --get-selections | grep -v deinstall | cut -f1)

# Print the list of installed packages
for package in $installed_packages;

do
  echo $package
done
