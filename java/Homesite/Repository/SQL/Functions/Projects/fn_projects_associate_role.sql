CREATE OR REPLACE FUNCTION fn_projects_associate_role
  (
    IN prmProjectId project_roles.project_id%TYPE,
    IN prmDesignPatternId project_roles.role_id%TYPE
  )
  RETURNS VOID AS
  $BODY$

     BEGIN

       IF NOT EXISTS(SELECT * FROM project_roles
          WHERE project_id = $1 and role_id = $2) THEN
          INSERT INTO project_roles(project_id, role_id)
              VALUES ($1, $2);
       END IF;

     END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_associate_role
(
project_roles.project_id%TYPE,
project_roles.role_id%TYPE
) OWNER to homesite;
