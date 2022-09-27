--CREATE FACTPAYMENT TABLE

BEGIN
    DROP TABLE FACTPAYMENT
END
GO;

CREATE TABLE [dbo].[FACTPAYMENT]
(
    payment_id BIGINT NOT NULL,
    dates [UNIQUEIDENTIFIER] NULL,
    amount FLOAT NULL,
    rider_id BIGINT NULL
)
GO;

INSERT INTO FACTPAYMENT (payment_id, dates, amount, rider_id)
SELECT sp.payment_id, dt.time_id, sp.amount, sp.rider_id
FROM dbo.staging_payment as sp
JOIN DIMTIME as dt ON LEFT(sp.dates,10) = LEFT(dt.adate2,10)

GO;

SELECT TOP (100) * FROM [dbo].[factpayment]
