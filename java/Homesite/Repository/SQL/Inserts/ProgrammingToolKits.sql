DELETE FROM programming_toolkits;

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'Maven',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://maven.apache.org/',
    (SELECT id from programming_languages where name = 'Java')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'Spring Framework',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://spring.io/docs',
    (SELECT id from programming_languages where name = 'Java')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'log4j',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://logging.apache.org/log4j/2.x/',
    (SELECT id from programming_languages where name = 'Java')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'log4Net',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://logging.apache.org/log4j/2.x/',
    (SELECT id from programming_languages where name = 'Java')

  );


INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'JQuery',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://jquery.com/',
    (SELECT id from programming_languages where name = 'Javascript')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'Flask',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://flask.pocoo.org/',
    (SELECT id from programming_languages where name = 'Python')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'EPPlus',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://epplus.codeplex.com/',
    (SELECT id from programming_languages where name = 'C#')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'NHibernate',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://nhforge.org/',
    (SELECT id from programming_languages where name = 'C#')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'JUnit',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://junit.org/',
    (SELECT id from programming_languages where name = 'Java')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'AngularJS',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'https://angularjs.org/',
    (SELECT id from programming_languages where name = 'Javascript')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'WPF',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://msdn.microsoft.com/en-us/library/ms754130(v=vs.110).aspx',
    (SELECT id from programming_languages where name = 'C#')

  );


INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'ASP.NET MVC',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://msdn.microsoft.com/en-us/library/dd566232(v=vs.100).aspx',
    (SELECT id from programming_languages where name = 'C#')

  );


INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'Entity Framework',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://msdn.microsoft.com/en-us/library/dd566232(v=vs.100).aspx',
    (SELECT id from programming_languages where name = 'C#')

  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'JQuery UI',
    true,
    current_timestamp,
    current_timestamp,
    null,
    '',
    (SELECT id from programming_languages where UPPER(name) = ('Javascript'))
  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'CSS',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://en.wikipedia.org/wiki/Cascading_Style_Sheets',
    null
  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'Bootstrap',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://getbootstrap.com/',
    null
  );

INSERT INTO programming_toolkits
(
  name,
  active,
  date_created,
  date_modified,
  sort_order,
  reference_url,
  programming_language_id
)
  VALUES
  (
    'JQuery Datatables',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://www.datatables.net/',
    (SELECT id from programming_languages where UPPER(name) = ('Javascript'))
  );





