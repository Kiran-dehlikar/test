#!/bin/bash
#set -x

echo "TASK_NAME, TRIGGER_TYPE, TASK_SCRIPT_PATH"  > ../operator/TaskMaster.csv
echo "TASK_NAME, EXECUTION_NO, LOG_LOCATION"  > ../operator/TaskExecutionHistory.csv
echo "0" > ../logs/execution_no

pushd ../operator/
    ./operator.sh add task1 manual /home/opstree/codekiran/system/tasks/example1.sh
    ./operator.sh add task2 manual /home/opstree/codekiran/system/tasks/example2.sh
    ./operator.sh executeTask task1
    ./operator.sh executeTask task2
    ./operator.sh executeTask task2
    ./operator.sh getTaskExecutionHistory task1
    ./operator.sh getTaskExecutionHistory task2
    ./operator.sh getTaskExecutionLogs task1 1
    ./operator.sh getTaskExecutionLogs task2 2
    ./operator.sh getTaskExecutionLogs task2 3
    ./operator.sh add task3 scheduled /home/opstree/codekiran/system/tasks/example3.sh
    ./operator.sh executeTask task3
    ./operator.sh add task4 scheduled /home/opstree/codekiran/system/tasks/example4.sh
    ./operator.sh executeTask task4
popd

# | sed 's/,/ | /g'