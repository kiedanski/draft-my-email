#!/usr/bin/env bash

# Get the current directory path
current_dir=$(pwd)

# The path to the original file
apple_script="draft_email.scpt"
bash_script="get_draft.sh"

ollama_path=$(which ollama)

# The path to the final directory
final_dir="$HOME/Library/Application Scripts/com.apple.mail/"

# The name of the file in the final directory

# Replace the placeholder in the original file, write the result to a new file in the final directory
sed "s|PLACEHOLDER|$current_dir|g" $apple_script.template > "$final_dir/$apple_script"

sed -e "s|OLLAMA_PATH|$ollama_path|g" -e "s|CURRENT_DIR|$current_dir|g" $bash_script.template > "$current_dir/.$bash_script"
chmod +x ".$bash_script"
