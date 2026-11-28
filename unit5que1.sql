CREATE OR REPLACE TRIGGER RESTRICT_WEEKEND
BEFORE INSERT OR UPDATE OR DELETE ON STAFF
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
       IN ('SAT', 'SUN') THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Access to STAFF table is restricted on weekends.'
        );
    END IF;
END;
/

-- Testing

UPDATE STAFF
SET BasicPay = BasicPay + 1000
WHERE SID = 101;