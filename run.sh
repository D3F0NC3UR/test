#!/bin/bash
installed_packages() {
installed_packages=$(dpkg --get-selections | grep -v deinstall | cut -f1)
for package in $installed_packages;
do
  echo $package
done
}


is_package_installed() {
dpkg -s $1 &> /dev/null
}

aptuu() {
sudo apt update && sudo  apt upgrade -y
}

# Function to display the main menu.
displayMainMenu() {
cat << "EOF"
███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
                                      
EOF
    echo -e "\e[1;36mMain Menu\e[0m"
    echo "---------"
    echo "1. Install Menu"
    echo "2. Submenu 2"
    echo "3. Submenu 3"
    echo "4. Exit"
    echo ""
    echo $installed_packages
}

# Function to display install menu.
displayInstallMenu() {
    echo "Install Menu"
    echo "---------"

    # Loop through package_names and print colored names
    for package in "${package_names[@]}"; do
        is_package_installed "$package"
        if [ $? -eq 0 ]; then
            echo -e "\e[32m$package\e[0m" # Green color for installed package
        else
            echo -e "\e[31m$package\e[0m" # Red color for not-installed package
        fi
    done

    echo "1. Git"
    echo "2. Tailscale"
    echo "0. Back to Main Menu"
    read -p "Enter your choice: " packageChoice

    handleInstallMenuInput "$packageChoice"
}

# Function to display submenu 2.
displaySubmenu2() {
    echo "Submenu 2"
    echo "---------"
    echo "1. Run Command 3"
    echo "2. Run Command 4"
    echo "3. Back to Main Menu"
    echo ""
}

# Function to display submenu 3.
displaySubmenu3() {
    echo "Submenu 3"
    echo "---------"
    echo "1. Run Command 5"
    echo "2. Run Command 6"
    echo "3. Back to Main Menu"
    echo ""
}

#######################################
#INSTALL COMMAND
#######################################

##INSTALL GIT
git() {
    echo "Running Command 1"
aptuu
sudo apt install git
    echo "..."
}

##INSTALL TAILSCALE
runCommand2() {
    echo "Running Command 2"
aptuu
curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt update
sudo apt install tailscale
    echo"succes"
    echo ""
}

# Function to run command 3.
runCommand3() {
    echo "Running Command 3"
    # Add your command here
    echo ""
}

# Function to run command 4.
runCommand4() {
    echo "Running Command 4"
    # Add your command here
    echo ""
}

# Function to run command 5.
runCommand5() {
    echo "Running Command 5"
    # Add your command here
    echo ""
}

# Function to run command 6.
runCommand6() {
    echo "Running Command 6"
    # Add your command here
    echo ""
}

# Function to handle user input and execute the corresponding actions.
handleUserInput() {
    local choice="$1"

    case "$choice" in
        1)
            displayInstallMenu
            read -p "Enter your choice: " submenuChoice
            handleSubmenu1Input "$submenuChoice"
            ;;
        2)
            displaySubmenu2
            read -p "Enter your choice: " submenuChoice
            handleSubmenu2Input "$submenuChoice"
            ;;
        3)
            displaySubmenu3
            read -p "Enter your choice: " submenuChoice
            handleSubmenu3Input "$submenuChoice"
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Function to handle user input in submenu 1.
handleSubmenu1Input() {
    local choice="$1"

    case "$choice" in
        1)
            git
            ;;
        2)
            runCommand2
            ;;
        0)
            displayMainMenu
            read -p "Enter your choice: " mainMenuChoice
            handleUserInput "$mainMenuChoice"
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Function to handle user input in submenu 2.
handleSubmenu2Input() {
    local choice="$1"

    case "$choice" in
        1)
            runCommand3
            ;;
        2)
            runCommand4
            ;;
        3)
            displayMainMenu
            read -p "Enter your choice: " mainMenuChoice
            handleUserInput "$mainMenuChoice"
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Function to handle user input in submenu 3.
handleSubmenu3Input() {
    local choice="$1"

    case "$choice" in
        1)
            runCommand5
            ;;
        2)
            runCommand6
            ;;
        3)
            displayMainMenu
            read -p "Enter your choice: " mainMenuChoice
            handleUserInput "$mainMenuChoice"
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Main function to start the menu.
startMenu() {
    while true; do
        displayMainMenu
        read -p "Enter your choice: " mainMenuChoice
        handleUserInput "$mainMenuChoice"
    done
}

# Start the menu.
startMenu
