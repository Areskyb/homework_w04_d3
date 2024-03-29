DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  logo_url VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house INT4 REFERENCES houses(id) ON DELETE CASCADE,
  age INT4
);
