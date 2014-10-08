CREATE OR REPLACE FUNCTION fn_projects_by_name
  (
    IN prmName projects.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT projects.*
        FROM projects
        WHERE UPPER(projects.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_by_name(projects.name%TYPE) OWNER to homesite;
