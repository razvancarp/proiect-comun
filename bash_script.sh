#!/bin/bash

# --- CONFIGURATION ---
SOURCE_DIR="$1"
BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# --- PRE-FLIGHT CHECKS ---
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory $SOURCE_DIR does not exist."
    exit 1
fi

# Create backup folder if it doesn't exist
mkdir -p "$BACKUP_DIR"

# --- CORE LOGIC ---
echo "Starting backup of: $SOURCE_DIR..."

if tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"; then
    echo "Successfully created: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "Error: Backup failed."
    exit 1
fi
# --- EXTENSION POINT ---
# You can continue the script here. Suggestions:
# 1. Add a function to delete backups older than 7 days.
# 2. Add an rsync command to move the backup to a remote server.
# 3. Send a notification/email upon success.

echo "Process completed at $(date)"