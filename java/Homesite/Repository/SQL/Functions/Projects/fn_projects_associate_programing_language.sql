CREATE OR REPLACE FUNCTION fn_projects_associate_programming_language
  (
    IN prmProjectId project_programming_languages.project_id%TYPE,
    IN prmDesignPatternId project_programming_languages.programming_language_id%TYPE
  )
  RETURNS VOID AS
  $BODY$

      BEGIN
        IF NOT EXISTS(SELECT * FROM project_programming_languages
          WHERE project_id = $1 and programming_language_id = $2) THEN
          INSERT INTO project_programming_languages(project_id, programming_language_id)
              VALUES ($1, $2);
        END IF;
      END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_associate_programming_language
(
project_programming_languages.project_id%TYPE,
project_programming_languages.programming_language_id%TYPE
) OWNER to homesite;
