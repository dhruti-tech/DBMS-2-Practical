DECLARE
    A NUMBER := 100;
    B NUMBER := 0;
    C NUMBER;
BEGIN
    C := A / B;

    DBMS_OUTPUT.PUT_LINE('Result: ' || C);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Division by zero is not allowed.'
        );
END;
/