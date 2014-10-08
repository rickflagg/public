CREATE OR REPLACE FUNCTION fn_content_types_by_name
  (
    IN prmName content_types.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT content_types.*
        FROM content_types
        WHERE UPPER(content_types.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_content_types_by_name(content_types.name%TYPE) OWNER to homesite;