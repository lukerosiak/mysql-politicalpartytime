import psycopg2
 
 
conn = psycopg2.connect(database="partytime", user="", password="")
 
conn.autocommit = True
cur = conn.cursor()
  
cur.copy_expert("COPY %s FROM STDIN CSV HEADER" % 'partytime_venues', open('download/venues.csv','r'))
cur.copy_expert("COPY %s FROM STDIN CSV HEADER" % 'partytime_events', open('download/events.csv','r'))
cur.copy_expert("COPY %s FROM STDIN CSV HEADER" % 'partytime_omcs', open('download/omcs.csv','r'))
cur.copy_expert("COPY %s FROM STDIN CSV HEADER" % 'partytime_beneficiaries', open('download/beneficiaries.csv','r'))
cur.copy_expert("COPY %s FROM STDIN CSV HEADER" % 'partytime_hosts', open('download/hosts.csv','r'))
    
            

 
 

