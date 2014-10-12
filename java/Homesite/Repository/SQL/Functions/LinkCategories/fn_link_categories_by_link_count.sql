CREATE OR REPLACE FUNCTION fn_link_categories_by_link_count()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT link_categories.*
        FROM link_categories INNER JOIN links ON link_categories.id =
                                                 links.link_category_id
        WHERE link_categories.active = true
        GROUP BY link_categories.id
        ORDER BY count(links.id) DESC;
        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_link_categories_by_link_count() OWNER to homesite;