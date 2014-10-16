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
    'Client Information Access Provider Membership', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('U.S Census Bureau')), --Client
    TO_DATE('2-13-2013', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('4-13-2013', 'MM-DD-YYYY'), -- End Date
    '.NET Membership extension that interfaces with an in-house
	authentication system and provides a reusable security to client
	applications.', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('Oracle')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Agile-Scrum')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Client Information Access Provider Membership')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Client Information Access Provider Membership')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Client Information Access Provider Membership')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('log4Net'))
  );

-------------------------------------------------------------------------------
-- Insert the Design Patterns
-------------------------------------------------------------------------------

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Client Information Access Provider Membership')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Repository'))
  );





