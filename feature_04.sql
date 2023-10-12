DELIMITER $$

USE kainoos_softwoorn_CormacL $$

DROP PROCEDURE IF EXISTS feature_04 $$
CREATE PROCEDURE feature_04()
BEGIN
	START TRANSACTION;

    CREATE TABLE project_employee(
        project_employee_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
        employee_id SMALLINT,
        project_id SMALLINT,
        currently_active BOOLEAN,
        start_date DATE,
        end_date DATE,
        FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
        FOREIGN KEY (project_id) REFERENCES project(project_id)
    );

    INSERT INTO project_employee (employee_id, project_id, currently_active, start_date, end_date) VALUES
    (1, 1, 1, '2023-10-01', NULL),
    (2, 1, 1, '2023-10-01', NULL),
    (3, 1, 0, '2023-10-01', '2023-10-10');

    -- select statement to show which employees are involved with which project
    SELECT employee.name AS Employee_Name, GROUP_CONCAT(project.name SEPARATOR ', ') AS Project_Name
    FROM employee 
    INNER JOIN
    project_employee
    ON employee.employee_id = project_employee.employee_id
    INNER JOIN
    project
    ON project.project_id = project_employee.project_id
    GROUP BY Employee_Name;

	COMMIT;
END $$
DELIMITER ;
CALL feature_04();