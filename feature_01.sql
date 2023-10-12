DELIMITER $$

    -- Create the database
    CREATE DATABASE kainoos_softwoorn_CormacL;

    -- Use the database
    USE kainoos_softwoorn_CormacL;

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
        commission_rate DECIMAL(2,2)
    );
    
    -- Add foreign key constraint
    ALTER TABLE employee 
    ADD CONSTRAINT fk_employee_employee_type
    FOREIGN KEY (employee_type_id)
    REFERENCES employee_type(employee_type_id);
    
END $$
DELIMITER ;
CALL feature_1();