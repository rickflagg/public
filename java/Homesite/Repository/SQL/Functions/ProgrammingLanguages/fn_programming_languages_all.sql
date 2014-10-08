CREATE OR REPLACE FUNCTION fn_programming_languages_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_languages.*
        FROM programming_languages
        WHERE programming_languages.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_all() OWNER to homesite;