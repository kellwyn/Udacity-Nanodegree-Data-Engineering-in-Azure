--CREATE DIMRIDER TABLE
BEGIN
    DROP TABLE DIMRIDER       
END
GO; 



CREATE TABLE [dbo].[DIMRIDER]
(
    [rider_id] [bigint]  NULL,
	[firstname] [nvarchar](4000)  NULL,
	[lastname] [nvarchar](4000)  NULL,
	[address] [nvarchar](4000)  NULL,
	[birthday] [varchar](50)  NULL,
    [ismember] [bit] NULL
)

INSERT INTO DIMRIDER (rider_id,firstname,lastname,address,birthday,ismember)
SELECT rider_id,firstname,lastname,address,birthday,currentmember
FROM staging_rider

GO

SELECT TOP (100) * FROM [dbo].[dimrider]




