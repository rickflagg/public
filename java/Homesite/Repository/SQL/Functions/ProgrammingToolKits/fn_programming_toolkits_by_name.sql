CREATE OR REPLACE FUNCTION fn_programming_toolkits_by_name
  (
    IN prmName programming_toolkits.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_toolkits.*
        FROM programming_toolkits
        WHERE UPPER(programming_toolkits.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_by_name(programming_toolkits.name%TYPE) OWNER to homesite;