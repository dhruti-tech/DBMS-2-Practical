DECLARE
    CURSOR C1 IS
        SELECT SName, BasicPay
        FROM STAFF
        ORDER BY BasicPay DESC
        FETCH FIRST 3 ROWS ONLY;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 Highest Paid Staff Members');

    FOR REC IN C1
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || REC.SName ||
            ' Basic Pay: ' || REC.BasicPay
        );
    END LOOP;
END;
/