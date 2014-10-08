CREATE OR REPLACE FUNCTION fn_design_patterns_delete
  (
    IN design_patterns.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM design_patterns
            WHERE design_patterns.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_design_patterns_delete
(
  design_patterns.id%TYPE
) OWNER to homesite;