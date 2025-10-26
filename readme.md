
<<<<<<< HEAD
=======
# Log Archive Tool

This is a simple tool that compresses and archives log files from a given directory.

## How to Run

1. Give permission to run the script:
   ```bash
   chmod +x log-archive.sh
Run the script and provide the log folder you want to archive:

bash
Copy code
./log-archive.sh /var/log
The script will:

Compress all logs into a .tar.gz file

Save it inside a new folder called archives

Record the date and time in a file called log_archive_history.log

Example output:

bash
Copy code
Compressing logs from: /var/log
✅ Logs archived successfully: ./archives/logs_archive_20251027_120500.tar.gz
📜 Archive log updated at: ./archives/log_archive_history.log
Done!
>>>>>>> 8e197e8 (Add README with instructions)
