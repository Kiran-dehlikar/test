#!/bin/bash
#set -x

LOG_DIR="/home/opstree/codekiran/system/logs"
LOG_FILE="$LOG_DIR/operator.log"
user=$(whoami)

#Function to log information
log_info() {
    timestamp=$(date +"%m/%d/%y: %H:%M:%S")
    echo "[$timestamp] [INFO] ${user} Task added: Name: $task_name, Type: $task_type, Script: $task_script" >> "$LOG_FILE"

}

add_task() {
    local task_name=$1
    local task_type=$2
    local task_script=$3
    #Assume TaskMaster.csv contains task metadata
    echo "$task_name, $task_type, $task_script" >> /home/opstree/codekiran/system/operator/TaskMaster.csv
    log_info
}

executeTask() {
    local task_name="$1"
    case $task_name in
        "task1")                                                                                                                                                                                                        
            local task_script="/home/opstree/codekiran/system/tasks/example1.sh"
            $task_script
            ;;
        "task2")
            local task_script="/home/opstree/codekiran/system/tasks/example2.sh"
            $task_script
            ;;
        *)
            echo "Unknown task: $task_name"
            return 1
            ;;
    esac
    # Assume execution number is tracked in TaskExecutionHistory.csv
    local execution_number=$(($(wc -l < /home/opstree/codekiran/system/operator/TaskExecutionHistory.csv) + 1))
    
    # Execute the task script (simulated action)
    echo "Executing $task_name (Execution Number: $execution_number)" 
    
    # Update TaskExecutionHistory.csv
    echo "$task_name, $execution_number, /home/opstree/codekiran/system/logs/task_$task_name_execution_$execution_number.log" >> /home/opstree/codekiran/system/operator/TaskExecutionHistory.csv
    sudo touch /home/opstree/codekiran/system/logs/task_$task_name_execution_$execution_number.log
    log_info
    read -p "Press Enter to continue..."
}

getTaskExecutionHistory() {
    local task_name="$1"
    
    # Assume TaskExecutionHistory.csv contains execution history
    grep "$task_name" /home/opstree/codekiran/system/operator/TaskExecutionHistory.csv
    log_info
    read -p "Press Enter to continue..."
}

getTaskExecutionLogs() {
    local task_name="$1"
    local execution_number="$2"
    
    # Assume logs are stored in files like ../logs/task_backup_execution_1.log
    cat "/home/opstree/codekiran/system/logs/task_$task_name_execution_$execution_number.log"
    log_info
    read -p "Press Enter to continue..."
}

action=$1

case $action in
    add) add_task $2 $3 $4 ;;
    executeTask) executeTask $2 ;;
    getTaskExecutionHistory) getTaskExecutionHistory $2 ;;
    getTaskExecutionLogs) getTaskExecutionLogs $2 ;;
    *) echo "Invalid choice." ;;
esac