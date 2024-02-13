
#!/bin/bash

# Part 1: File and Directory Exploration

echo "Welcome. The Direories and files in theis folder are"

ls -hsa 

while true; do 
#List all the directories and files in the folder
  echo "Files adn Directories in the folder are: " 
  ls -lh 

read -p "Enter a line of text (Press Enter without text to exit): " input

if [ -z "$input" ]; then
   echo "Exiting the explorer"
   break
fi

char_count=$(echo -n "$input" | wc -m )
echo "Character Count: $char_count"
done