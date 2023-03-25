create table dbo.trips_fact(
trip_id VARCHAR(100),
station_id VARCHAR(100),
start_station_id VARCHAR(100),
end_station_id VARCHAR(100),
rider_id BIGINT,
trip_duration_in_mins INT,
rider_age_at_trip_start INT)

insert into dbo.trips_fact (trip_id, station_id, start_station_id, end_station_id, rider_id, trip_duration_in_mins, rider_age_at_trip_start)
select t.trip_id, s.station_id, t.start_station_id, t.end_station_id, t.rider_id,
(DATEPART(minute, t.ended_at) - DATEPART(minute, t.started_at) + 60) + (((DATEPART(hour, t.ended_at) - DATEPART(hour, t.started_at))- 1)*60 ) as trip_duration_in_mins,
datediff(year, r.birthday, t.started_at) as rider_age_at_trip_start
from dbo.stg_trips t
join dbo.stg_stations s
on s.station_id = t.start_station_id
and s.station_id = t.end_station_id
JOIN dbo.stg_riders r
on t.rider_id = r.rider_id




select top 10 * from dbo.trips_fact


