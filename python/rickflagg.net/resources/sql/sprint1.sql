
-- Sequences
DROP SEQUENCE IF EXISTS seq_projects;
DROP SEQUENCE IF EXISTS seq_technologies;
DROP SEQUENCE IF EXISTS seq_roles;
DROP SEQUENCE IF EXISTS seq_organizations;
DROP SEQUENCE IF EXISTS seq_auth_tokens;
DROP SEQUENCE IF EXISTS seq_logs;

CREATE SEQUENCE seq_projects;
CREATE SEQUENCE seq_technologies;
CREATE SEQUENCE seq_roles;
CREATE SEQUENCE seq_organizations;
CREATE SEQUENCE seq_auth_tokens;
CREATE SEQUENCE seq_logs;

-- Tables

DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS technologies CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS organizations CASCADE;
DROP TABLE IF EXISTS project_technologies CASCADE;
DROP TABLE IF EXISTS project_roles CASCADE;
DROP TABLE IF EXISTS auth_tokens CASCADE;
DROP TABLE IF EXISTS logs CASCADE;

create table technologies
(
  id int8 not null,
  name varchar(400) not null,
  active boolean default true,
  icon varchar(50),
  link varchar(1000),
  CONSTRAINT pk_technologies PRIMARY KEY(id)
);

create table roles
(
  id int8 not null,
  name varchar(400) not null,
  active boolean default true,
  CONSTRAINT pk_roles PRIMARY KEY(id)
);

create table organizations
(
  id int8 not null,
  name varchar(400) not null,
  active boolean not null default true,
  CONSTRAINT pk_organizations PRIMARY KEY(id)
);


CREATE TABLE projects
(
  id int8 not null,
  name varchar(400) not null,
  description text not null,
  start_date date not null,
  end_date date null,
  organization_id int8 not null,
  client_id int8 not null,
  notable text null,
  active boolean default true,
  url varchar(1000),
  CONSTRAINT pk_projects PRIMARY KEY(id),
  CONSTRAINT fk_project_organization FOREIGN KEY(organization_id) references organizations(id)
);

create table project_technologies
(
  project_id int8 not null,
  technology_id int8 not null,
  CONSTRAINT pk_project_technologies PRIMARY KEY(project_id, technology_id),
  CONSTRAINT fk_project_technologies_technologies FOREIGN KEY (technology_id) REFERENCES technologies(id),
  CONSTRAINT fk_project_technologies_projects FOREIGN KEY (project_id) REFERENCES projects(id)
);

create table project_roles
(
  project_id int8 not null,
  role_id int8 not null,
  CONSTRAINT pk_project_roles PRIMARY KEY(project_id, role_id),
  CONSTRAINT fk_project_roles_roles FOREIGN KEY (role_id) REFERENCES roles(id),
  CONSTRAINT fk_project_roles_projects FOREIGN KEY (project_id) REFERENCES projects(id)

);

create table auth_tokens
(
  id int8 not null,
  first_token varchar(20) not null,
  second_token varchar(20) not null,
  third_token varchar(20) not null,
  fourth_token varchar(20) not null,
  CONSTRAINT pk_auth_tokens PRIMARY KEY(id)
);

CREATE TABLE logs
(
  id int8 not null,
  ip varchar(100) null,
  logstamp timestamp not null,
  description text not null,
  CONSTRAINT pk_logs PRIMARY KEY (id)
);


-- Auth Tokens
INSERT INTO auth_tokens
(
  id,
  first_token,
  second_token,
  third_token,
  fourth_token
)
VALUES
(
  nextval('seq_auth_tokens'),
  '012596',
  '056489',
  '816342',
  '987564'
);


-- Technologies
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/C_Sharp_(programming_language)', 'C#', 'c-sharp.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/CSS', 'CSS', 'css.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/HTML5', 'HTML5', 'html5.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/JQuery', 'JQuery', 'jquery.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/Javascript', 'Javascript', 'js.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/Perl', 'Perl', 'perl.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/PLSQL', 'PL/SQL', 'plsql.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/Python', 'Python', 'python.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/Transact-SQL', 'Transact-SQL', 'tsql.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/Windows_Communication_Foundation', 'WCF', 'wcf.png', nextval('seq_technologies'));
insert into technologies (link, name, icon, id) values ('http://en.wikipedia.org/wiki/Windows_Presentation_Foundation', 'WPF', 'wpf.png', nextval('seq_technologies'));


