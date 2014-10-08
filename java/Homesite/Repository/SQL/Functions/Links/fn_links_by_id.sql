CREATE OR REPLACE FUNCTION fn_links_by_id
  (
    IN prmName links.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT links.*
        FROM links
        WHERE  links.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_links_by_id(links.id%TYPE) OWNER to homesite;