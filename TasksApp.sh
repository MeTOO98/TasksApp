#!/bin/bash 

BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
MAGENTA="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[0;37m"
NC="\e[0m"

IFS=$'\n'

appmenu(){

echo -e "${GREEN}========================${NC}"
echo -e "Hello in your Tasks App" 
echo -e "${GREEN}please choose what you want to do${NC}"
echo -e "1- add task"
echo -e "2- list all tasks"
echo -e "3- Mark The Task as Completed" 
echo -e "4- Delete a Task" 
read choice

if ! [[ "$choice" =~ ^[1-4]$ ]]; then 
   echo "$choice is not valid please enter a number from 1 to 4"
   return 1
fi

case "$choice" in 
   1) addtask ;;
   2) ListTasks ;;
   3) MarkComplete ;;
   4) RemoveTasks ;;
esac 


}

addtask(){

if ! [[ -d d-tasks ]]; then
  mkdir d-tasks
fi 
if ! [[ -f d-tasks/Tasks ]]; then
  touch  d-tasks/Tasks
fi

echo -e "${BLUE}Please Enter The Title of Task${NC}"
read -r Title
Title=${Title,,} 
echo -n "#Title :$Title," >> d-tasks/Tasks
echo "Date :$(date)" >> d-tasks/Tasks
echo -n "#Title :$Title," >> d-tasks/Tasks.Title
echo "Date :$(date)" >> d-tasks/Tasks.Title
echo -e "${BLUE}Please Enter The Description of Task${NC}"
read -r Desc
echo "#Desc :$Desc" >> d-tasks/Tasks
} 


ListTasks(){
cat d-tasks/Tasks
}

MarkComplete(){
echo -e "${BLUE}Please Enter The Task That is Completed${NC}"
read -r Task
Task=${Task,,}
flag=0


for Title in $(cat d-tasks/Tasks.Title);do
   if [[ $(echo "$Title" | cut -d "," -f1 | cut -d ":" -f2)  ==  "$Task" ]]; then
        grep -v "$Title" d-tasks/Tasks.Title > tmpfile && mv tmpfile  d-tasks/Tasks.Title
        awk -v task="$Title" 'BEGIN {del=0}$0 ~ task {del=1; next}del && /^#Title :/ {del=0}!del' d-tasks/Tasks > tmpfile && mv tmpfile d-tasks/Tasks
        flag=1
   fi
done 

if  [[  "$flag" == 0 ]];then 
   echo "$Task not found"
fi
}



RemoveTasks(){
echo -e "${GREEN}Please Enter The Task That you want to remove it${NC}"
read -r Task 
Task=${Task,,}
flag=0

for Title in $(cat d-tasks/Tasks.Title);do
   if [[ $(echo "$Title"  | cut -d "," -f1 | cut -d ":" -f2)  ==  "$Task" ]]; then
	grep -v "$Title" d-tasks/Tasks.Title > tmpfile && mv tmpfile  d-tasks/Tasks.Title
        awk -v task="$Title" 'BEGIN {del=0}$0 ~ task {del=1; next}del && /^#Title :/ {del=0}!del' d-tasks/Tasks > tmpfile && mv tmpfile d-tasks/Tasks
        flag=1
   fi
done

if  [[  "$flag" == 0 ]];then 
   echo "$Task not found"
fi
}




appmenu





