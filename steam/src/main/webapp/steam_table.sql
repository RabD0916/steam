DROP TABLE IF EXISTS Steam;

CREATE TABLE Steam (
  id char(20) NOT NULL,
  pwd char(20) NOT NULL,
  name char(20) NOT NULL,
  gender char(1) NOT NULL,
  birthday char(6) NOT NULL,
  email char(30) NOT NULL,
  
  PRIMARY KEY (id)
);