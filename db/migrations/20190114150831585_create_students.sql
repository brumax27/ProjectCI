-- +micrate Up
CREATE TABLE students (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  grade VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS students;
