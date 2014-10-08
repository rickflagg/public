CREATE OR REPLACE FUNCTION fn_software_lifecycles_by_id
  (
    IN prmName software_lifecycles.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT software_lifecycles.*
        FROM software_lifecycles
        WHERE  software_lifecycles.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_software_lifecycles_by_id(software_lifecycles.id%TYPE) OWNER to homesite;