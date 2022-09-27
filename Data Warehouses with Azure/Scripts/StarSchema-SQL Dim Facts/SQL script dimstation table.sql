--CREATE DIMSTATION TABLE
BEGIN
    DROP TABLE DIMSTATION       
END
GO; 

CREATE TABLE [dbo].[DIMSTATION]
    (
        station_id [nvarchar](4000) NULL,
        stationname [nvarchar](4000) NULL,
        latitude FLOAT NULL,
        longitude FLOAT NULL
    )
    GO;

BEGIN
    INSERT INTO DIMSTATION (station_id,stationname,latitude,longitude)
    SELECT * FROM staging_station 
END
GO

SELECT TOP(100) * from [dbo].[DIMSTATION]
