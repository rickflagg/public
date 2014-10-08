CREATE OR REPLACE FUNCTION fn_software_lifecycles_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT software_lifecycles.*
        FROM software_lifecycles
        WHERE software_lifecycles.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_software_lifecycles_all() OWNER to homesite;