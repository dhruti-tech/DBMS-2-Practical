CREATE TABLE STUDENT_MARKS
(
    Stud_ID NUMBER(5),
    Stud_Name VARCHAR2(30),
    M1 NUMBER(3),
    M2 NUMBER(3),
    M3 NUMBER(3),
    M4 NUMBER(3),
    M5 NUMBER(3),
    Total NUMBER(4),
    Percentage NUMBER(5,2),
    Grade VARCHAR2(2)
);


INSERT INTO STUDENT_MARKS
VALUES (1, 'Ram', 85, 90, 80, 75, 88, NULL, NULL, NULL);

COMMIT;


DECLARE
    V_ID STUDENT_MARKS.Stud_ID%TYPE := 1;
    V_TOTAL NUMBER(4);
    V_PER NUMBER(5,2);
    V_GRADE VARCHAR2(2);
BEGIN
    SELECT M1 + M2 + M3 + M4 + M5
    INTO V_TOTAL
    FROM STUDENT_MARKS
    WHERE Stud_ID = V_ID;

    V_PER := V_TOTAL / 5;

    IF V_PER >= 90 THEN
        V_GRADE := 'A+';
    ELSIF V_PER >= 80 THEN
        V_GRADE := 'A';
    ELSIF V_PER >= 70 THEN
        V_GRADE := 'B';
    ELSIF V_PER >= 60 THEN
        V_GRADE := 'C';
    ELSIF V_PER >= 50 THEN
        V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;

    UPDATE STUDENT_MARKS
    SET Total = V_TOTAL,
        Percentage = V_PER,
        Grade = V_GRADE
    WHERE Stud_ID = V_ID;

    DBMS_OUTPUT.PUT_LINE('Student ID: ' || V_ID);
    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || V_TOTAL);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || V_PER);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || V_GRADE);
END;
/