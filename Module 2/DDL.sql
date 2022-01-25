create schema dw;

--create calendar_dim
CREATE TABLE dw.calendar_dim
(
    dateid integer NOT NULL DEFAULT nextval('dw.calendar_dim_dateid_seq'::regclass),
    year integer NOT NULL,
    quarter integer NOT NULL,
    month integer NOT NULL,
    week integer NOT NULL,
    date date NOT NULL,
    week_day character varying(20) COLLATE pg_catalog."default" NOT NULL,
    leap character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_calendar_dim PRIMARY KEY (dateid)
)
    
--create customer_dim
CREATE TABLE dw.customer_dim
(
    cust_id integer NOT NULL DEFAULT nextval('dw.customer_dim_cust_id_seq'::regclass),
    customer_id character varying(8) COLLATE pg_catalog."default" NOT NULL,
    customer_name character varying(22) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_customer_dim PRIMARY KEY (cust_id)
)

--craete geo_dim
CREATE TABLE dw.geo_dim
(
    geo_id integer NOT NULL DEFAULT nextval('dw.geo_dim_geo_id_seq'::regclass),
    country character varying(13) COLLATE pg_catalog."default" NOT NULL,
    city character varying(17) COLLATE pg_catalog."default" NOT NULL,
    state character varying(20) COLLATE pg_catalog."default" NOT NULL,
    postal_code character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT pk_geo_dim PRIMARY KEY (geo_id)
)

--create product_dim
CREATE TABLE dw.product_dim
(
    prod_id integer NOT NULL DEFAULT nextval('dw.product_dim_prod_id_seq'::regclass),
    product_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    product_name character varying(127) COLLATE pg_catalog."default" NOT NULL,
    category character varying(15) COLLATE pg_catalog."default" NOT NULL,
    sub_category character varying(11) COLLATE pg_catalog."default" NOT NULL,
    segment character varying(11) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_product_dim PRIMARY KEY (prod_id)
)

-create shipping_dim
CREATE TABLE dw.shipping_dim
(
    ship_id integer NOT NULL DEFAULT nextval('dw.shipping_dim_ship_id_seq'::regclass),
    shipping_mode character varying(14) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_shipping_dim PRIMARY KEY (ship_id)
)

--create sales_fact
CREATE TABLE dw.sales_fact
(
    sales_id integer NOT NULL,
    cust_id integer NOT NULL,
    order_date_id date NOT NULL,
    ship_date_id date NOT NULL,
    prod_id integer NOT NULL,
    ship_id integer NOT NULL,
    geo_id integer NOT NULL,
    order_id character varying(25) COLLATE pg_catalog."default" NOT NULL,
    sales numeric(9,4) NOT NULL,
    profit numeric(21,16) NOT NULL,
    quantity integer NOT NULL,
    discount numeric(4,2) NOT NULL,
    CONSTRAINT pk_sales_fact PRIMARY KEY (sales_id)
)
