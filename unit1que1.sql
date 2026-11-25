DECLARE
    P NUMBER(10,2) := 50000;
    R NUMBER(5,2) := 8;
    T NUMBER(5,2) := 2;
    SI NUMBER(10,2);
BEGIN
    SI := (P * R * T) / 100;

    DBMS_OUTPUT.PUT_LINE('Loan Amount: ' || P);
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || R);
    DBMS_OUTPUT.PUT_LINE('Number of Years: ' || T);
    DBMS_OUTPUT.PUT_LINE('Simple Interest: ' || SI);
END;
/
