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
    'Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Department of Defense')), --Client
    TO_DATE('1-1-2012', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('10-1-2011', 'MM-DD-YYYY'), -- End Date
    'Central management and reporting system that tracks security breaches throughout DoD', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Agile-Iterative')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Team Lead'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Javascript'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('Spring.NET'))
  );

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('log4net'))
  );


-------------------------------------------------------------------------------
-- Insert the Design Patterns
-------------------------------------------------------------------------------

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Data Access Object'))
  );


INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Dependency Injection'))
  );


INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Department of Defense Privacy and Civil Liberties Office Reports(DPCLOR)')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('POCO'))
  );




