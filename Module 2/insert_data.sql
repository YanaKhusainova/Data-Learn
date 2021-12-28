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
