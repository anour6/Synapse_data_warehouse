create table dbo.paymant_date_dimn(
payment_date_key INT,
payment_date DATE,
year SMALLINT,
month SMALLINT,
quarter SMALLINT,
account_start_date DATETIME2,
account_end_date DATETIME2)

insert into dbo.paymant_date_dimn (payment_date_key, payment_date, year, month, quarter, account_start_date,
account_end_date)
select p.payment_id as payment_date_key,
SUBSTRING(p.payment_date, 1, 10) as pyament_date,
DATEPART(YEAR, convert(Date, left(p.payment_date, 10))) as year,
DATEPART(MONTH, convert(Date, left(p.payment_date, 10))) as month,
DATEPART(QUARTER, convert(Date, left(p.payment_date, 10))) as quarter,
r.account_start_date,
r.account_end_date
FROM dbo.stg_payments p
JOIN dbo.stg_riders r
on p.rider_id = r.rider_id


select top 10 * from  dbo.paymant_date_dimn