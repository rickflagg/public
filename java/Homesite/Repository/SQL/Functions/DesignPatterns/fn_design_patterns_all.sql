CREATE OR REPLACE FUNCTION fn_design_patterns_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT design_patterns.*
        FROM design_patterns
        WHERE design_patterns.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_design_patterns_all() OWNER to homesite;