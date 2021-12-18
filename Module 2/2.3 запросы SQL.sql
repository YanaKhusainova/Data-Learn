--Вычисляем сумму продаж(total_sales) и сумму прибыли(total_profit) в каждый год
select  round(sum(sales),2) as total_sales,
		    round(sum(profit),2) as total_profit,
		    extract(year from order_date) as years
from orders
group by years
order by years asc;

--Вычисляем ежемесячные продажи по сегментам (Monthly Sales by Segment)
select  round(sum(sales),2) as Monthly_Sales_by_segment,
		    extract(month from order_date) as month,
		    extract(year from order_date) as years,
		    segment
from orders
group by  years,
          month, 
          segment
order by years, month asc;

--Вычисляем количество продаж на одного клиента (seles per customer)
select  round(avg(quantity),2) as sales_per_customer,
	      extract(year from order_date) as years
from orders
group by years
order by years;

--Вычисляем среднюю скидку по регионам(discount region)
select round(avg(discount),2) as discount_region,
		extract(year from order_date) as years
from orders
group by years
order by years;

--Вычисляем сумму продаж каждого менеджера по месяцам(Person Sales)
select  round(sum(sales),2) as Person_Sales, Person,
		    extract(month from order_date) as month,
		    extract(year from order_date) as years
from orders inner join people on orders.region=people.region
group by  person,
		      month,
		      years
order by  month,
          years,
          Person_Sales desc;
