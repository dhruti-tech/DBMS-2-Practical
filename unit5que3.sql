CREATE OR REPLACE TRIGGER AFTER_STAFF_UPDATE
AFTER UPDATE ON STAFF
FOR EACH ROW
BEGIN
    INSERT INTO NEWSTAFF
    VALUES
    (
        :OLD.SID,
        :OLD.SName,
        :OLD.Dno,
        :OLD.Dname,
        :OLD.Gender,
        :OLD.Age,
        :OLD.BasicPay
    );
END;
/

-- testing 
UPDATE STAFF
SET BasicPay = 30000
WHERE SID = 101;

SELECT * FROM NEWSTAFF;