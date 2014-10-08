DROP TABLE IF EXISTS database_platforms CASCADE;

CREATE TABLE database_platforms 
(
    id SERIAL not null,
    name varchar(255) not null,
    active boolean default true,
    date_created timestamp not null default current_timestamp,
    date_modified timestamp not null default current_timestamp,
    sort_order int4 null,
    reference_url text null,
    CONSTRAINT pk_database_platform PRIMARY KEY(id)
);

ALTER TABLE database_platforms OWNER TO homesite;

DROP TABLE IF EXISTS programming_languages CASCADE;

CREATE TABLE programming_languages
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  sort_order int4 null,
  reference_url text null,
  CONSTRAINT pk_programming_languages PRIMARY KEY(id)

);

ALTER TABLE programming_languages OWNER TO homesite;



DROP TABLE IF EXISTS programming_toolkits CASCADE;

CREATE TABLE programming_toolkits
(
    id SERIAL not null,
    name varchar(255) not null,
    active boolean default true ,
    date_created timestamp not null default current_timestamp,
    date_modified timestamp not null default current_timestamp,
    sort_order int4 null,
    reference_url text null,
    programming_language_id int8 not null,
    CONSTRAINT pk_programming_toolkit PRIMARY KEY(id),
    CONSTRAINT fk_programming_toolkits_to_languages FOREIGN KEY (programming_language_id) references programming_languages(id)
);

ALTER TABLE programming_toolkits OWNER TO homesite;

DROP TABLE IF EXISTS service_tokens CASCADE;

CREATE TABLE service_tokens
(
  id SERIAL not null,
  name varchar(255) not null,
  key1 text not null,
  key2 text not null,
  key3 text not null,
  key4 text not null,
  active boolean default true,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_service_tokens PRIMARY KEY(id)
);

ALTER TABLE service_tokens OWNER TO homesite;

DROP TABLE IF EXISTS roles CASCADE;

CREATE TABLE roles
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true ,
  date_created timestamp default current_timestamp,
  date_modified  timestamp default current_timestamp,
  CONSTRAINT pk_roles PRIMARY KEY (id)
);

ALTER TABLE roles OWNER TO homesite;

DROP TABLE IF EXISTS software_lifecycles CASCADE;

CREATE TABLE software_lifecycles
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  sort_order int4 null,
  reference_url text null,
  CONSTRAINT pk_software_lifecycles PRIMARY KEY(id)
);

ALTER TABLE software_lifecycles OWNER TO homesite;

DROP TABLE IF EXISTS link_categories CASCADE;

CREATE TABLE link_categories
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_link_categories PRIMARY KEY(id)
);

ALTER TABLE link_categories OWNER TO homesite;

DROP TABLE IF EXISTS links CASCADE;

CREATE TABLE links
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true,
  description text not null,
  url text not null,
  link_category_id int not null,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_links PRIMARY KEY(id),
  CONSTRAINT fk_links_to_link_categories FOREIGN KEY (link_category_id) REFERENCES link_categories(id)
);

ALTER TABLE links OWNER TO homesite;

DROP TABLE IF EXISTS clients CASCADE;

CREATE TABLE clients
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  reference_url text null,
  CONSTRAINT pk_clients PRIMARY KEY(id)
);

ALTER TABLE clients OWNER TO homesite;

DROP TABLE IF EXISTS design_patterns CASCADE;

CREATE TABLE design_patterns
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  reference_url text null,
  CONSTRAINT pk_design_patterns PRIMARY KEY(id)
);

ALTER TABLE design_patterns OWNER TO homesite;


DROP TABLE IF EXISTS projects CASCADE;

CREATE TABLE projects
(
  id SERIAL not null,
  name varchar (255) not null,
  active boolean default true,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  client_id int not null,
  start_date date not null,
  end_date date null,
  description text,
  database_platform_id int,
  software_lifecycle_id int,
  CONSTRAINT pk_projects PRIMARY KEY(id),
  CONSTRAINT fk_projects_to_clients FOREIGN KEY (client_id) REFERENCES clients(id),
  CONSTRAINT fk_projects_to_database_platforms FOREIGN KEY (database_platform_id) REFERENCES database_platforms(id),
  CONSTRAINT fk_projects_to_software_lifecycles FOREIGN KEY(software_lifecycle_id) REFERENCES software_lifecycles
);

ALTER TABLE projects OWNER TO homesite;

DROP TABLE IF EXISTS project_roles CASCADE;

