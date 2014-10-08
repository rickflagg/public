CREATE OR REPLACE FUNCTION fn_programming_languages_by_project
  (
    IN prmId projects.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_languages.*
        FROM programming_languages INNER JOIN project_programming_languages ON
          project_programming_languages.programming_language_id = programming_languages.id
        WHERE  project_programming_languages.project_id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_by_project(projects.id%TYPE) OWNER to homesite;
