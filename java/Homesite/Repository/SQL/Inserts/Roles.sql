DELETE FROM roles;

INSERT INTO roles (name, active, date_created, date_modified)
values('Team Lead', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Project Manager', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Scrum Master', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Configuration Manager', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Testing Manager', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Senior Software Engineer', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Tester', true, current_timestamp, current_timestamp);

INSERT INTO roles (name, active, date_created, date_modified)
  values('Product Owner', true, current_timestamp, current_timestamp);
