CREATE OR REPLACE FUNCTION fn_global_content_save(
  IN global_content.id%TYPE, --id
  IN global_content.name%TYPE, --name
  IN global_content.active%TYPE, -- active
  IN global_content.content_type_id%TYPE, -- content type id
  IN global_content.content_text%TYPE
)
  RETURNS global_content.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO global_content
            (
                name,
                active,
                date_created,
                date_modified,
                content_type_id,
                content_text

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
            UPDATE global_content
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    content_type_id = $4,
                    content_text = $5

            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_global_content_save
(
global_content.id%TYPE, --id
global_content.name%TYPE, --name
global_content.active%TYPE, -- active
global_content.content_type_id%TYPE, -- content type id
global_content.content_text%TYPE
)
OWNER TO homesite;