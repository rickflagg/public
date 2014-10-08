CREATE OR REPLACE FUNCTION fn_application_logs_tail()
  RETURNS REFCURSOR AS
  $BODY$

    DECLARE
        retval REFCURSOR;
    BEGIN

        OPEN retval FOR
            SELECT *
            FROM application_logs
            ORDER BY id DESC
            LIMIT 300;

        return retval;

    END;


$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_application_logs_tail() OWNER TO homesite;