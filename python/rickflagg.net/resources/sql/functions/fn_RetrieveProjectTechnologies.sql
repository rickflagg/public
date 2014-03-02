

CREATE OR REPLACE FUNCTION fn_retrieve_project_technologies
  (
    refcursor,
    IN prm_project_id projects.id%TYPE
  )
  RETURNS REFCURSOR
AS
  $BODY$

  BEGIN

    OPEN $1 FOR

    SELECT technologies.*
    FROM projects LEFT OUTER JOIN
      project_technologies ON projects.id = project_technologies.project_id
      LEFT OUTER JOIN technologies ON project_technologies.technology_id =
         technologies.id
    WHERE projects.id = prm_project_id;

    RETURN $1;


  END

$BODY$
LANGUAGE plpgsql;

ALTER FUNCTION fn_retrieve_project_technologies(refcursor, projects.id%TYPE) OWNER TO rickflagg_user;