DELIMITER $$

    -- Use the database
    USE kainoos_softwoorn_CormacL $$

DROP PROCEDURE IF EXISTS feature_5 $$
CREATE PROCEDURE feature_5()
BEGIN

	START TRANSACTION;

    -- Set the employee as inactive for this project
    UPDATE project_employee
    SET currently_active = FALSE
    WHERE employee_id = 1
    AND project_id = 1;

    -- Set the end date for employee's involvement on this project as todays date.
    UPDATE project_employee
    SET end_date = CURRENT_DATE()
    WHERE employee_id = 1
    AND project_id = 1;

    COMMIT;

    
END $$
DELIMITER ;
CALL feature_5();