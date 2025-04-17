#!/bin/bash

# hacky way to make sure the script 
# gets always run from parent-dir 
# so relative paths get resolved the right way

# Get the directory that this script lives in
script_location_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Move to the parent directory of the script
cd "$script_location_dir/.."

# Run the Saxon installer script
chmod +x ./shellscripts/dl_saxon.sh
./shellscripts/dl_saxon.sh

