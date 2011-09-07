DBNAME=yourdb
DBUSER=youruser
DBPASS=yourpass

rm download -rf
mkdir download
cd download
wget http://politicalpartytime.org/www/partytime_dump.zip
unzip partytime_dump.zip
cd ..
mysql $DBNAME -u $DBUSER -p$DBPASS < structure.sql

date > download/downloaddate.txt
