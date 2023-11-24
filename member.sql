select * from user;
CREATE TABLE `USER` (
	`u_id`	varchar(50)	NOT NULL,
	`u_email`	varchar(50)	NOT NULL,
	`u_name`	varchar(50)	NULL,
	`u_pwd`	varchar(50)	NOT NULL,
	`u_phone`	varchar(50)	NOT NULL
);
drop table user;