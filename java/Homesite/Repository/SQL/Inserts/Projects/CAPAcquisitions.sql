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
    'CAP Acquisitions Database', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Department of Defense')), --Client
    TO_DATE('3-1-1996', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('3-1-2007', 'MM-DD-YYYY'), -- End Date
    'Provided database and application support to the DoD
Computer/Electronic Accommodations Program (CAP) Acquisitions
Database, a fully Section 508 compliant client-server application built
in Visual Basic and SQL Server. The application tracked product and
service accommodations supplied to DoD and other government
agency employees. The tool also tracked the costing and budgeting
related to these supplied products and services; at present this equates
to a yearly budget of $4 million. Reporting was done via MS Access
that was tied through a separate data warehouse. The application is
completely accessible to users with various disabilities. Participated in
all phases of the system development life cycle. Oversaw the database
administrator for the application. Was responsible for implementing
the DISA technical security guidelines. CAP Acquisitions Database
was DIACAP certified', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('CAP Acquisitions Database')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Team Lead'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('CAP Acquisitions Database')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Visual Basic'))
  );