CREATE TABLE project_roles
(
   project_id int not null,
   role_id int not null,
   active boolean default true ,
   date_created timestamp not null default current_timestamp,
   date_modified timestamp not null default current_timestamp,
   CONSTRAINT pk_project_roles PRIMARY KEY (project_id, role_id),
   CONSTRAINT fk_project_roles_to_projects FOREIGN KEY(project_id) REFERENCES projects(id),
   CONSTRAINT fk_project_roles_to_roles FOREIGN KEY(role_id) REFERENCES roles(id)
);

ALTER TABLE project_roles OWNER TO homesite;

DROP TABLE IF EXISTS project_programming_languages CASCADE ;

CREATE TABLE project_programming_languages
(
  project_id int not null,
  programming_language_id int not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_project_programming_languages PRIMARY KEY (project_id, programming_language_id),
  CONSTRAINT fk_project_programming_languages_to_projects FOREIGN KEY(project_id) REFERENCES projects(id),
  CONSTRAINT fk_project_programming_languages_to_programming_languages FOREIGN KEY(programming_language_id) REFERENCES programming_languages(id)
);

ALTER TABLE project_programming_languages OWNER TO homesite;


DROP TABLE IF EXISTS project_design_patterns CASCADE ;

CREATE TABLE project_design_patterns
(
  project_id int not null,
  design_pattern_id int not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_project_design_patterns PRIMARY KEY (project_id, design_pattern_id),
  CONSTRAINT fk_project_design_patterns_to_projects FOREIGN KEY(project_id) REFERENCES projects(id),
  CONSTRAINT fk_project_design_patterns_to_design_patterns FOREIGN KEY(design_pattern_id) REFERENCES design_patterns(id)
);

ALTER TABLE project_design_patterns OWNER TO homesite;


DROP TABLE IF EXISTS project_programming_toolkits CASCADE ;

CREATE TABLE project_programming_toolkits
(
  project_id int not null,
  programming_toolkit_id int not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_project_programming_toolkits PRIMARY KEY (project_id, programming_toolkit_id),
  CONSTRAINT fk_project_programming_toolkits_to_projects FOREIGN KEY(project_id) REFERENCES projects(id),
  CONSTRAINT fk_project_programming_toolkits_to_programming_toolkits FOREIGN KEY(programming_toolkit_id) REFERENCES programming_toolkits(id)
);


ALTER TABLE project_programming_toolkits OWNER TO homesite;

DROP TABLE IF EXISTS skill_matrix_categories CASCADE;

CREATE TABLE skill_matrix_categories
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_skill_matrix_categories PRIMARY KEY (id)
);

ALTER TABLE skill_matrix_categories OWNER TO homesite;


DROP TABLE IF EXISTS skill_matrix CASCADE;

CREATE TABLE skill_matrix
(
  id SERIAL not null,
  name varchar(255),
  rating Double precision,
  skill_matrix_category_id int not null,
  active boolean default true ,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_skill_matrix PRIMARY KEY(id),
  CONSTRAINT fk_skill_matrix_to_category FOREIGN KEY (skill_matrix_category_id) REFERENCES skill_matrix_categories(id)
);

ALTER TABLE skill_matrix OWNER TO homesite;

DROP TABLE IF EXISTS application_logs CASCADE;

CREATE TABLE application_logs
(
  id SERIAL not null,
  browser VARCHAR(200) null,
  host VARCHAR(200) null,
  referrer VARCHAR(200) null,
  remote_address VARCHAR(600) null,
  path VARCHAR(255) null,
  query_string VARCHAR(400),
  message TEXT NOT NULL,
  severity VARCHAR(15),
  event_type VARCHAR(100),
  authentication_token VARCHAR(100),
  event_date TIMESTAMP,
  success boolean,
  application_name VARCHAR(300),
  source varchar (255) null,
  stack_trace text null,
  CONSTRAINT pk_application_log PRIMARY KEY (id)
);

ALTER TABLE application_logs OWNER TO homesite;

DROP TABLE IF EXISTS content_types CASCADE ;

CREATE TABLE content_types
(
  id SERIAL not null,
  name varchar(255) not null,
  active boolean default true,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_content_types PRIMARY KEY (id)
);

ALTER TABLE content_types OWNER TO homesite;

DROP TABLE IF EXISTS global_content CASCADE ;

CREATE TABLE global_content
(
  id SERIAL not null,
  name varchar(255) not null,
  content_text text not null,
  content_type_id int not null,
  active boolean default true,
  date_created timestamp not null default current_timestamp,
  date_modified timestamp not null default current_timestamp,
  CONSTRAINT pk_global_content PRIMARY KEY (id),
  CONSTRAINT fk_global_content_content_types FOREIGN KEY (content_type_id) REFERENCES content_types(id)
);

ALTER TABLE global_content OWNER TO homesite;




