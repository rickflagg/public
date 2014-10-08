CREATE OR REPLACE FUNCTION fn_link_categories_delete
  (
    IN link_categories.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM link_categories
            WHERE link_categories.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_link_categories_delete
(
link_categories.id%TYPE
) OWNER to homesite;