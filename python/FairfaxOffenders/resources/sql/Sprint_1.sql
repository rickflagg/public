
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

DROP TABLE IF EXISTS offender_areas CASCADE;
DROP SEQUENCE IF EXISTS seq_offender_areas;

CREATE TABLE offender_areas
(
  id INT8 NOT NULL,
  state_id INT8 NOT NULL,
  county VARCHAR(100) NOT NULL,
  CONSTRAINT pk_offender_areass PRIMARY KEY (id),
  CONSTRAINT fk_offender_areass_to_state FOREIGN KEY(state_id) REFERENCES offender_states(id)
);

CREATE SEQUENCE seq_offender_areas;

INSERT INTO offender_areas
(
  id,
  state_id,
  county
)
values
(
  nextval('seq_offender_areas'),
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

CREATE SEQUENCE seq_offenders;

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

CREATE SEQUENCE seq_state_statutes;

DROP TABLE IF EXISTS offences CASCADE;
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
  CONSTRAINT fk_offences_to_areas FOREIGN KEY (area_id) REFERENCES offender_areas(id)
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
   IN prmArea offender_areas.county%TYPE
)
RETURNS VOID
AS
$BODY$
DECLARE
  v_state_id numeric := null;
  v_area_id numeric := null;
  v_statute_id numeric := null;
  v_offender_id numeric := null;
  v_offence_id numeric := null;
BEGIN

  -- Check to see if the state exists
  SELECT id INTO v_state_id FROM offender_states WHERE abbreviation = prmState;

  IF v_state_id is null THEN

    BEGIN

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

      COMMIT;

      v_state_id := currval('seq_offender_states');

    EXCEPTION
      WHEN OTHERS THEN
    END;
  END IF;

  -- Check to see if the area exists
  SELECT id INTO v_area_id FROM offender_areas WHERE county = prmArea;

  IF v_area_id IS NULL THEN

    BEGIN

      INSERT INTO offender_areas
    (
      id,
      state_id,
      county
    )
    VALUES
    (
      NEXTVAL('seq_offender_areas'),
      v_state_id,
      prmArea
    );

      COMMIT;

      v_area_id := CURRVAL('seq_offender_areas');
    EXCEPTION
      WHEN OTHERS THEN
    END;

  END IF;  

  -- Check to see if the statute exists
  SELECT id INTO v_statute_id FROM state_statutes WHERE code = prmChargeStatute
  AND state_id = v_state_id;

  IF v_statute_id IS NULL THEN

       INSERT INTO state_statutes
    (
      id,
      code,
      description,
      state_id
    )
    VALUES
    (
      NEXTVAL('seq_state_statutes'),
      prmChargeStatute,
      prmChargeDescription,
      v_state_id
    );


    v_statute_id := CURRVAL('seq_state_statutes');


  END IF;


  -- Check the offender

  SELECT id INTO v_offender_id FROM offenders WHERE first_name = prmFirstname AND
      last_name = prmLastname and middle_name = prmMiddlename and address = prmAddress;

  IF v_offender_id is null THEN

      INSERT INTO offenders
    (
        id,
        first_name,
        last_name,
        middle_name,
        age,
        address,
        latitude,
        longitude,
        hidden
    )
    VALUES
    (
        NEXTVAL('seq_offenders'),
        prmFirstname,
        prmLastname,
        prmMiddlename,
        prmAge,
        prmAddress,
        prmLatitude,
        prmLongitude,
        false
    );

      v_offender_id := CURRVAL('seq_offenders');

  END IF;

  SELECT id INTO v_offence_id FROM offences WHERE area_id = v_area_id
  AND offender_id = v_offender_id
  AND statute_id = v_statute_id
  AND offence_date = prmDateArrested;

  IF v_offence_id IS NULL THEN

      INSERT INTO offences
    (
      id,
      statute_id,
      offence_date,
      offender_id,
      area_id
    )
    VALUES
    (
      NEXTVAL('seq_offences'),
      v_statute_id,
      prmDateArrested,
      v_offender_id,
      v_area_id
    );

  END IF;



END;

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
   offender_areas.county%TYPE
) OWNER TO criminal_offenders_user;

CREATE OR REPLACE FUNCTION fn_search_offenders
(

)
RETURNS VOID
AS
$BODY$

    BEGIN

        /*
        SELECT name, distance
        FROM
            ( SELECT name, ((ACOS(SIN(#{latitude} * PI() / 180) * SIN(u.latitude * PI() / 180) + COS(#{latitude} * PI() / 180) * COS(u.latitude * PI() / 180) * COS((#{longitude} - u.longitude) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) as distance
                FROM users u ) d
                WHERE distance <= 5
                ORDER BY distance ASC;
        */
    END;

$BODY$
LANGUAGE plpgsql;





