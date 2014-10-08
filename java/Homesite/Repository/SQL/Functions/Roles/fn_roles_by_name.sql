CREATE OR REPLACE FUNCTION fn_roles_by_name
  (
    IN prmName roles.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT roles.*
        FROM roles
        WHERE UPPER(roles.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_roles_by_name(roles.name%TYPE) OWNER to homesite;
