
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

DROP TABLE IF EXISTS state_statutes  CASCADE;
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

DROP TABLE IF EXISTS offences  CASCADE;
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

CREATE OR REPLACE FUNCTION fn_save_offence
(
   IN prmLastname offenders.last_name%TYPE,
   IN prmFirstname offenders.first_name%TYPE,
   IN prmMiddlename offenders.middle_name%TYPE,
   IN prmAge offenders.age%TYPE,
   IN prmDateArrested offences.offence_date%TYPE,
   IN prmChargeStatute state_statutes.code%TYPE,
   IN prmChargeDescription state_statutes.description%TYPE,
   IN prmAddress offenders.address%TYPE,
   IN prmLatitude offenders.latitude%TYPE,
   IN prmLongitude offenders.longitude%TYPE,
   IN prmState offender_states.abbreviation%TYPE,
   IN prmArea offender_area.county%TYPE
)
RETURNS VOID
AS
$BODY$
DECLARE
  state_id numeric;

BEGIN
  -- Check to see if the state exists
  SELECT id INTO state_id FROM offender_states WHERE abbreviation = prmState;

  IF state_id is null THEN
    INSERT INTO offender_states
    (
      id,
      abbreviation
    )
    VALUES
    (
      nextval('seq_offender_states'),
      prmState
    );

    state_id = currval('seq_offender_states');

  END IF;

END

$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION fn_save_offence
(
   offenders.last_name%TYPE,
   offenders.first_name%TYPE,
   offenders.middle_name%TYPE,
   offenders.age%TYPE,
   offences.offence_date%TYPE,
   state_statutes.code%TYPE,
   state_statutes.description%TYPE,
   offenders.address%TYPE,
   offenders.latitude%TYPE,
   offenders.longitude%TYPE,
   offender_states.abbreviation%TYPE,
   offender_area.county%TYPE
) OWNER TO criminal_offenders_user;









