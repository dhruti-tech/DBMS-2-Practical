DECLARE
    A NUMBER := 100;
    B NUMBER := 0;
    C NUMBER;
BEGIN
    C := A / B;

    DBMS_OUTPUT.PUT_LINE('Result: ' || C);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error Code: ' || SQLCODE
        );

        DBMS_OUTPUT.PUT_LINE(
            'Error Message: ' || SQLERRM
        );
END;
/