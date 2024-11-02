-- Superuser 계정 생성 (MySQL에서는 SUPER 권한을 통해 관리 권한을 부여)
CREATE USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'gmes1234';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
-- admin 계정의 인증 방식을 변경 (필요시)
-- ALTER USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'admin_password';

-- 개발자 계정 생성 및 DML 권한 부여
CREATE USER 'dev1'@'%' IDENTIFIED BY 'gmes1234';
CREATE USER 'dev2'@'%' IDENTIFIED BY 'gmes1234';
CREATE USER 'dev3'@'%' IDENTIFIED BY 'gmes1234';

-- 특정 데이터베이스 (예: board)에 대해 DML 권한 (SELECT, INSERT, UPDATE, DELETE) 부여
GRANT SELECT, INSERT, UPDATE, DELETE ON `board`.* TO 'dev1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `board`.* TO 'dev2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `board`.* TO 'dev3'@'%';

-- 권한 변경 사항 적용
FLUSH PRIVILEGES;
