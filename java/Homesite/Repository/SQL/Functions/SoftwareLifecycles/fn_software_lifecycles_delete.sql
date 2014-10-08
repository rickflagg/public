CREATE OR REPLACE FUNCTION fn_software_lifecycles_delete
  (
    IN software_lifecycles.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM software_lifecycles
            WHERE software_lifecycles.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_software_lifecycles_delete
(
software_lifecycles.id%TYPE
) OWNER to homesite;