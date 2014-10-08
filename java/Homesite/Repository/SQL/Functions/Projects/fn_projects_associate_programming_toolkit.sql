CREATE OR REPLACE FUNCTION fn_projects_associate_programming_toolkit
  (
    IN prmProjectId project_programming_toolkits.project_id%TYPE,
    IN prmDesignPatternId project_programming_toolkits.programming_toolkit_id%TYPE
  )
  RETURNS VOID AS
  $BODY$

     BEGIN
      IF NOT EXISTS(SELECT * FROM project_programming_toolkits
        WHERE project_id = $1 and programming_toolkit_id = $2) THEN
          INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
              VALUES ($1, $2);
      END IF;
     END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_associate_programming_toolkit
(
  project_programming_toolkits.project_id%TYPE,
  project_programming_toolkits.programming_toolkit_id%TYPE
) OWNER to homesite;
