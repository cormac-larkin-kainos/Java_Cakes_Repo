

USE kainoos_softwoorn_CormacL;

DELIMITER $$
DROP PROCEDURE IF EXISTS feature_06 $$
CREATE PROCEDURE feature_06()
BEGIN
START TRANSACTION;

-- Create a new project and assign client

INSERT INTO project (`name`, `value`, client_id, tech_lead_id, completion_date, completed) 
VALUES ('Olympics', 1000000.00, 3, 3, "2040-09-21", FALSE);
COMMIT;
SELECT 'Transaction committed successfully.';
END $$
DELIMITER ;
CALL feature_06();