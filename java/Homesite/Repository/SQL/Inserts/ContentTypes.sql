DELETE FROM content_types;

INSERT INTO content_types(name, active, date_created, date_modified)
values ('Intro', true, current_timestamp, current_timestamp);

