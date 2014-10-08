CREATE OR REPLACE FUNCTION fn_links_delete
  (
    IN links.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM links
            WHERE links.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_links_delete
(
links.id%TYPE
) OWNER to homesite;