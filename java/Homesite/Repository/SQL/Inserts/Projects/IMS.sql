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
    'IMS',
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('U.S Census Bureau')),
    TO_DATE('8-1-2014', 'MM-DD-YYYY'),
    NULL,
    'The Image Management System (IMS) is an internet application that enables Federal Agency users to search for and download audit reports captured by the Federal Audit Clearinghouse Internet Data Entry System (IDES).  IMS is a password-protected application.  Federal agency National Single Audit Coordinators (NSACs), designated by OMB, are tasked with granting agency users access to IMS. ',
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('Oracle')),
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Agile-Scrum'))

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Senior Software Engineer'))
  );

INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('Homesite')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Scrum Master'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('C#'))
  );

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Javascript'))
  );

-------------------------------------------------------------------------------
-- Insert the Programming ToolKits
-------------------------------------------------------------------------------

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('Entity Framework'))
  );

INSERT INTO project_programming_toolkits(project_id, programming_toolkit_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id from programming_toolkits WHERE UPPER(name) = UPPER('ASP.NET MVC'))
  );

-------------------------------------------------------------------------------
-- Insert the Design Patterns
-------------------------------------------------------------------------------

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Model View Controller (MVC)'))
  );

INSERT INTO project_design_patterns(project_id, design_pattern_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('IMS')),
    (SELECT id from design_patterns WHERE UPPER(name) = UPPER('Repository'))
  );