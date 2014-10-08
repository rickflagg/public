CREATE OR REPLACE FUNCTION fn_clients_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT clients.*
        FROM clients
        WHERE clients.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_clients_all() OWNER to homesite;