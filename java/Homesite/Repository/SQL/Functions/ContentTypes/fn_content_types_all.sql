CREATE OR REPLACE FUNCTION fn_content_types_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT content_types.*
        FROM content_types
        WHERE content_types.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_content_types_all() OWNER to homesite;