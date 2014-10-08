CREATE OR REPLACE FUNCTION fn_design_patterns_by_name
  (
    IN prmName design_patterns.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT design_patterns.*
        FROM design_patterns
        WHERE UPPER(design_patterns.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_design_patterns_by_name(design_patterns.name%TYPE) OWNER to homesite;