SELECT user,host FROM mysql.user;
SHOW GRANTS for 'testlinkuser'@'localhost';
CREATE USER 'testlinkuser'@'%' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON `testlink`.* TO `testlinkuser`@`%` WITH GRANT OPTION;

flush privileges;