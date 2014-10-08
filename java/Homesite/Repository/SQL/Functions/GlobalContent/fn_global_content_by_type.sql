CREATE OR REPLACE FUNCTION fn_global_content_by_type
  (
    IN prmName content_types.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT global_content.*
        FROM global_content inner join content_types on
          global_content.content_type_id = content_types.id
        WHERE content_types.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_global_content_by_type(content_types.id%TYPE) OWNER to homesite;