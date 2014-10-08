CREATE OR REPLACE FUNCTION fn_database_platforms_by_id
  (
    IN prmName database_platforms.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT database_platforms.*
        FROM database_platforms
        WHERE  database_platforms.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_database_platforms_by_id(database_platforms.id%TYPE) OWNER to homesite;