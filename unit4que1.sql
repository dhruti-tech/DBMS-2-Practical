CREATE OR REPLACE PROCEDURE INCREASE_PAY
(
    P_DNO IN NUMBER,
    P_PERCENT IN NUMBER
)
IS
BEGIN
    UPDATE STAFF
    SET BasicPay = BasicPay + (BasicPay * P_PERCENT / 100)
    WHERE Dno = P_DNO;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            SQL%ROWCOUNT || ' Staff records updated successfully.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE('No staff records found.');
    END IF;

    COMMIT;
END;
/


BEGIN
    INCREASE_PAY(10, 10);
END;
/