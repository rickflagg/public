CREATE OR REPLACE FUNCTION fn_programming_toolkits_save(
  IN programming_toolkits.id%TYPE, --id
  IN programming_toolkits.name%TYPE, --name
  IN programming_toolkits.active%TYPE, -- active
  IN programming_toolkits.reference_url%TYPE, -- reference_url
  IN programming_toolkits.programming_language_id%TYPE --
)
  RETURNS programming_toolkits.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO programming_toolkits
            (
                name,
                active,
                date_created,
                date_modified,
                reference_url,
                programming_language_id
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp,
                $4,
                $5
            );

            retval := LASTVAL();

        ELSE
            UPDATE programming_toolkits
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    reference_url = $4,
                    programming_language_id = $5
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_toolkits_save
(
programming_toolkits.id%TYPE, --id
programming_toolkits.name%TYPE, --name
programming_toolkits.active%TYPE, -- active
programming_toolkits.reference_url%TYPE, -- reference_url
programming_toolkits.programming_language_id%TYPE
)OWNER TO homesite;