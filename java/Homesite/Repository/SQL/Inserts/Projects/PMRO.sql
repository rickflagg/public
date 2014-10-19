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
    'Program Management Recruiting and Outreach (PMRO)', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Social Security Administration')), --Client
    TO_DATE('1-1-2009', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('8-1-2012', 'MM-DD-YYYY'), -- End Date
    'Provided support to staff that maintained the database and connection with
	the MAXIMUS MAXSTAR system, provided data extracts from SQL Server
	2005, application customization, and geospatial reporting', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Program Management Recruiting and Outreach (PMRO)')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Team Lead'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Program Management Recruiting and Outreach (PMRO)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );




