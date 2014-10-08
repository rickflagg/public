CREATE OR REPLACE FUNCTION fn_database_platforms_save(
    IN database_platforms.id%TYPE, --id
    IN database_platforms.name%TYPE, --name
    IN database_platforms.active%TYPE, -- active
    IN database_platforms.sort_order%TYPE, -- sort_order
    IN database_platforms.reference_url%TYPE -- reference_url
)
RETURNS database_platforms.id%TYPE AS
$BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO database_platforms
            (
                name,
                active,
                date_created,
                date_modified,
                sort_order,
                reference_url
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
            UPDATE database_platforms
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    sort_order = $4,
                    reference_url = $5
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_database_platforms_save
(
  database_platforms.id%TYPE, --id
  database_platforms.name%TYPE, --name
  database_platforms.active%TYPE, -- active
  database_platforms.sort_order%TYPE, -- sort_order
  database_platforms.reference_url%TYPE -- reference_url

)
OWNER TO homesite;