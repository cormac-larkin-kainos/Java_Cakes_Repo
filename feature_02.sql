DELIMITER $$

USE kainoos_softwoorn_CormacL $$

DROP PROCEDURE IF EXISTS feature_02 $$
CREATE PROCEDURE feature_02()
BEGIN
	START TRANSACTION;

    CREATE TABLE client(
        client_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(255),
        address VARCHAR(255),
        phone VARCHAR(16)
    );

    INSERT INTO client (`name`, address, phone) VALUES
    ('Kainoos Softwoorn', '5-6 Upper Crescent', '077 12345');
    

	COMMIT;
END $$
DELIMITER ;
CALL feature_02();
