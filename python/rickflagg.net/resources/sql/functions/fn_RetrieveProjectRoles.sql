CREATE OR REPLACE FUNCTION fn_retrieve_project_roles
  (
    refcursor,
    IN prm_project_id projects.id%TYPE
  )
  RETURNS REFCURSOR
AS
  $BODY$

  BEGIN

    OPEN $1 FOR

    SELECT roles.*
    FROM projects LEFT OUTER JOIN
      project_roles ON projects.id = project_roles.project_id LEFT
      OUTER JOIN roles ON project_roles.role_id = roles.id
    WHERE projects.id = prm_project_id;

    RETURN $1;


  END

$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION fn_retrieve_project_roles(refcursor,projects.id%TYPE) OWNER TO banner;