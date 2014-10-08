CREATE OR REPLACE FUNCTION fn_software_lifecycles_save(
  IN software_lifecycles.id%TYPE, --id
  IN software_lifecycles.name%TYPE, --name
  IN software_lifecycles.active%TYPE, -- active
  IN software_lifecycles.reference_url%TYPE -- reference_url
)
  RETURNS software_lifecycles.id%TYPE AS
  $BODY$

    DECLARE
        retval software_lifecycles.id%TYPE;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO software_lifecycles
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
            UPDATE software_lifecycles
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

ALTER FUNCTION fn_software_lifecycles_save
(
software_lifecycles.id%TYPE, --id
software_lifecycles.name%TYPE, --name
software_lifecycles.active%TYPE, -- active
software_lifecycles.reference_url%TYPE -- reference_url

)OWNER TO homesite;