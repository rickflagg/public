CREATE OR REPLACE FUNCTION fn_programming_toolkits_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_toolkits.*
        FROM programming_toolkits
        WHERE programming_toolkits.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_toolkits_all() OWNER to homesite;