-- Roles
insert into roles (name, id) values ('Technical Lead', nextval('seq_roles'));
insert into roles (name, id) values ('Software Engineer', nextval('seq_roles'));
insert into roles (name, id) values ('Database Developer', nextval('seq_roles'));
insert into roles (name, id) values ('Security Engineer', nextval('seq_roles'));
insert into roles (name, id) values ('Technical Support', nextval('seq_roles'));
insert into roles (name, id) values ('Configuration Manager', nextval('seq_roles'));
insert into roles (name, id) values ('Tester', nextval('seq_roles'));
insert into roles (name, id) values ('Scrum Master', nextval('seq_roles'));
insert into roles (name, id) values ('Project Manager', nextval('seq_roles'));
insert into roles (name, id) values ('Software Architect', nextval('seq_roles'));

-- Organizations
insert into organizations (name, id) values ('NetStar', nextval('seq_organizations'));
insert into organizations (name, id) values ('U.S Census Bureau, Governments Division', nextval('seq_organizations'));
insert into organizations (name, id) values ('Sourcecast', nextval('seq_organizations'));
insert into organizations (name, id) values ('Axiom Resource Management', nextval('seq_organizations'));
insert into organizations (name, id) values ('Centers for Disease and Control', nextval('seq_organizations'));
insert into organizations (name, id) values ('Inverness Technologies', nextval('seq_organizations'));
insert into organizations (name, id) values ('Department of Defense Privacy and Civil Liberties Office', nextval('seq_organizations'));
insert into organizations (name, id) values ('Tricare Human Resources (DOD Tricare)', nextval('seq_organizations'));
insert into organizations (name, id) values ('Social Security Administration', nextval('seq_organizations'));
insert into organizations (name, id) values ('Department of Defense (DoD) Computer/Electronic Accommodations Program', nextval('seq_organizations'));
insert into organizations (name, id) values ('National Association of Home Builders', nextval('seq_organizations'));
insert into organizations (name, id) values ('Department of Education (DoEd) Interagency Committee for Disability Research', nextval('seq_organizations'));
insert into organizations (name, id) values ('Department of Defense (DoD) Tricare Management Activity (TMA) Communications & Customer Service (C&CS)', nextval('seq_organizations'));
insert into organizations (name, id) values ('Defense Health Information Management System', nextval('seq_organizations'));
insert into organizations (name, id) values (' Department of Housing and Urban Development (HUD)', nextval('seq_organizations'));

-- Projects

--
  /*
insert into projects
(
    id,
    name,
    description,
    start_date,
    end_date,
    organization_id,
    client_id,
    notable,
    url
)
values
(
    nextval('seq_projects'),
    '', -- Project Name
    '', --Project Description
    DATE(''), --Start Date
    DATE(''), --End Date
    (select id from organizations where name = ''), -- Organization
    (select id from organizations where name = ''), -- Client
    '',
    null
);

*/

-- Outreach Job Forum
insert into projects
(
  id,
  name,
  description,
  start_date,
  end_date,
  organization_id,
  client_id,
  notable,
  url
)
  values
  (
    nextval('seq_projects'),
    'Outreach Job Forum', --Project Name
    'The Outreach tool allows users to send email messages to single group, to the selected regions or states within a particular group and to multiple groups. The tool also allows user to view email logs after sending email messages and reviewing data currency report, and allows admin users to manage data, including contacts information, user accounts and source data of email groups', --Project Description
    DATE('10/28/2013'), --Start Date/
    null, --End Date
    (select id from organizations where name = 'Sourcecast'), -- Organization
    (select id from organizations where name = 'Sourcecast'), -- Client
    'Finalized application developement and pushed to production environment',
    'http://divercityoutreach.com/'
  );

  -- Insert the Technologies
  INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'C#'), CURRVAL('seq_projects'));

  INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'CSS'), CURRVAL('seq_projects'));

  INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'JQuery'), CURRVAL('seq_projects'));

  -- Insert the Roles
  INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Technical Lead'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Scrum Master'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Project Manager'), CURRVAL('seq_projects'));


INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Architect'), CURRVAL('seq_projects'));




-- Federal Audit Clearing House Processing
insert into projects
(
  id,
  name,
  description,
  start_date,
  end_date,
  organization_id,
  client_id,
  notable,
  url
)
  values
  (
    nextval('seq_projects'),
    'Federal Audit Clearing House Processing', -- Project Name
    'The Federal Audit Clearing House Processing application allows quality assurance auditors to review submitted audit information in relation to grants over $500K and to provide QA indicators for specific records. The system contains automatic email notifications at specific points in the workflow to notify staff and auditee/auditors of problems with a specific audit. The application contains complex workflow based on user levels and status flags to implement a queuing mechanism so that certain statuses are only viewed by specific levels of users.', --Project Description
    DATE('11/08/2012'), --Start Date
    DATE('10/28/2013'), --End Date
    (select id from organizations where name = 'NetStar'), -- Organization
    (select id from organizations where name = 'U.S Census Bureau, Governments Division'), -- Client
    'Due to the massive amount of data that is collected/managed, a native implementation (WinForms) was selected as the UI to provide a responsive interface and workflow.',
    null
  );

