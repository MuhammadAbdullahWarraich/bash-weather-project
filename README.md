0 - This guide is for linux users.


1 - Be sure to make all .sh files executable before running the program.


2 - All .sh files in this project are written in bash, so execute accordingly. For instance, for linux users, the command "bash temp-printer.sh" will be used in the command line to execute temp-printer.sh


3 - To schedule any bash script to run periodically, create a cron job by entering "crontab -e" in the command line, which will open the crontab. Then create the cron job at the bottom of the file using the instructions written in the crontab. Press ctrl+x to exit and the command "crontab -l" to list all the cronjobs to standard output. See this page for more details: https://phoenixnap.com/kb/how-to-list-display-view-all-cron-jobs-linux#listing-cron-jobs-in-linux