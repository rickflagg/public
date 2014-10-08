DELETE FROM programming_languages;

INSERT INTO programming_languages
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
    'C#',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://msdn.microsoft.com/en-us/library/618ayhy6.aspx'

  );

INSERT INTO programming_languages
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
    'Java',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'http://docs.oracle.com/javase/7/docs/api/'

  );

INSERT INTO programming_languages
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
    'Python',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'https://docs.python.org/3/reference/'

  );
INSERT INTO programming_languages
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
    'Javascript',
    true,
    current_timestamp,
    current_timestamp,
    null,
    'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference'

  );
