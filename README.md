# Parally
Parally is a small shell script for simplified handling of child processes based on names.
Simply add the script to your system path or alias (`alias parally 'sh ~/parally.sh'`) or run it by providing a path `sh ~/parally.sh`.

# Functions
## Start
Starts a new child process:
```bash
# Syntax
sh parally.sh start "<command2run>" <name>
# Example
sh parally.sh start "sh date_writer.sh" date_writer
``` 
## Stop
Stops a running process:
```bash
# Syntax
sh parally.sh stop <name>
# Example
sh parally.sh stop date_writer
``` 
## Status
Print the status of a process (is it running):
```bash
# Syntax
sh parally.sh status <name>
# Example
sh parally.sh status date_writer
``` 
## List
Lists all started processes:
```bash
# Syntax
sh parally.sh list
# Example
sh parally.sh list
``` 