CREATE OR REPLACE FUNCTION fn_roles_delete
  (
    IN roles.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM roles
            WHERE roles.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_roles_delete
(
roles.id%TYPE
) OWNER to homesite;