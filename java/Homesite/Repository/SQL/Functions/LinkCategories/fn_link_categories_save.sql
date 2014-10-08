CREATE OR REPLACE FUNCTION fn_link_categories_save(
  IN link_categories.id%TYPE, --id
  IN link_categories.name%TYPE, --name
  IN link_categories.active%TYPE
)
  RETURNS link_categories.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO link_categories
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
            UPDATE link_categories
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

ALTER FUNCTION fn_link_categories_save
(
link_categories.id%TYPE, --id
link_categories.name%TYPE, --name
link_categories.active%TYPE -- active
)
OWNER TO homesite;