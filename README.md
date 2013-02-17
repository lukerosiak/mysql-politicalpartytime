Linux shell script to download Political Partytime tables from the Sunlight Foundation (politicalpartytime.org), create database tables and populate them. 

NOTE: Despite the name, this repo now uses PostgreSQL.

Create the database partytime before running:

psql

create database partytime;

\q

Make the script executable:

chmod -x download.sh

Run the script whenever you want to refresh the tables:

./download.sh

The date of the last time you ran the script will be stored in a text file for your reference.

By Luke Rosiak. Released into the public domain.
