CREATE OR REPLACE FUNCTION fn_design_patterns_save(
  IN design_patterns.id%TYPE, --id
  IN design_patterns.name%TYPE, --name
  IN design_patterns.active%TYPE, -- active
  IN design_patterns.reference_url%TYPE -- reference_url
)
  RETURNS design_patterns.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO design_patterns
            (
                name,
                active,
                date_created,
                date_modified,
                reference_url
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp,
                $4
            );

            retval := LASTVAL();

        ELSE
            UPDATE design_patterns
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    reference_url = $4
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_design_patterns_save
(
design_patterns.id%TYPE, --id
design_patterns.name%TYPE, --name
design_patterns.active%TYPE, -- active
design_patterns.reference_url%TYPE -- reference_url
)
OWNER TO homesite;