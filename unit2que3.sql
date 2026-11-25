DECLARE
    CURSOR C_DEPT IS
        SELECT DISTINCT Dno, Dname
        FROM STAFF
        ORDER BY Dno;

    CURSOR C_STAFF(P_DNO NUMBER) IS
        SELECT SID, SName, BasicPay
        FROM STAFF
        WHERE Dno = P_DNO;

    V_DA NUMBER(10,2);
    V_HRA NUMBER(10,2);
    V_MEDICAL NUMBER(10,2);
    V_PF NUMBER(10,2);
    V_GROSS NUMBER(10,2);
    V_TOTAL NUMBER(10,2);
BEGIN
    FOR D IN C_DEPT
    LOOP
        V_TOTAL := 0;

        DBMS_OUTPUT.PUT_LINE(
            'Department: ' || D.Dname
        );

        FOR S IN C_STAFF(D.Dno)
        LOOP
            V_DA := S.BasicPay * 0.50;
            V_HRA := S.BasicPay * 0.15;
            V_MEDICAL := 500;
            V_PF := S.BasicPay * 0.10;

            V_GROSS := S.BasicPay + V_DA + V_HRA
                       + V_MEDICAL - V_PF;

            V_TOTAL := V_TOTAL + V_GROSS;

            DBMS_OUTPUT.PUT_LINE(
                'Staff Name: ' || S.SName ||
                ' Basic Pay: ' || S.BasicPay
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE(
            'Total Gross Pay: ' || V_TOTAL
        );

        DBMS_OUTPUT.PUT_LINE('--------------------');
    END LOOP;
END;
/