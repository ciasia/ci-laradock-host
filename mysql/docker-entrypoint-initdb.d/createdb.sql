#
# Copy createdb.sql.example to createdb.sql
# then uncomment then set database name and username to create you need databases
#
# example: .env MYSQL_USER=appuser and needed db name is myshop_db
#
#    CREATE DATABASE IF NOT EXISTS `myshop_db` ;
#    GRANT ALL ON `myshop_db`.* TO 'appuser'@'%' ;
#
#
# this sql script will auto run when the mysql container starts and the $DATA_PATH_HOST/mysql not found.
#
# if your $DATA_PATH_HOST/mysql exists and you do not want to delete it, you can run by manual execution:
#
#     docker-compose exec mysql bash
#     mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
#

CREATE USER 'homestead'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';

SET GLOBAL log_bin_trust_function_creators = 1;

CREATE DATABASE IF NOT EXISTS `homestead` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `homestead`.* TO 'default'@'%' ;
GRANT ALL ON `homestead`.* TO 'homestead'@'%' ;

CREATE DATABASE IF NOT EXISTS `laravel_testing` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `laravel_testing`.* TO 'default'@'%' ;
GRANT ALL ON `laravel_testing`.* TO 'homestead'@'%' ;

#CREATE DATABASE IF NOT EXISTS `dev_db_3` COLLATE 'utf8_general_ci' ;
#GRANT ALL ON `dev_db_3`.* TO 'default'@'%' ;

FLUSH PRIVILEGES;
