select * from ecommerce_sales_data;

select distinct count(*) from ecommerce_sales_data;

create table clean_ecommerce_data
like ecommerce_sales_data;

insert clean_ecommerce_data
select *
from ecommerce_sales_data;

select * from clean_ecommerce_data;

UPDATE clean_ecommerce_data
SET `Order Date` = STR_TO_DATE(`Order Date`, '%Y-%m-%d');

ALTER TABLE clean_ecommerce_data
MODIFY COLUMN `Order Date` DATE;

