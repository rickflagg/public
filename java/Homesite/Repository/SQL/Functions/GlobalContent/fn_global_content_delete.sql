CREATE OR REPLACE FUNCTION fn_global_content_delete
  (
    IN global_content.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM global_content
            WHERE global_content.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_global_content_delete
(
global_content.id%TYPE
) OWNER to homesite;