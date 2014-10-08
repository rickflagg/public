CREATE OR REPLACE FUNCTION fn_clients_by_name
  (
    IN prmName clients.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT clients.*
        FROM clients
        WHERE UPPER(clients.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_clients_by_name(clients.name%TYPE) OWNER to homesite;