CREATE OR REPLACE FUNCTION fn_programming_languages_by_name
  (
    IN prmName programming_languages.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_languages.*
        FROM programming_languages
        WHERE UPPER(programming_languages.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_by_name(programming_languages.name%TYPE) OWNER to homesite;