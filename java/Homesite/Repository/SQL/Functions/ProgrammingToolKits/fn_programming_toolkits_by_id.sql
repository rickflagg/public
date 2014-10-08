CREATE OR REPLACE FUNCTION fn_programming_toolkits_by_id
  (
    IN prmName programming_toolkits.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT programming_toolkits.*
        FROM programming_toolkits
        WHERE  programming_toolkits.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_by_id(programming_toolkits.id%TYPE) OWNER to homesite;