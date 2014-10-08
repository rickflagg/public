DELETE FROM database_platforms;

INSERT INTO database_platforms
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url
)
  VALUES
  (
    'Postgresql',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://postgresql.org'

  );

INSERT INTO database_platforms
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url
)
  VALUES
  (
    'Oracle',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://www.oracle.com/index.html'

  );

INSERT INTO database_platforms
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url
)
  VALUES
  (
    'SQL Server',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'https://www.microsoft.com/en-us/server-cloud/products/sql-server/'

  );