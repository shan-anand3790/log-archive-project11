#!/bin/bash
# ==========================================================
# log-archive.sh
# A simple tool to compress and archive log files
# ==========================================================

# Exit immediately if a command fails
set -e

# ---------- Validate Input ----------
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1

# Verify if directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# ---------- Setup ----------
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_DIR="./archives"

# Create archive directory if not exists
mkdir -p "$ARCHIVE_DIR"

# ---------- Compress Logs ----------
echo "Compressing logs from: $LOG_DIR"
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .
echo "✅ Logs archived successfully: ${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# ---------- Log the Archive Info ----------
LOG_FILE="${ARCHIVE_DIR}/log_archive_history.log"
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived logs from '${LOG_DIR}' into '${ARCHIVE_NAME}'" >> "$LOG_FILE"

# ---------- Optional Cleanup ----------
# Uncomment below line if you want to remove old logs after archiving
# rm -rf ${LOG_DIR}/*

echo "📜 Archive log updated at: ${LOG_FILE}"
echo "Done!"
