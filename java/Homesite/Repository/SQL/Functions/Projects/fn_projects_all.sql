CREATE OR REPLACE FUNCTION fn_projects_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT projects.*
        FROM projects
        WHERE projects.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_all() OWNER to homesite;