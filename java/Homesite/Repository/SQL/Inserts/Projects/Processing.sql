-------------------------------------------------------------------------------
-- Main Project Insert
-------------------------------------------------------------------------------

INSERT INTO projects
(
  name,
  client_id,
  start_date,
  end_date,
  description,
  database_platform_id,
  software_lifecycle_id
)
  VALUES
  (
    'FAC Processing',
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('U.S Census Bureau')),
    TO_DATE('3-1-2014', 'MM-DD-YYYY'),
    TO_DATE('10-1-2014', 'MM-DD-YYYY'),
    'The Federal Audit Clearing House Processing application allows
    quality assurance auditors to review submitted audit information in
    relation to grants over $500K and to provide QA indicators for specific
    records. The system contains automatic email notifications at specific
    points in the workflow to notify staff and auditee/auditors of problems
    with a specific audit. The application contains complex workflow
    based on user levels and status flags to implement a queuing
    mechanism so that certain statuses are only viewed by specific levels
    of users.',
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('Oracle')),
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Agile-Scrum'))

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );

INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Scrum Master'))
  );

INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Project Manager'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('WPF'))
  );

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('Log4Net'))
  );

-------------------------------------------------------------------------------
-- Insert the Design Patterns
-------------------------------------------------------------------------------

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Model View Presenter (MVP)'))
  );

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Repository'))
  );

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Adapter'))
  );

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('FAC Processing')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Factory'))
  );