CREATE OR REPLACE FUNCTION fn_link_categories_by_name
  (
    IN prmName link_categories.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT link_categories.*
        FROM link_categories
        WHERE UPPER(link_categories.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_link_categories_by_name(link_categories.name%TYPE) OWNER to homesite;