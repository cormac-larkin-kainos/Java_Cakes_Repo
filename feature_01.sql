DELIMITER $$

    -- Use the database
    USE kainoos_softwoorn_CormacL $$

DROP PROCEDURE IF EXISTS feature_1 $$
CREATE PROCEDURE feature_1()
DELIMITER $$

    -- Use the database
    USE kainoos_softwoorn_CormacL $$

DROP PROCEDURE IF EXISTS feature_1 $$
CREATE PROCEDURE feature_1()
BEGIN
	START TRANSACTION;

    -- Create employee_type table
    CREATE TABLE employee_type (
        employee_type_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
        employee_type_name VARCHAR(50)
    );

    -- Create the employee table
    CREATE TABLE employee (
        employee_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(255),
        salary DECIMAL(10,2),
        national_insurance_number CHAR(9),
        bank_account_number CHAR(8),
        employee_type_id SMALLINT,
        commission_rate DECIMAL(10,2),
        FOREIGN KEY (employee_type_id) REFERENCES employee_type(employee_type_id)
    );

    -- Add sample/test data for employee_type
    INSERT INTO employee_type (employee_type_name) VALUES ('Sales'), ('Delivery'), ('HR');

    -- Add sample employees 
    INSERT INTO employee (`name`, salary, national_insurance_number, bank_account_number, employee_type_id, commission_rate)
    VALUES 
    ('Sample Employee_1', 50000, '123456789', '12345678', 1, 5.5),
    ('Sample_Employee_2', 35000, '987654321', '23456789', 2, NULL),
    ('Sample_Employee_3', 54000, '345678987', '34455555', 3, NULL);

    
END $$
DELIMITER ;
CALL feature_1();