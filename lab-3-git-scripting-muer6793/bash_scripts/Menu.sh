#!/bin/bash
if [ -e lab3_sample.txt ]
then
    echo "Success: lab3_sample.txt exists"
else
    echo "Error: lab3_sample.txt does not exist"
    exit
fi
PS3='Please enter your choice: '
options=("find_words" "add_text" "delete_word" "replace_first_occurrence" "copy_file" "exit")
select opt in "${options[@]}"
do
    case $opt in
        "find_words") #1
            echo "you chose choice find_words"
            echo | grep "Linux" $1
            echo | grep "functions" $1
            echo | grep "Bash" $1
            echo | grep "runs" $1
            ;;
        "add_text") #2
            echo "you chose choice add text"
            echo "Enter the sentence you want to add: "
            read sentence
            echo $sentence | tee -a $1
            ;;
        "delete_word") #3
            echo "you chose choice delete_word"
            echo "Enter a word to delete: "
            read deleteword
            sed -i "s|$deleteword||g" $1
            ;;
        "replace_first_occurence") #4
            echo "you chose choice replace_first_occurence"
            echo "Enter the old word: "
            read oldword
            echo "Enter the new word: "
            read newword
            sed "s|$oldword|$newword|" $file
            ;;
        "copy_file") #5
            echo "you chose choice copy_file"
            cp [$1][solution]
            ;;
        "exit") #6
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done