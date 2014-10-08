CREATE OR REPLACE FUNCTION fn_links_by_name
  (
    IN prmName links.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT links.*
        FROM links
        WHERE UPPER(links.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_links_by_name(links.name%TYPE) OWNER to homesite;