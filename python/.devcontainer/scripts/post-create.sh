#!/bin/bash
# .devcontainer/scripts/post-create.sh

set -uo pipefail

# =================================================
# Sync user dotfiles if provided to the container
# =================================================
WORKSPACE_DIR="${containerWorkspaceFolder:-$(pwd)}"
DOTFILES_CONTAINER_DIR="/tmp/dotfiles"

if [ -d $DOTFILES_CONTAINER_DIR ]; then
  cp -R "$DOTFILES_CONTAINER_DIR/." "$HOME"/
  echo "Synced dotfiles from ${DOTFILES_CONTAINER_DIR}."
else
  echo "No dotfiles found at DOTFILES_DIR - using image defaults."
fi

# =================================================
# Install Python dependencies 
# =================================================
if [ -f requirements.txt ]; then
  pip install -r requirements.txt
  echo "Installed Python dependencies from requirements.txt"
else
  echo "No Python dependencies found. Skipping install..."
fi

# =================================================
# Style on em
# =================================================
cat << "EOF"


========================================================================================================

.:::::                                                     .::                                         
.::   .::                                                  .::             .:                          
.::    .::   .::    .::     .::   .:::   .::    .:: .::  .:.: .:   .::       .:: .::     .::    .: .:::
.::    .:: .:   .::  .::   .::  .::    .::  .::  .::  .::  .::   .::  .:: .:: .::  .:: .:   .::  .::   
.::    .::.::::: .::  .:: .::  .::    .::    .:: .::  .::  .::  .::   .:: .:: .::  .::.::::: .:: .::   
.::   .:: .:           .:.::    .::    .::  .::  .::  .::  .::  .::   .:: .:: .::  .::.:         .::   
.:::::      .::::       .::       .:::   .::    .:::  .::   .::   .:: .:::.::.:::  .::  .::::   .:::   
                                                                                                       
                                  
                                  Python Development Container

========================================================================================================
EOF

exit 0