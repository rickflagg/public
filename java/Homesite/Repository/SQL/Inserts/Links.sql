
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

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Java Links'), --category
    'Java One Talks - 2014', -- name
    'Talks from the Java One conference in 2014', -- description
    'https://www.parleys.com/channel/54254c82e4b0b39c12e10bf9/presentations?sort=date&state=public' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='General Programming Links'), --category
    'Newton’s algorithm', -- name
    'Using solving any equation and solving any optimization problem', -- description
    'http://julesjacobs.github.io/2014/10/16/newton-the-ultimate.html' -- url
  );


INSERT INTO links (link_category_id, name, description, url)
 values(
   (SELECT id FROM link_categories WHERE name ='Java Links'), --category
   'JXTN', -- name
   'Java 8 API Extensions and Utilities', -- description
   'https://github.com/AqD/JXTN/' -- url
 );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Javascript Links'), --category
    'ECMAScript 6 Overview', -- name
    'Brief overview of the forthcoming ECMAScript 6 changes', -- description
    'https://llaine.github.io//blog/2014/10/19/es6/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='AngularJS Links'), --category
    'angular-filter', -- name
    'Usefull filters for AngularJS', -- description
    'https://github.com/a8m/angular-filter' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='AngularJS Links'), --category
    'AngularJS Best Practices: Directory Structure', -- name
    'Best practices for  directory structures for both small and large AngularJS apps', -- description
    'http://scotch.io/tutorials/javascript/angularjs-best-practices-directory-structure' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Personal Links'), --category
    'Rules of civility and behavior', -- name
    'George Washington''s  rules of civility and behavior', -- description
    'http://www.foundationsmag.com/civility.html' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='.NET Links'), --category
    'Fluent Interface', -- name
    'How to create fluent interfaces in .NET', -- description
    'http://www.erikschierboom.com/2014/10/08/fluent-interfaces/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Java Links'), --category
    'Java news and resources', -- name
    'Portal site containing Java news and resources', -- description
    'http://www.javais.cool/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='CSS Links'), --category
    'Slick carousel', -- name
    'Fully responsive content carousel', -- description
    'http://kenwheeler.github.io/slick/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Javascript Links'), --category
    'Welcome ES6 !! JavaScript Is Not Fancy Anymore', -- name
    '''Fancy'' things fixed in ES6', -- description
    'http://tech.namshi.com/blog/2014/10/19/welcome-es6-javascript-is-not-fancy-anymore/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Javascript Links'), --category
    'Welcome ES6 !! JavaScript Is Not Fancy Anymore', -- name
    '''Fancy'' things fixed in ES6', -- description
    'http://tech.namshi.com/blog/2014/10/19/welcome-es6-javascript-is-not-fancy-anymore/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='AngularJS Links'), --category
    'AngularJS and RequireJS', -- name
    'Using RequireJS to manage dependencies in AngularJS', -- description
    'http://www.sitepoint.com/using-requirejs-angularjs-applications/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Bootstrap Links'), --category
    'Bootstrap compatible calendar', -- name
    'Nicely style bootstrap calendar', -- description
    'http://codepen.io/bbarry/pen/Eopdk' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Bootstrap Links'), --category
    'Bootstrap Admin site template', -- name
    'Nicely styled admin site template', -- description
    'http://startbootstrap.com/template-overviews/sb-admin/' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='Pipe Links'), --category
    'Estate Pipes', -- name
    'Listing of Estate Pipes for sale', -- description
    'http://www.stemandbriar.com/sales/estate-pipes-for-sale' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='General Technology Links'), --category
    'Responsive design', -- name
    'Responsive design reading list', -- description
    'http://demosthenes.info/blog/925/Web-Developer-Reading-List-Responsive-Design' -- url
  );

INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name ='HTML5 Links'), --category
    'HTML5 Data Attributes', -- name
    'Awesome things about HTML5 Data Attributes', -- description
    'http://vegibit.com/the-top-7-most-awesome-things-about-html5-data-attributes/' -- url
  );


  /*
INSERT INTO links (link_category_id, name, description, url)
  values(
    (SELECT id FROM link_categories WHERE name =''), --category
    '', -- name
    '', -- description
    '' -- url
  );

*/

--General Technology Links
--General Programming Links
--.NET Links
--Python Links
--Java Links
--Bootstrap Links
--Javascript Links
--Household Links
--AngularJS Links
--Naval Links
--Personal Links
--CSS Links
--Pipe Links
--HTML5 Links
