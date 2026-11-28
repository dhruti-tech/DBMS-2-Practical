CREATE TABLE NEWSTAFF AS
SELECT * FROM STAFF WHERE 1 = 2;

CREATE OR REPLACE TRIGGER AFTER_STAFF_INSERT
AFTER INSERT ON STAFF
FOR EACH ROW
BEGIN
    INSERT INTO NEWSTAFF
    VALUES
    (
        :NEW.SID,
        :NEW.SName,
        :NEW.Dno,
        :NEW.Dname,
        :NEW.Gender,
        :NEW.Age,
        :NEW.BasicPay
    );
END;
/

-- testing
INSERT INTO STAFF
VALUES (201, 'Ram', 10, 'HR', 'Male', 25, 50000);

SELECT * FROM NEWSTAFF;