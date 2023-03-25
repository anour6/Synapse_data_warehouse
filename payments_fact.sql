create table dbo.payments_fact(
payment_id BIGINT,
amount DECIMAL,
rider_id BIGINT
)
insert into payments_fact(payment_id, amount, rider_id)
select 
payment_id, amount, rider_id
from dbo.stg_payments



select top 100 * from dbo.payments_fact