CREATE OR REPLACE FUNCTION fn_global_content_by_id
  (
    IN prmName global_content.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT global_content.*
        FROM global_content
        WHERE  global_content.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_global_content_by_id(global_content.id%TYPE) OWNER to homesite;