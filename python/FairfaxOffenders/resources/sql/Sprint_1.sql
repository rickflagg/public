
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




