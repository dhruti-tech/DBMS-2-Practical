BEGIN
    UPDATE STAFF
    SET BasicPay = BasicPay + (BasicPay * 0.10)
    WHERE Dno = 10;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            SQL%ROWCOUNT || ' Staff records updated successfully.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'No staff records found in department 10.'
        );
    END IF;

    COMMIT;
END;
/