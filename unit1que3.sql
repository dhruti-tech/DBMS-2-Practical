DECLARE
    V_SID STAFF.SID%TYPE := &SID;
    V_BASIC STAFF.BasicPay%TYPE;
    V_DA NUMBER(10,2);
    V_HRA NUMBER(10,2);
    V_MEDICAL NUMBER(10,2) := 500;
    V_PF NUMBER(10,2);
    V_GROSS NUMBER(10,2);
BEGIN
    SELECT BasicPay
    INTO V_BASIC
    FROM STAFF
    WHERE SID = V_SID;

    V_DA := V_BASIC * 0.50;
    V_HRA := V_BASIC * 0.15;
    V_PF := V_BASIC * 0.10;

    V_GROSS := V_BASIC + V_DA + V_HRA
               + V_MEDICAL - V_PF;

    DBMS_OUTPUT.PUT_LINE('Staff ID: ' || V_SID);
    DBMS_OUTPUT.PUT_LINE('Basic Pay: ' || V_BASIC);
    DBMS_OUTPUT.PUT_LINE('Gross Pay: ' || V_GROSS);
END;
/