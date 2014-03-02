CREATE OR REPLACE FUNCTION fn_retrieve_project_client_organization
  (
    refcursor,
    IN project_id projects.id%TYPE
  )
  RETURNS REFCURSOR
AS
  $BODY$

  BEGIN

    OPEN $1 FOR
    SELECT organizations.*
    FROM projects LEFT OUTER JOIN
      organizations ON projects.client_id = organizations.id
    WHERE projects.id = project_id;

    RETURN $1;


  END

$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION fn_retrieve_project_client_organization(refcursor, projects.id%TYPE) OWNER TO rickflagg_user;