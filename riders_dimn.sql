create table  dbo.riders_dimn(
rider_id int,
first varchar(20),
last varchar(20),
address varchar(50),
is_member bit,
rideable_type VARCHAR(100)
)

insert into dbo.riders_dimn (rider_id, first, last, address, is_member, rideable_type)
select r.rider_id, 
r.first, 
r.last, 
r.address, 
r.is_member,
t.rideable_type
from dbo.stg_riders r
JOIN dbo.stg_trips t
on t.rider_id = r.rider_id


select top 10 * from dbo.riders_dimn