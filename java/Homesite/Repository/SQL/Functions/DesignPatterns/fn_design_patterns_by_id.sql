CREATE OR REPLACE FUNCTION fn_design_patterns_by_id
  (
    IN prmName design_patterns.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT design_patterns.*
        FROM design_patterns
        WHERE  design_patterns.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_design_patterns_by_id(design_patterns.id%TYPE) OWNER to homesite;