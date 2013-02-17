DROP TABLE IF EXISTS partytime_venues;
CREATE TABLE partytime_venues (
	id INTEGER NOT NULL PRIMARY KEY, 
	venue_name text, 
	address1 text, 
	address2 text, 
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
	start_time TEXT, /*should be time, but theres an error in the db dump*/
	end_date DATE, 
	end_time TIME, 
	entertainment text, 
	venue_id INTEGER, 
	contributions_info text, 
	make_checks_payable_to text,
	checks_payable_to_address text, 
	committee_id text, 
	rsvp_info text, 
	distribution_paid_for_by text
);

DROP TABLE IF EXISTS partytime_omcs;
CREATE TABLE partytime_omcs (
	event_id INTEGER NOT NULL, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	omc_id INTEGER NOT NULL, 
	omc_name TEXT NOT NULL, 
	party VARCHAR(4), 
	state VARCHAR(4), 
	district VARCHAR(4)
);
CREATE INDEX partytime_omcs_event_id_idx on partytime_omcs (event_id);
CREATE INDEX partytime_omcs_omc_id_idx on partytime_omcs (omc_id);

DROP TABLE IF EXISTS partytime_beneficiaries;
CREATE TABLE partytime_beneficiaries (
	event_id INTEGER NOT NULL, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	beneficiary_id INTEGER NOT NULL, 
	beneficiary_name text NOT NULL, 
	party VARCHAR(4), 
	state VARCHAR(4), 
	district VARCHAR(4), 
	crp_id VARCHAR(10)
);
CREATE INDEX partytime_beneficiaries_beneficiairy_id_idx on partytime_beneficiaries (beneficiary_id);
CREATE INDEX partytime_beneficiaries_event_id_idx on partytime_beneficiaries (event_id);
CREATE INDEX partytime_beneficiaries_crp_id_idx on partytime_beneficiaries (crp_id);

DROP TABLE IF EXISTS partytime_hosts;
CREATE TABLE partytime_hosts (
    event_id INTEGER NOT NULL, 
	canceled BOOLEAN, 
	postponed BOOLEAN, 
	host_id INTEGER NOT NULL, 
	host_name TEXT NOT NULL
);
CREATE INDEX partytime_hosts_event_id_idx on partytime_hosts (event_id);
CREATE INDEX partytime_hosts_host_id_idx on partytime_hosts (host_id);


