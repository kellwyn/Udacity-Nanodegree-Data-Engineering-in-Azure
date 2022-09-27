drop table factTrip


CREATE TABLE FACTTRIP (
    [trip_id] VARCHAR(50) NOT NULL,
    [rideable_type] VARCHAR(200),
    [tripstarttime] VARCHAR(50), 
    [tripendtime] VARCHAR(50), 
    [start_station_id] VARCHAR(50), 
    [end_station_id] VARCHAR(50), 
    [duration] VARCHAR(200),
    [rider_age] VARCHAR(200),
    [rider_id] INTEGER
);

INSERT INTO FACTTRIP (
    [trip_id],
    [rideable_type],
    [tripstarttime],
    [tripendtime],
    [start_station_id], 
    [end_station_id], 
    [duration],
    [rider_age],
    [rider_id]    
    )
SELECT 
    staging_trip.trip_id,
	staging_trip.rideable_type,    
    dt1.time_id AS start_time_id,
    dt2.time_id AS end_time_id,  
    staging_trip.start_station_id, 
    staging_trip.end_station_id, 
    DATEDIFF(hour, staging_trip.tripstarttime, staging_trip.tripendtime)      AS duration,
    DATEDIFF(year, staging_rider.birthday, staging_trip.tripstarttime)     AS rider_age,
	staging_rider.rider_id
FROM staging_trip
JOIN staging_rider ON staging_rider.rider_id = staging_trip.rider_id
JOIN dimtime AS dt1 ON left(dt1.adate2,10) = left(staging_trip.tripstarttime,10)
JOIN dimtime AS dt2 ON left(dt2.adate2,10) = left(staging_trip.tripendtime,10)