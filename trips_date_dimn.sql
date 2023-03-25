create table dbo.trips_date_dimn(
trip_date_key varchar(50),
trip_start_date datetime2,
trip_end_date datetime2,
day_of_week smallint,
name_of_day varchar(10),
trip_start_hr smallint,
trip_start_min smallint,
trip_end_hr smallint,
trip_end_min smallint
)

insert into dbo.trips_date_dimn (trip_date_key, trip_start_date, trip_end_date, day_of_week, name_of_day, trip_start_hr ,trip_start_min, trip_end_hr, trip_end_min)
select  trip_id as trip_date_key,
started_at as trip_start_date,
ended_at as trip_end_date,
DATEPART(WEEKDAY, started_at) as day_of_week,  
DATENAME(WEEKDAY, started_at) as name_of_day,
DATEPART(hour, started_at) as trip_start_hr, 
DATEPART(minute, started_at) as trip_start_min,
DATEPART(hour, ended_at) as trip_end_hr, 
DATEPART(minute, ended_at) as trip_end_min
from  dbo.stg_trips


select top 100 * from  dbo.trips_date_dimn