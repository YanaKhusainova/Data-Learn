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
                                    
--insert order_date
insert into public.order_date_dim
select 100+row_number() over() as order_date_id,
				order_date,
				extract(year from orders.order_date),
				extract(quarter from orders.order_date),
				extract(month from orders.order_date),
				extract(week from orders.order_date),
				extract(day from orders.order_date)
			from orders
				
--insert shipping_dim
insert into public.shipping_dim
select 100+row_number() over() as ship_id,
				ship_mode
			from orders
							
--insert ship_date
insert into public.ship_date_dim
select 100+roe_number() over() as ship_date_dim_as,
				ship_date,
				extract(year from orders.shup_date),
				extract(quarter from orders.shup_date),
				extract(month from orders.shup_date),
				extract(week from orders.shup_date)
			from orders
			
--insert sales_fact
insert into sales_fact
select 	row_number() over() as row_id,		
						order_id,
						order_date_id,
						ship_date_dim_id,
						ship_id,
						geo_id,
						product_dim_id,
						sales,
						quantity,
						discount,
						profit
			from orders as o
inner join 
	order_date_dim as od on o.order_date = od.order_date
inner join 
	ship_date_dim as sh on o.ship_date = sh.ships_date
inner join 
	shipping_dim as ss on o.ship_mode = ss.ship_mode
inner join 
	geography_dim as gp on o.city = gp.city and o.state=gp.state and o.postal_code = gp.postal_code
inner join 
	product_dim as pr on o.product_id = pr.product_id
