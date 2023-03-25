create table dbo.stations_dimn(
station_id varchar(100),
name varchar(100),
latitude float,
longitude float)

insert into dbo.stations_dimn (station_id, name, latitude, longitude)
select station_id, name, latitude, longitude 
from dbo.stg_stations


select top 100 * from dbo.stations_dimn
