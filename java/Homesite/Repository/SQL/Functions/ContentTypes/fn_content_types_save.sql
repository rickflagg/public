CREATE OR REPLACE FUNCTION fn_content_types_save(
  IN content_types.id%TYPE, --id
  IN content_types.name%TYPE, --name
  IN content_types.active%TYPE -- active
)
  RETURNS content_types.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO content_types
            (
                name,
                active,
                date_created,
                date_modified
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp
            );

            retval := LASTVAL();

        ELSE
            UPDATE content_types
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_content_types_save
(
content_types.id%TYPE, --id
content_types.name%TYPE, --name
content_types.active%TYPE -- active
)
OWNER TO homesite;