#!/bin/bash
#set -x

log_directory="/var/log/file_manager"
log_activity="$log_directory/activity.log"
log_error="$log_directory/error.log"

# Get the current date and time
current_time=$(date +"%Y-%m-%d %T")
# Get the username of the user running the script
user=$(whoami)


# Create log directory and log files
setup_logs() {
  sudo mkdir -p "$log_directory" && sudo chmod 777 $log_directory
  sudo touch "$log_activity" "$log_error"
  sudo chmod 777 "$log_activity" "$log_error"
}

filter_logs(){
     echo " ********** Filter Log by Username , Date[YYYY-MM-DD] , Time[HH-MM-SS] *******"
     echo " *********  Activity File: activity.log  and  Error File: error.log **********"
     echo "Type for filter : "
        read filter
     echo "Type your file : "
       read logfile
        if [ "$logfile" = "activity.log" ]; then
                grep "$filter" $log_activity
        else
                grep "$filter" $log_error
        fi
}

# Function to display menu
show_menu() {
    echo "1. List all processes"
    echo "2. Kill a process"
    echo "3. System Information"
    echo "4. Users Management"
    echo "5. Group Management"
    echo "6. Logs Management"
    echo "7. Exit"
}

# Function to list all processes
list_processes() {
    ps aux 
}

# Function to kill a process
kill_process() {
    ps aux  
    read -p "Enter process ID to kill: " pid
    kill -9 $pid
    echo "Killed process $pid"
    echo "[${current_time}] User '${user}' - Process '$pid' is killed" >> "$log_activity"
}

# Function to display system information
system_info() {
    echo "1. Displays your system"
    echo "2. Displays kernel release information"
    echo "3. Displays how long the system has been running with load average"
    echo "4. Shows the system hostname"
    echo "5. Displays the IP address of the system"
    echo "6. Shows system reboot history"
    echo "7. Displays current system date and time"
    echo "8. Displays the current calendar month and day"
    echo "9. Displays which user you are logged in"
    echo "10. Displays information about the user"
    echo "11. Quit"
    
    read -p "Enter your choice (1-4): " choice
    case $choice in
        1) uname ;;
        2) uname -r ;;
        3) uptime ;;
        4) hostname ;;
        5) hostname -I ;;
        6) last reboot ;;
        7) date ;;
        8) cal ;;
        9) whoami ;;
        10) user_info ;;
        11) echo "Exiting. Bye!"; exit ;;
        *) echo "Invalid choice. Please enter a number between 1 and 11." ;;
    esac
}
# Function to add user
add_user() {
    read -p "Enter the username to add: " username
    sudo adduser $username
    echo "User '$username' added successfully."
    echo "[${current_time}] User '${user}' - User '$username' created successfully." >> "$log_activity"

}
# Function to delete user
delete_user() {
    cut -d: -f1,3 /etc/passwd | awk -F: '$2 > 999 {print $1}'
    read -p "Enter the username to delete: " username
    sudo userdel -r $username
    echo "User '$username' deleted successfully."
    echo "[${current_time}] User '${user}' - User '$username' deleted successfully." >> "$log_activity"
}
# Function to update user password
update_password() {
    read -p "Enter the username to update password: " username
    sudo passwd $username
    echo "Password for user '$username' updated successfully."
    echo "[${current_time}] User '${user}' - Password of '$username' updated." >> "$log_activity"
}
# Function to modify user 
modify_user() {
    read -p "Enter the username to modify: " username

    # Function to modify user properties interactively
    modify_user_interactively() {
        read -s -p "Enter new password for $username (press Enter to keep the current password): " new_password
        echo

        read -p "Enter new primary group for $username (press Enter to keep the current group): " new_group

        read -p "Enter additional groups (comma-separated) for $username (press Enter to keep the current groups): " additional_groups

        read -p "Enter new home directory for $username (press Enter to keep the current home directory): " new_home_dir

        read -p "Enter new login shell for $username (press Enter to keep the current shell): " new_shell
    }

    # Prompt user for modifications
    modify_user_interactively

    # Apply modifications using usermod
    sudo usermod \
        $( [ -n "$new_password" ] && echo "--password $(echo "$new_password" | openssl passwd -1 -stdin)" ) \
        $( [ -n "$new_group" ] && echo "--gid $new_group" ) \
        $( [ -n "$additional_groups" ] && echo "--append --groups $(echo "$additional_groups" | tr -d ' ' | tr ',' '\n')" ) \
        $( [ -n "$new_home_dir" ] && echo "--home $new_home_dir" ) \
        $( [ -n "$new_shell" ] && echo "--shell $new_shell" ) \
        "$username"

    echo "User $username has been modified successfully."
    echo "[${current_time}] User '${user}' - '$username' has been modified." >> "$log_activity"
}
system_user() {
    cut -d: -f1,3 /etc/passwd | awk -F: '$2 < 1000 {print $1}'
}
bashshell_user() {
    grep -E '/bin/bash' /etc/passwd | cut -d: -f1

}
user_info() {
    read -p "Enter the username: " username
    finger $username
}

# Manage users
manage_user() {
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Update Password"
    echo "4. Modify User"
    echo "5. List system user"
    echo "6. List user /bin/bash shell"
    echo "7. User info"
    echo "8. Quit"
    
    read -p "Enter your choice (1-4): " choice
    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) update_password ;;
        4) modify_user;;
        5) system_user ;;
        6) bashshell_user ;;
        7) user_info ;;
        8) echo "Exiting. Bye!"; exit ;;
        *) echo "Invalid choice. Please enter a number between 1 and 7." ;;
    esac
}

# Function to add Group
add_group() {
    read -p "Enter the Groupname to add: " groupname
    sudo groupadd $groupname
    echo "Group '$groupname' added successfully."
    echo "[${current_time}] User '${user}' - Group '$groupname' has been added." >> "$log_activity"
}

delete_group() {
    cut -d: -f1,3 /etc/group | awk -F: '$2 > 999 {print $1}'
    read -p "Enter the Groupname to delete: " groupname
    sudo groupdel $groupname
    echo "Group '$groupname' deleted successfully."
    echo "[${current_time}] User '${user}' - Group '$groupname' has been deleted." >> "$log_activity"
}

# Manage Groups
manage_group() {
    echo "1. Add Group"
    echo "2. Delete Group"
    echo "3. Quit"
    
    read -p "Enter your choice (1-4): " choice
    case $choice in
        1) add_group ;;
        2) delete_group ;;
        3) echo "Exiting. Bye!"; exit ;;
        *) echo "Invalid choice. Please enter a number between 1 and 4." ;;
    esac
}

# Main loop
while true; do
    setup_logs
    show_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) list_processes ;;
        2) kill_process ;;
        3) system_info ;;
        4) manage_user ;;
        5) manage_group ;;
	    6) filter_logs ;;
        7) echo "Exiting..."; exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac

    read -p "Press Enter to continue..."
    clear
done
