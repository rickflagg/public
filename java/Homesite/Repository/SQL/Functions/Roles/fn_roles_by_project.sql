CREATE OR REPLACE FUNCTION fn_roles_by_project
  (
    IN prmId projects.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT roles.*
        FROM roles INNER JOIN project_roles ON
          project_roles.role_id = roles.id
        WHERE  project_roles.project_id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_roles_by_project(projects.id%TYPE) OWNER to homesite;
