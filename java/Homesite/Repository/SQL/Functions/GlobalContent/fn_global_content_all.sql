CREATE OR REPLACE FUNCTION fn_global_content_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT global_content.*
        FROM global_content
        WHERE global_content.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_global_content_all() OWNER to homesite;