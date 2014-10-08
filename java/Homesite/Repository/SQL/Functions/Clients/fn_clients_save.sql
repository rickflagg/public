CREATE OR REPLACE FUNCTION fn_clients_save(
  IN clients.id%TYPE, --id
  IN clients.name%TYPE, --name
  IN clients.active%TYPE, -- active
  IN clients.reference_url%TYPE -- reference_url
)
  RETURNS clients.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO clients
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
            UPDATE clients
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

ALTER FUNCTION fn_clients_save
(
clients.id%TYPE, --id
clients.name%TYPE, --name
clients.active%TYPE, -- active
clients.reference_url%TYPE -- reference_url

)
OWNER TO homesite;