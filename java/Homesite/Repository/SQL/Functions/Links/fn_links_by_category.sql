CREATE OR REPLACE FUNCTION fn_links_by_category
  (
    IN prmName link_categories.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT links.*
        FROM links
        WHERE  links.link_category_id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_links_by_category(link_categories.id%TYPE) OWNER to homesite;