CREATE OR REPLACE FUNCTION fn_roles_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT roles.*
        FROM roles
        WHERE roles.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_roles_all() OWNER to homesite;