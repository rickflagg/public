CREATE OR REPLACE FUNCTION fn_clients_delete
  (
    IN clients.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM clients
            WHERE clients.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_clients_delete
(
clients.id%TYPE
) OWNER to homesite;