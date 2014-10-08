CREATE OR REPLACE FUNCTION fn_projects_associate_design_pattern
(
  IN prmProjectId project_design_patterns.project_id%TYPE,
  IN prmDesignPatternId project_design_patterns.design_pattern_id%TYPE
)
RETURNS VOID AS
$BODY$
   BEGIN
    IF NOT EXISTS(SELECT * FROM project_design_patterns
      WHERE project_id = $1 and design_pattern_id = $2) THEN
          INSERT INTO project_design_patterns(project_id, design_pattern_id)
              VALUES ($1, $2);
    END IF;
  END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_associate_design_pattern
(
  project_design_patterns.project_id%TYPE,
  project_design_patterns.design_pattern_id%TYPE
) OWNER to homesite;
