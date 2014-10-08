CREATE OR REPLACE FUNCTION fn_roles_save(
  IN roles.id%TYPE, --id
  IN roles.name%TYPE, --name
  IN roles.active%TYPE -- active

)
  RETURNS roles.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO roles
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
            UPDATE roles
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

ALTER FUNCTION fn_roles_save
(
roles.id%TYPE, --id
roles.name%TYPE, --name
roles.active%TYPE -- active


)OWNER TO homesite;
