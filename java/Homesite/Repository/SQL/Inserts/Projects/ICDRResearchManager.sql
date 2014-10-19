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
    'ICDR Research Manager', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Department of Education')), --Client
    TO_DATE('4-1-2005', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('11-1-2005', 'MM-DD-YYYY'), -- End Date
    'Assisted in developing an on-line search tool for the Interagency
committee on disability research. The tool provides searchable grant
data mined from various agencies’ disability initiatives.', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('ICDR Research Manager')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('ICDR Research Manager')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Java'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('ICDR Research Manager')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('Struts'))
  );

-------------------------------------------------------------------------------
-- Insert the Design Patterns
-------------------------------------------------------------------------------

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('ICDR Research Manager')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Model View Controller (MVC)'))
  );





