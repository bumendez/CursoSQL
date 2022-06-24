CREATE TABLE friend (
id INT,
first_name VARCHAR(30),
last_name VARCHAR (30),
troop INT,
CONSTRAINT PK_ID PRIMARY KEY (id))

;

select * from friend;

INSERT INTO friend(id, first_name, last_name, troop) VALUES
(1, 'Rick', 'Hunter', 2),
(2, 'Roy', 'Fokler', 2),
(3,'Max', 'Sterling', 2),
(4, 'Kramer', 'Key', 2),
(5, 'Mriya', 'Sterling', 2),
(6, 'Ben', 'Dixon', 1);

DELETE FROM friend where id=4;
DELETE FROM troops  

SELECT * FROM friend ORDER BY last_name ASC;
SELECT * FROM troops;

CREATE TABLE troops(
id INT,
description VARCHAR (45),
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES friend (id)
);


INSERT INTO troops (id, description) VALUES
(1, 'Vermilion'),
(2, 'Skull');


CREATE VIEW friends_view AS
SELECT * FROM friend;

select * from friends_view;

CREATE FUNCTION count_troops (id_troop INT)
RETURNS INT
DETERMINISTIC
RETURN (SELECT COUNT(*) FROM friend WHERE troop=id_troop);

select count_troops (2);

select * from troops;tr_troops_default_description

DELIMITER $$
CREATE TRIGGER tr_troops_default_description
BEFORE INSERT
ON troops FOR EACH ROW
BEGIN
	IF NEW.description is null THEN
    SET NEW.description ='default description';
    END IF;
END$$

INSERT INTO troops(id,description) VALUES
(3,'');

INSERT INTO troops (id,description) VALUES
(6,null)
;

DELIMITER $$
CREATE PROCEDURE country_host (d VARCHAR(45))
BEGIN
	SELECT * from troops
    WHERE description= d;
    END$$

select * from troops;

CALL country_host ('Skull');
    
    