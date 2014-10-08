CREATE OR REPLACE FUNCTION fn_global_content_by_name
  (
    IN prmName global_content.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT global_content.*
        FROM global_content
        WHERE UPPER(global_content.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_global_content_by_name(global_content.name%TYPE) OWNER to homesite;