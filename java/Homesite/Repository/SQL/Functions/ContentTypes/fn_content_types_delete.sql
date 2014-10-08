CREATE OR REPLACE FUNCTION fn_content_types_delete
  (
    IN content_types.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM content_types
            WHERE content_types.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_content_types_delete
(
content_types.id%TYPE
) OWNER to homesite;