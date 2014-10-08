
DELETE FROM links;

INSERT INTO links (link_category_id, name, description, url)
values(
  (SELECT id FROM link_categories WHERE name ='General Technology Links'), --category
  'Google I/O 2014', -- name
  'Google I/O''s 2014 Presentation Videos', -- description
  'http://codingmath.com/posts/welcome.html' -- url
);

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='General Programming Links'), --category
    'General Coding Math', -- name
    'Useful site that has tutorials on mathematical programming', -- description
    'http://codingmath.com/posts/welcome.html' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='General Programming Links'), --category
    'Computer Science - Online', -- name
    'Online Bachelors-Level equivalent in computer science', -- description
    'http://blog.agupieware.com/2014/05/online-learning-bachelors-level.html' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='General Programming Links'), --category
    '10 Articles', -- name
    '10 Articles every programmer should read', -- description
    'http://javarevisited.blogspot.sg/2014/05/10-articles-every-programmer-must-read.html' -- url
  );


INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='General Programming Links'), --category
    'Programming Interviews', -- name
    'Excellent notes for preparing for technical interviews', -- description
    'http://www.ocf.berkeley.edu/~kelu/interviews/index.html' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'awesome-dotnet', -- name
    'Extensive listing of .NET libraries, components, and resources', -- description
    'https://github.com/quozd/awesome-dotnet' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'What great .NET developers should know', -- name
    'Very well written list of subjects every .NET developer should be able talk to', -- description
    'http://www.hanselman.com/blog/WhatGreatNETDevelopersOughtToKnowMoreNETInterviewQuestions.aspx' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'Top 10 Javascript traps for a C# developer', -- name
    'Good article on javascript pitfalls to be aware of', -- description
    'http://www.codetails.com/2014/05/27/top-10-javascript-traps-for-a-c-developer/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'SharePod', -- name
    'C# iPod library', -- description
    'http://www.getsharepod.com/fordevelopers/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'Google Music API', -- name
    'C# Google Music API library', -- description
    'https://github.com/nickvane/GoogleMusic-Api/tree/master/GoogleMusic.Api' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'TNS Names Parser', -- name
    'C# TNS Names Parser library', -- description
    'http://www.codeproject.com/Articles/30962/TNSNames-Reader' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'Fluent NHibernate Postgresql', -- name
    'Fluent NHibernate Postgresql', -- description
    'http://openlandscape.net/2010/11/23/fluent-nhibernate-on-postgresql/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Python Links'), --category
    'python-youtube-download', -- name
    'Library to download youtube videos with python', -- description
    'https://github.com/ablanco/python-youtube-download' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Java Links'), --category
    'Installing Java 8 on Ubuntu', -- name
    'Installing Java 8 on Ubuntu server', -- description
    'http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-manually-install-oracle-java-jdk-8-in-ubuntu/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Java Links'), --category
    'Spring I/O Platform', -- name
    'Introduction of the Spring I/O', -- description
    'http://spring.io/blog/2014/06/26/introducing-the-spring-io-platform' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Bootstrap Links'), --category
    'snipplicious', -- name
    'Centralized repository of bootstrap snippets', -- description
    'http://snipplicious.com/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Bootstrap Links'), --category
    'fuelux', -- name
    'fuelux bootstrap components', -- description
    'http://exacttarget.github.io/fuelux/' -- url
  );


INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Javascript Links'), --category
    'Learn Javascript', -- name
    'Excellent javascript tutorial', -- description
    'http://learn-javascript.ericelliott.me/prelaunch/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Javascript Links'), --category
    'Zero Framework', -- name
    'Zero Framework Javascript manifesto', -- description
    'http://bitworking.org/news/2014/05/zero_framework_manifesto' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Javascript Links'), --category
    'Javascript Closures', -- name
    'Good article on really understanding javascript closures', -- description
    'http://blog.jhades.org/really-understanding-javascript-closures/' -- url
  );


INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Household Links'), --category
    'Homemade Mosquito Trap', -- name
    'Build your own homemade mosquito trap and be able to enjoy your backyard again', -- description
    'http://www.thesurvivalistblog.net/homemade-mosquito-trap/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Household Links'), --category
    'Repair Manuals', -- name
    'Repair Manuals for everything', -- description
    'https://www.ifixit.com/Guide' -- url
  );