#!/bin/bash

#Task 1 Comment Completed

#echo commands prints on the terminal
echo "Hello World!, is old school, Jut say Hi How you doing?"

#Declaring Variables 
name=Aakash
city=Patna
work=DevOps_Engineer

#Using Variables
echo "Greetings $name, staying in $city, You are doing Great as a $work"

#using Built-In Variables (Variables that are already presenrt such as hostname, bash version etc)
echo "My  hostname is $HOSTNAME"
echo "My present Working Directory is $PWD"
echo " I am using $BASH"
echo "My home Directory is $$"
echo "My PID is $$"
echo "Version of Bash is $BASH_VERSION"

#wildcards
echo "Files with .txt extension in the current directory:"
ls *.txt

