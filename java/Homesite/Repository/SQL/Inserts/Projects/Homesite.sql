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
  software_lifecycle_id,
  git_url
)
  VALUES
  (
    'Homesite',
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Banner Consulting')),
    TO_DATE('8-1-2013', 'MM-DD-YYYY'),
    NULL,
    'Personal site',
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('Postgresql')),
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Agile-Iterative')),
    'https://github.com/rickflagg/public/tree/master/java/Homesite'

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Product Owner'))
  );

INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Project Manager'))
  );

INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );

INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Tester'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Java'))
  );

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Javascript'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('Maven'))
  );

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('Spring Framework'))
  );

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('AngularJS'))
  );

-------------------------------------------------------------------------------
-- Insert the Design Patterns
-------------------------------------------------------------------------------

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Model View Controller (MVC)'))
  );

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Repository'))
  );

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Adapter'))
  );