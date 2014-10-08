CREATE OR REPLACE FUNCTION fn_design_patterns_by_project
  (
    IN prmName projects.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT design_patterns.*
        FROM design_patterns INNER JOIN project_design_patterns ON
            design_patterns.id = project_design_patterns.design_pattern_id
        WHERE  project_design_patterns.project_id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_design_patterns_by_project(projects.id%TYPE) OWNER to homesite;