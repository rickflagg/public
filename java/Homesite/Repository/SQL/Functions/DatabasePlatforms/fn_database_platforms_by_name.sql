CREATE OR REPLACE FUNCTION fn_database_platforms_by_name
(
  IN prmName database_platforms.name%TYPE
)
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT database_platforms.*
        FROM database_platforms
        WHERE UPPER(database_platforms.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_database_platforms_by_name(database_platforms.name%TYPE) OWNER to homesite;