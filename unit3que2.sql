CREATE TABLE STAFF_BACKUP AS
SELECT * FROM STAFF WHERE 1 = 2;


DECLARE
    V_DNO NUMBER := &DNO;

    CURSOR C1 IS
        SELECT *
        FROM STAFF
        WHERE Dno = V_DNO;

    DEPT_NOT_AVAILABLE EXCEPTION;
    V_COUNT NUMBER := 0;
BEGIN
    FOR REC IN C1
    LOOP
        INSERT INTO STAFF_BACKUP
        VALUES (
            REC.SID,
            REC.SName,
            REC.Dno,
            REC.Dname,
            REC.Gender,
            REC.Age,
            REC.BasicPay
        );

        V_COUNT := V_COUNT + 1;
    END LOOP;

    IF V_COUNT = 0 THEN
        RAISE DEPT_NOT_AVAILABLE;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        V_COUNT || ' Staff records inserted into STAFF_BACKUP.'
    );

    COMMIT;

EXCEPTION
    WHEN DEPT_NOT_AVAILABLE THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Department is not available.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
/