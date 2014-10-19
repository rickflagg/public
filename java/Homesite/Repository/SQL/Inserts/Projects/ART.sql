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
    'Assistance Reporting Tool (ART)', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Department of Defense')), --Client
    TO_DATE('10-1-2005', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('8-1-2012', 'MM-DD-YYYY'), -- End Date
    'Responsible for implementing the Data Interchange Standards
Association (DISA) technical security guidelines for DIACAP for this
application which tracks TMA beneficiary customer service questions
and requests and debt collection actions for TMA beneficiaries
worldwide. ART is DIACAP certified.', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('Oracle')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Assistance Reporting Tool (ART)')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Information System Security Officer'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Assistance Reporting Tool (ART)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Assistance Reporting Tool (ART)')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Javascript'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('Assistance Reporting Tool (ART)')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('ASP.NET'))
  );




