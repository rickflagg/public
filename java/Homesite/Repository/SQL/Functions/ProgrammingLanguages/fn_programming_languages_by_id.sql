CREATE OR REPLACE FUNCTION fn_programming_languages_by_id
  (
    IN prmName programming_languages.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_languages.*
        FROM programming_languages
        WHERE  programming_languages.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_by_id(programming_languages.id%TYPE) OWNER to homesite;