--insert values product_dim

insert into public.product_dim
select 100+row_number() over() as prod_id,
								category,
								subcategory,
								product_name,
								product_id
							from (select distinct category, 
                                    subcategory, 
                                    product_name,
                                    product_id  from public.orders) as a;
                                    
--insert values geografy_dim

insert into public.product_dim
select 100+row_number() over() as prod_id,
								category,
								subcategory,
								product_name,
								product_id
							from (select distinct category, 
                                    subcategory,
                                    product_name,
                                    product_id   from public.orders) as a;
                                    
--insert oreder_date
insert into public.order_date_dim
select 100+row_number() over() as order_date_id,
								order_date,
								extract(year from orders.order_date),
								extract(quarter from orders.order_date),
								extract(month from orders.order_date),
								extract(week from orders.order_date),
								extract(day from orders.order_date)
						from orders
