CREATE OR REPLACE FUNCTION fn_link_categories_by_id
  (
    IN prmName link_categories.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT link_categories.*
        FROM link_categories
        WHERE  link_categories.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_link_categories_by_id(link_categories.id%TYPE) OWNER to homesite;