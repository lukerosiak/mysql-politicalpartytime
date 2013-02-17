rm download -rf
mkdir download
cd download
#`wget http://politicalpartytime.org/www/partytime_dump_all.csv`

wget http://politicalpartytime.org/www/partytime_dump.zip
unzip partytime_dump.zip
cd ..

date > download/downloaddate.txt

psql partytime < strcture.sql

python psql_import.py
