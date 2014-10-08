CREATE OR REPLACE FUNCTION fn_projects_by_id
  (
    IN prmId projects.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT projects.*
        FROM projects
        WHERE  projects.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_by_id(projects.id%TYPE) OWNER to homesite;