-- Insert the Technologies
INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'C#'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'PL/SQL'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'WPF'), CURRVAL('seq_projects'));

-- Insert the Roles
INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Technical Lead'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Engineer'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Architect'), CURRVAL('seq_projects'));




-- Federal Audit Clearing House Education Processing
insert into projects
(
  id,
  name,
  description,
  start_date,
  end_date,
  organization_id,
  client_id,
  notable,
  url
)
  values
  (
    nextval('seq_projects'),
    'Federal Audit Clearing House Education Processing', -- Project Name
    'Implemented change requests on an existing WinForms application to incorporate additional audit data collected for audit years 2013 and beyond. Based on audit year association, user interface elements are dynamically rendered with the appropriate data elements.', --Project Description
    DATE('02/01/2013'), --Start Date
    DATE('04/30/2013'), --End Date
    (select id from organizations where name = 'NetStar'), -- Organization
    (select id from organizations where name = 'U.S Census Bureau, Governments Division'), -- Client
    'I leveraged extensions methods to add required functionality to the existing implementation. I Introduced unit-testing to allow regression testing of my implementation and performed refactoring to clarify problematic areas in the code base.',
    null
  );

-- Insert the Technologies
INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'C#'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'PL/SQL'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'WPF'), CURRVAL('seq_projects'));

-- Insert the Roles
INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Technical Lead'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Engineer'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Architect'), CURRVAL('seq_projects'));


----------------------------------------------------------------------------------------------
-- Project
----------------------------------------------------------------------------------------------


insert into projects
(
  id,
  name,
  description,
  start_date,
  end_date,
  organization_id,
  client_id,
  notable,
  url
)
  values
  (
    nextval('seq_projects'),
    'Client Information Access Provider Membership', -- Project Name
    '.NET Membership extension that interfaces with an in-house authentication system and provides a reusable security to client applications.', --Project Description
    DATE('3/1/2013'), --Start Date
    DATE('4/15/2013'), --End Date
    (select id from organizations where name = 'NetStar'), -- Organization
    (select id from organizations where name = 'U.S Census Bureau, Governments Division'), -- Client
    'Custom configuration section that allows critical elements to be configured per application, MasterPage and MVC Controller extensions that can be called in the client application that properly authenticate and validate the forms authentication.',
    null
  );

-- Insert the Technologies
INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'C#'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'PL/SQL'), CURRVAL('seq_projects'));

-- Insert the Roles
INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Technical Lead'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Engineer'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Architect'), CURRVAL('seq_projects'));

----------------------------------------------------------------------------------------------
-- Project
----------------------------------------------------------------------------------------------

insert into projects
(
  id,
  name,
  description,
  start_date,
  end_date,
  organization_id,
  client_id,
  notable,
  url
)
  values
  (
    nextval('seq_projects'),
    'Center for Disease Control', -- Project Name
    'The objective of the WIESE system was to increase accessibility of information related to CDC required program data about EBIs/PHS for monitoring and evaluation purposes and reduce the amount of time required to communicate changes in requirements to grantees', --Project Description
    DATE('4/15/2012'), --Start Date
    DATE('6/17/2012'), --End Date
    (select id from organizations where name = 'Axiom Resource Management'), -- Organization
    (select id from organizations where name = 'Centers for Disease and Control'), -- Client
    'Complex client side Javascript implementation',
    null
  );

-- Insert the Technologies
INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'CSS'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'HTML5'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'Transact-SQL'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'Javascript'), CURRVAL('seq_projects'));


-- Insert the Roles
INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Project Manager'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Scrum Master'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Architect'), CURRVAL('seq_projects'));

----------------------------------------------------------------------------------------------
-- Project
----------------------------------------------------------------------------------------------


insert into projects
(
  id,
  name,
  description,
  start_date,
  end_date,
  organization_id,
  client_id,
  notable,
  url
)
  values
  (
    nextval('seq_projects'),
    'Insignia Federal System', -- Project Name
    'Web based training scheduling and management program', --Project Description
    DATE('11/1/2011'), --Start Date
    DATE('5/15/2012'), --End Date
    (select id from organizations where name = 'Axiom Resource Management'), -- Organization
    (select id from organizations where name = 'Inverness Technologies'), -- Client
    '',
    null
  );

-- Insert the Technologies
INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'C#'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'CSS'), CURRVAL('seq_projects'));

INSERT INTO project_technologies(technology_id, project_id)
  VALUES ((SELECT id FROM technologies WHERE name = 'Javascript'), CURRVAL('seq_projects'));

-- Insert the Roles
INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Software Architect'), CURRVAL('seq_projects'));

INSERT INTO project_roles(role_id, project_id)
  VALUES ((SELECT id FROM roles WHERE name = 'Project Manager'), CURRVAL('seq_projects'));
