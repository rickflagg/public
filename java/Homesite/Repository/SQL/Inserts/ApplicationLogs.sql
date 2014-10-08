INSERT INTO application_logs
(
  browser,
  host,
  referrer,
  remote_address,
  path,
  query_string,
  message,
  severity,
  event_type,
  authentication_token,
  event_date,
  success,
  application_name,
  source,
  stack_trace
)
  VALUES
  (
    'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
    'Linode',
    'http://www.google.co.in/search?hl=en&q=java+programming',
    '192.168.1.1',
    '/rest/links/add',
    '?modelName=person',
    'Adding model person {name="person"}',
    'Low',
    'Data Access',
    'homesite-admin',
    current_timestamp,
    true,
    'homesite',
    null,
    null
  );
