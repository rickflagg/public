CREATE OR REPLACE FUNCTION fn_link_categories_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT link_categories.*
        FROM link_categories
        WHERE link_categories.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_link_categories_all() OWNER to homesite;