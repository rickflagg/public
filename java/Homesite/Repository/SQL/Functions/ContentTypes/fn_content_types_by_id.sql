CREATE OR REPLACE FUNCTION fn_content_types_by_id
  (
    IN prmName content_types.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT content_types.*
        FROM content_types
        WHERE  content_types.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_content_types_by_id(content_types.id%TYPE) OWNER to homesite;