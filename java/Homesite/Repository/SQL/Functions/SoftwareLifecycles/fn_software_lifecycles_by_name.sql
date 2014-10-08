CREATE OR REPLACE FUNCTION fn_software_lifecycles_by_name
  (
    IN prmName software_lifecycles.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT software_lifecycles.*
        FROM software_lifecycles
        WHERE UPPER(software_lifecycles.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_software_lifecycles_by_name(software_lifecycles.name%TYPE) OWNER to homesite;