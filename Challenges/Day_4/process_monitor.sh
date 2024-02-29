#!/bin/bash

#Command Line Argument 
process_argument="$1"
max_attempts=3
attempt=1

#check if Process name is provided in the argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <process_name>"
  exit 1
  fi

#Process Existence Check
is_process_running(){
if pgrep -x "$1" >dev/null/; then
   return 0
else
   return 1
fi
   }


#Restarting the process 
restart_process(){

echo "Process $process_argument is not running. Attempting to restart ..."

#check if the user has the privilage to restart 
if sudo systemctl restart "$process_argument"; then
   echo "Process $process_name restarted successfully."
   else
   echo "Failed to restart $process_name. Please check the process manually."
   fi
}


#Loop to check and restart the process 
while [ $attempt -le $max_attempts ]; do
  if is_process_running "$process_argument"; then
  echo "Process $process_argumet is running. "
  else
   restart_process "$process_argument"
   fi

   attempt=$((attempt+1))
   sleep 10   # wait for 10 seconds before the next attempt
   done

   echo "Maximum restart attempts reached. Please check the process manually."


#Sending email notifications 

send_email_notification(){
    local admin_email="aakashsky1606@gmail.com"
    local subject="Process requires manual intervention"
    local body="Process requires manual intervention after $max_attempts restart attempts. "
    echo "$body" | mail -s "$subject" "$admin_email"
}