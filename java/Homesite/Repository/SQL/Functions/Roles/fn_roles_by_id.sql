CREATE OR REPLACE FUNCTION fn_roles_by_id
  (
    IN prmId roles.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT roles.*
        FROM roles
        WHERE  roles.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_roles_by_id(roles.id%TYPE) OWNER to homesite;
