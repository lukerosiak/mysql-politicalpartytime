DROP TABLE IF EXISTS partytime_venues;
CREATE TABLE partytime_venues (
	id INTEGER NOT NULL PRIMARY KEY, 
	venue_name VARCHAR(68), 
	address1 VARCHAR(48), 
	address2 VARCHAR(64), 
	city VARCHAR(22), 
	state VARCHAR(6), 
	zipcode VARCHAR(10), 
	latitude FLOAT, 
	longitude FLOAT
);

DROP TABLE IF EXISTS partytime_events;
CREATE TABLE partytime_events (
	url VARCHAR(41) NOT NULL, 
	id INTEGER NOT NULL PRIMARY KEY, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	start_date DATE, 
	end_date DATE, 
	end_time TIME, 
	entertainment VARCHAR(204), 
	venue_id INTEGER, 
	contributions_info VARCHAR(255), 
	make_checks_payable_to VARCHAR(255), 
	checks_payable_to_address VARCHAR(136), 
	committee_id VARCHAR(184), 
	rsvp_info VARCHAR(167), 
	distribution_paid_for_by VARCHAR(119), 
	CHECK (canceled IN (0, 1)), 
	CHECK (postponed IN (0, 1))
);

DROP TABLE IF EXISTS partytime_omcs;
CREATE TABLE partytime_omcs (
	event_id INTEGER NOT NULL, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	omc_id INTEGER NOT NULL, 
	omc_name VARCHAR(51) NOT NULL, 
	party VARCHAR(4), 
	state VARCHAR(4), 
	district VARCHAR(4), 
	CHECK (canceled IN (0, 1)), 
	CHECK (postponed IN (0, 1)),
    INDEX(event_id),
    INDEX(omc_id)
);

DROP TABLE IF EXISTS partytime_beneficiaries;
CREATE TABLE partytime_beneficiaries (
	event_id INTEGER NOT NULL, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	beneficiary_id INTEGER NOT NULL, 
	beneficiary_name VARCHAR(88) NOT NULL, 
	party VARCHAR(4), 
	state VARCHAR(4), 
	district VARCHAR(4), 
	crp_id VARCHAR(10), 
	CHECK (postponed IN (0, 1)), 
	CHECK (canceled IN (0, 1)),
    INDEX(event_id),
    INDEX(beneficiary_id),
    INDEX(crp_id)
);

DROP TABLE IF EXISTS partytime_hosts;
CREATE TABLE partytime_hosts (
    event_id INTEGER NOT NULL, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	host_id INTEGER NOT NULL, 
	host_name VARCHAR(88) NOT NULL, 
	CHECK (postponed IN (0, 1)), 
	CHECK (canceled IN (0, 1)),
    INDEX(event_id),
    INDEX(host_id)
);

LOAD DATA LOCAL INFILE 'download/venues.csv' INTO TABLE partytime_venues FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'download/events.csv' INTO TABLE partytime_events FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'download/omcs.csv' INTO TABLE partytime_omcs FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'download/beneficiaries.csv' INTO TABLE partytime_beneficiaries FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'download/hosts.csv' INTO TABLE partytime_hosts FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (event_id, @tcanceled, @tpostponed, host_id, host_name) SET canceled = nullif(@tcanceled,''), postponed = nullif(@tpostponed,'');
