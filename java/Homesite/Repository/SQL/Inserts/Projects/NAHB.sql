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
    'National Association of Home Builders Event Site', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('National Association of Home Builders')), --Client
    TO_DATE('6-1-2006', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('2-1-2007', 'MM-DD-YYYY'), -- End Date
    'Assisted in developing a large commercial web-site that converted an
existing site built in Practice Extraction and Reporting Language
(PERL) and MySQL to a more robust site built in ASP.NET and SQL
Server 2005', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('National Association of Home Builders Event Site')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('National Association of Home Builders Event Site')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );


INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('National Association of Home Builders Event Site')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Javascript'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('National Association of Home Builders Event Site')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('ASP.NET'))
  );





