CREATE OR REPLACE FUNCTION fn_projects_delete
  (
    IN projects.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            -- Delete the project roles
            DELETE FROM project_roles WHERE project_id = $1;

            -- Delete the Project Programming Languages
            DELETE FROM project_programming_languages WHERE project_id = $1;

            -- Delete the Project Design Patterns
            DELETE FROM project_design_patterns WHERE project_id = $1;

            -- Delete the Project Programming Toolkits
            DELETE FROM project_programming_toolkits WHERE project_id = $1;

            --Delete the project
            DELETE FROM projects WHERE id = $1;


    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_delete
(
  projects.id%TYPE
) OWNER to homesite;