DELIMITER $$
DROP PROCEDURE IF EXISTS feature_03 $$
CREATE PROCEDURE feature_03()
BEGIN
START TRANSACTION:

--Create project table
CREATE TABLE project(
    project_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR (255),
    `value` DECIMAL (10,2),
    client_id SMALLINT,
    tech_lead_id SMALLINT,
    completion_date DATE,
    completed BOOLEAN,
    FOREIGN KEY(client_id) REFERENCES client(client_id),
    FOREIGN KEY(tech_lead_id) REFERENCES employee(employee_id)

);

--Create technology table
CREATE TABLE technology(
    technology_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    technology_name VARCHAR (255)
);

--Create project_technology linking table
CREATE TABLE project_technology(
    project_id SMALLINT,
    technology_id SMALLINT,
    FOREIGN KEY(project_id) REFERENCES project(project_id),
    FOREIGN KEY(technology_id) REFERENCES technology(technology_id)
);

--Insert data into project table
INSERT INTO Project(`name`, `value`, client_id, tech_lead_id, completion_date, completed)
VALUES ('Database Project', 1000.00, 1, 1, CURRENT_DATE(), FALSE);
COMMIT;
SELECT 'Transaction committed successfully.';
END $$
DELIMITER;
CALL my_transaction();