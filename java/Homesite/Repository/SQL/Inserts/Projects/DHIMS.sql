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
    'DHIMS Integrated Database', -- Project Name
    (SELECT id FROM clients WHERE UPPER(name) = UPPER('Department of Defense')), --Client
    TO_DATE('11-1-2000', 'MM-DD-YYYY'), -- Start Date
    TO_DATE('8-1-2012', 'MM-DD-YYYY'), -- End Date
    'Oversaw the five developers working on the Integrated Database
(IDB), a Visual Basic/SQL Server client-server application that tracks
a myriad of financial metrics involving government contracts for the
DoD’s Defense Health Information Management System (DHIMS).
This application is Section 508 compatible and conforms to all DoD
security standards. The user base stands at 140. Reporting is done via
Crystal Reports that are tied through a separate data warehouse.
Implemented the security necessary for the IDB to become DITSCAP
certified.', -- Description
    (SELECT id FROM database_platforms WHERE UPPER(name) = UPPER('SQL Server')), -- Database Platform
    (SELECT id from software_lifecycles WHERE UPPER(name) = UPPER('Waterfall')) -- Life Cycle

  );

-------------------------------------------------------------------------------
-- Insert the Roles
-------------------------------------------------------------------------------


INSERT INTO project_roles (project_id, role_id)
  VALUES
  (
    (SELECT id FROM projects WHERE UPPER(name) = UPPER('DHIMS Integrated Database')),
    (SELECT id FROM roles WHERE UPPER(name) = UPPER('Team Lead'))
  );


-------------------------------------------------------------------------------
-- Insert the Programming Languages
-------------------------------------------------------------------------------

INSERT INTO project_programming_languages(project_id, programming_language_id)
  VALUES
  (
    (SELECT id from projects WHERE UPPER(name) = UPPER('DHIMS Integrated Database')),
    (SELECT id from programming_languages WHERE UPPER(name) = UPPER('Visual Basic'))
  );






