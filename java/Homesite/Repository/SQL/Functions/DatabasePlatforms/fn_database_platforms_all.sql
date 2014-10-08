CREATE OR REPLACE FUNCTION fn_database_platforms_all()
RETURNS REFCURSOR AS
$BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT database_platforms.*
        FROM database_platforms
        WHERE database_platforms.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_database_platforms_all() OWNER to homesite;