CREATE OR REPLACE FUNCTION fn_clients_by_id
  (
    IN prmName clients.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT clients.*
        FROM clients
        WHERE  clients.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_clients_by_id(clients.id%TYPE) OWNER to homesite;