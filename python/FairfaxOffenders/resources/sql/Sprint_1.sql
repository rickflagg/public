
DROP TABLE IF EXISTS offender_states CASCADE;
DROP SEQUENCE IF EXISTS  seq_offender_states;

CREATE TABLE offender_states
(
  id INT8 NOT NULL,
  abbreviation VARCHAR(3) NOT NULL,
  name VARCHAR(100) NOT NULL,
  CONSTRAINT pk_offender_states PRIMARY KEY (id)
);

CREATE SEQUENCE seq_offender_states;

INSERT INTO offender_states
(
  id,
  abbreviation,
  name
)
VALUES
(
  nextval('seq_offender_states'),
  'VA',
  'Virginia'
);

DROP TABLE IF EXISTS offender_area CASCADE;
DROP SEQUENCE IF EXISTS seq_offender_area;

CREATE TABLE offender_area
(
  id INT8 NOT NULL,
  state_id INT8 NOT NULL,
  county VARCHAR(100) NOT NULL,
  CONSTRAINT pk_offender_area PRIMARY KEY (id),
  CONSTRAINT fk_offender_area_to_state FOREIGN KEY(state_id) REFERENCES offender_states(id)
);

CREATE SEQUENCE seq_offender_area;

INSERT INTO offender_area
(
  id,
  state_id,
  county
)
values
(
  nextval('seq_offender_area'),
  (SELECT id from  offender_states WHERE abbreviation= 'VA'),
  'Fairfax'
);


DROP TABLE IF EXISTS offenders CASCADE;
DROP SEQUENCE IF EXISTS seq_offenders;

CREATE TABLE offenders
(
  id INT8 NOT NULL,
  first_name VARCHAR (120) NOT NULL,
  last_name VARCHAR (150) NOT NULL,
  middle_name VARCHAR (50) NULL,
  age INT4 NULL,
  address VARCHAR(400) NULL,
  latitude REAL NULL,
  longitude REAL NULL,
  hidden BOOLEAN DEFAULT FALSE,
  CONSTRAINT pk_offenders PRIMARY KEY (id)
);

DROP TABLE IF EXISTS state_statutes;
DROP SEQUENCE IF EXISTS seq_state_statutes;

CREATE TABLE state_statutes
(
  id INT8 NOT NULL,
  code VARCHAR(100) NOT NULL,
  description TEXT NULL,
  state_id INT8 NOT NULL,
  CONSTRAINT pk_statutes PRIMARY KEY (id),
  CONSTRAINT fk_statutes_to_states FOREIGN KEY (state_id) REFERENCES offender_states
);

DROP TABLE IF EXISTS offences;
DROP SEQUENCE IF EXISTS seq_offences;

CREATE SEQUENCE seq_offences;

CREATE TABLE offences
(
  id INT8 NOT NULL,
  statute_id INT8 NOT NULL,
  offence_date DATE NOT NULL,
  offender_id INT8 NOT NULL,
  area_id INT8 NOT NULL,
  CONSTRAINT pk_offense PRIMARY KEY (id),
  CONSTRAINT fk_offences_to_statutes FOREIGN KEY (statute_id) REFERENCES state_statutes(id),
  CONSTRAINT fk_offences_to_offenders FOREIGN KEY (offender_id) REFERENCES offenders(id),
  CONSTRAINT fk_offences_to_areas FOREIGN KEY (area_id) REFERENCES offender_area(id)
);











