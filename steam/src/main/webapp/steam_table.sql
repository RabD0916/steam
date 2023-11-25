DROP TABLE IF EXISTS User;

CREATE TABLE User (
  u_id varchar(50) NOT NULL,
  u_pwd varchar(50) NOT NULL,
  u_name varchar(50) NOT NULL,
  u_phone varchar(50) NOT NULL,
  u_email varchar(50) NOT NULL,
  
  PRIMARY KEY (u_id)
);
