# TasksApp

A simple **command-line task manager** written in **Bash**.
This script allows you to add, list, mark as completed, and remove tasks directly from your terminal.

---

## Features

* Add a task with a title and description.
* List all tasks in a structured format.
* Mark tasks as completed (removes them from the active list).
* Delete tasks permanently.
* Stores tasks locally in a folder called `d-tasks/`.

---

## Requirements

* A Unix-like system (Linux, macOS, WSL on Windows).
* `bash` shell (>= v4 recommended).
* Standard tools: `awk`, `grep`, `date`, `cat`, `mv`.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/MeTOO98/linux_Projects/tree/main/TasksApp
cd TasksApp
chmod +x TasksApp.sh
```

---

## Usage

Run the app:

```bash
./TasksApp.sh
```

You will see a menu:

```
========================
Hello in your Tasks App
please choose what you want to do
1- add task
2- list all tasks
3- Mark The Task as Completed
4- Delete a Task
```

### Example

1. Add a task:

```
Please Enter The Title of Task
> buy milk
Please Enter The Description of Task
> Get 2 liters of skimmed milk
```

2. List tasks:

```
#Title :buy milk, Date :Sat Sep 27 23:00:00 2025
#Desc :Get 2 liters of skimmed milk
```

3. Mark as completed:

```
Please Enter The Task That is Completed
> buy milk
```

4. Remove a task:

```
Please Enter The Task That you want to remove it
> buy milk
```

---

## File Structure

* `TasksApp.sh` → Main script.
* `d-tasks/Tasks` → Stores all tasks with descriptions.
* `d-tasks/Tasks.Title` → Helper file storing only task titles.

---

## Notes

* Titles are case-insensitive (they are converted to lowercase).
* Completed or deleted tasks are permanently removed from files.
* If no `d-tasks/` directory exists, it will be created automatically.

---


