INSERT INTO global_content (content_type_id, content_text, name, active, date_created, date_modified)
values
(
  (select id from content_types where name = 'Intro'),
  'I am Software Professional/Certified Scrum Master with close to twenty years of extensive experience in all aspects of the
                    software development life-cycle. My primary area of expertise is in building dynamic, well tested,
                    data driven enterprise applications using .NET, Python, and Java technologies.',
  'IntroContent',
   true,
   current_timestamp,
   current_timestamp

);