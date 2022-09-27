--CREATE DIMTIME TABLE
BEGIN
    DROP TABLE DIMTIME
END
GO; 

CREATE TABLE DIMTIME (

    [time_id] UNIQUEIDENTIFIER NOT NULL,
    [adate] VARCHAR(50),
    [amonth] INT,
    [aquarter] INT,
    [ayear] INT,
    [adayofweek] INT,
    [adayofmonth] INT
)
GO;

DECLARE @Startdate DATETIME
DECLARE @Enddate DATETIME
SET @StartDate = (SELECT MIN(TRY_CONVERT(datetime, left(tripstarttime, 19))) FROM staging_trip)
SET @EndDate = DATEADD(year, 5, (SELECT MAX(TRY_CONVERT(datetime, left(tripendtime, 19))) FROM staging_trip))

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DIMTIME(time_id,adate,amonth,aquarter,ayear,adayofweek,adayofmonth)
        SELECT
            NEWID(), 
            @Startdate as [adate],
            DATEPART(month, @Startdate ) as [amonth],
            DATEPART(quarter, @Startdate) as [aquarter],
            DATEPART(year, @Startdate) as [ayear],
            DATEPART(WEEKDAY, @Startdate) as [adayofweek],
            DATEPART(DAY, @Startdate) as [adayofmonth]
        

    SET @StartDate = DATEADD(day,1,@StartDate)
END



SELECT TOP (100) * FROM [dbo].[DIMTIME]