#!/bin/sh

javafile=*.svg
filesCommit=0

# For each java file
for i in $javafile; do
    if [[ "$i" == "$javafile" ]]; then
        echo "No .java files"
    else
        # Add current file
        git add $i
        echo
        echo "File $i added"

        # Ask for commit message
        echo
        echo "Write a message to commit"
        read message

        # Commit single file with message
        git commit -m "$message"

        # Bumb counter to remember number of items
        ((filesCommit++))
    fi
done

# If we've had atleast 1 file, push
if [[ "$filesCommit" -ge 0 ]]; then
    git push origin master
    echo
    echo "#############################################"
    echo "Pushed successfully; $filesCommit files"
    echo "#############################################"
fi