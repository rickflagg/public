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
    'Interagency Committee for Disability Research (ICDR)', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Department of Education')), --Client
    TO_DATE('12-1-2005', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('06-1-2006', 'MM-DD-YYYY'), -- End Date
    'Optimized the keyword and free-text searching for this multi-site
search application for its recent redesign. Built in SQL Server 2000
and C#. Oversaw the design and development of the database for the
initial release of this application', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Interagency Committee for Disability Research (ICDR)')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Interagency Committee for Disability Research (ICDR)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Interagency Committee for Disability Research (ICDR)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Javascript'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Interagency Committee for Disability Research (ICDR)')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('ASP.NET'))
  );


