DELETE FROM skill_matrix;

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
VALUES
(
  'Core Language Features',
  95.1,
 (select id from skill_matrix_categories where name='C# Skillsets')
);

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Generics and Collections',
    90.00,
    (select id from skill_matrix_categories where name='C# Skillsets')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Lambda and LINQ Expressions',
    85.00,
    (select id from skill_matrix_categories where name='C# Skillsets')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Interoperability',
    70.00,
    (select id from skill_matrix_categories where name='C# Skillsets')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Assemblies, App Domains, Reflection',
    75.00,
    (select id from skill_matrix_categories where name='C# Skillsets')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Entity Framework',
    50.00,
    (select id from skill_matrix_categories where name='.NET Framework Libraries')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'ASP.NET Classic',
    90.00,
    (select id from skill_matrix_categories where name='.NET Framework Libraries')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'ASP.NET MVC3',
    60.00,
    (select id from skill_matrix_categories where name='.NET Framework Libraries')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'ASP.NET Web API',
    20.00,
    (select id from skill_matrix_categories where name='.NET Framework Libraries')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Log4Net',
    90.00,
    (select id from skill_matrix_categories where name='.NET Third Party Libraries')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Quartz.Net',
    75.00,
    (select id from skill_matrix_categories where name='.NET Third Party Libraries')
  );

INSERT INTO skill_matrix (name, rating, skill_matrix_category_id)
  VALUES
  (
    'StringTemplate',
    35.00,
    (select id from skill_matrix_categories where name='.NET Third Party Libraries')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Core Language Features',
    60.00,
    (select id from skill_matrix_categories where name='Java Skillsets')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Generics and Collections',
    55.00,
    (select id from skill_matrix_categories where name='Java Skillsets')
  );

INSERT INTO skill_matrix (name, rating, skill_matrix_category_id)
  VALUES
  (
    'Core Language Features',
    70.00,
    (select id from skill_matrix_categories where name='Python Skillsets')
  );

INSERT INTO skill_matrix (name, rating,  skill_matrix_category_id)
  VALUES
  (
    'Lists and Collections',
    65.00,
    (select id from skill_matrix_categories where name='Python Skillsets')
  );
