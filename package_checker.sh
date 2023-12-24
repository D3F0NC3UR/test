#!/bin/bash
# Function to check if a package is 
# installed

is_package_installed() {
dpkg -s $1 &> /dev/null
}

# Function to print colored package names
print_package_name() {
 if  is_package_installed $1; then
        echo -e "\e[32m$1\e[0m" # Green color for installed package
    else echo -e "\e[31m$1\e[0m" # Red color for not-installed package
    fi
}
# Main script
package_names=("tailscale" "docker" "package3") # Add your package names here 
for package in "${package_names[@]}"; do
    print_package_name $package
done
