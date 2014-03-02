CREATE OR REPLACE FUNCTION fn_retrieve_active_projects(refcursor)
RETURNS REFCURSOR
AS
$BODY$

BEGIN

    OPEN $1 FOR SELECT * FROM projects where active = true;

    RETURN $1;


END

$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION fn_retrieve_active_projects(refcursor) OWNER TO rickflagg_user;