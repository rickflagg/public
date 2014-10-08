CREATE OR REPLACE FUNCTION fn_programming_toolkits_by_project
  (
    IN prmName projects.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_toolkits.*
        FROM programming_toolkits INNER JOIN project_programming_toolkits ON
          project_programming_toolkits.programming_toolkit_id = programming_toolkits.id
        WHERE  project_programming_toolkits.project_id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_by_project(projects.id%TYPE) OWNER to homesite;