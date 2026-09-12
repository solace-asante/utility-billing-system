--
-- PostgreSQL database dump
--

\restrict A2eeD6sqldbJ0bunRvveuIZPHWSLaU5oMCLl1E0urx82d83skZF8zfNPQiMlQeH

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bill_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bill_info (
    bill_id integer NOT NULL,
    meter_id integer,
    bill_amount numeric(10,2),
    bill_date date,
    due_date date,
    payment_status character varying(100)
);


--
-- Name: bill_info_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bill_info ALTER COLUMN bill_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bill_info_bill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    city_name character varying(100),
    region character varying(100)
);


--
-- Name: commercial_cust_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commercial_cust_detail (
    customer_id integer NOT NULL,
    company_name character varying(100),
    registration_no character varying(100)
);


--
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(100),
    city_id integer,
    customer_type character varying(100),
    phone_no character varying(20)
);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: meter_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meter_info (
    meter_id integer NOT NULL,
    customer_id integer,
    meter_number character varying(20)
);


--
-- Name: meter_info_meter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.meter_info ALTER COLUMN meter_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.meter_info_meter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    bill_id integer,
    amount_paid numeric(10,2),
    payment_date timestamp without time zone,
    payment_method character varying(100)
);


--
-- Name: bill_info bill_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill_info
    ADD CONSTRAINT bill_info_pkey PRIMARY KEY (bill_id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- Name: commercial_cust_detail commercial_cust_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commercial_cust_detail
    ADD CONSTRAINT commercial_cust_detail_pkey PRIMARY KEY (customer_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: meter_info meter_info_meter_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meter_info
    ADD CONSTRAINT meter_info_meter_number_key UNIQUE (meter_number);


--
-- Name: meter_info meter_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meter_info
    ADD CONSTRAINT meter_info_pkey PRIMARY KEY (meter_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: bill_info fk_bill_meter; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill_info
    ADD CONSTRAINT fk_bill_meter FOREIGN KEY (meter_id) REFERENCES public.meter_info(meter_id);


--
-- Name: commercial_cust_detail fk_commercail_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commercial_cust_detail
    ADD CONSTRAINT fk_commercail_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer fk_customer_city; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: meter_info fk_meter_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meter_info
    ADD CONSTRAINT fk_meter_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: payment fk_payment_bill; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_bill FOREIGN KEY (bill_id) REFERENCES public.bill_info(bill_id);


--
-- PostgreSQL database dump complete
--

\unrestrict A2eeD6sqldbJ0bunRvveuIZPHWSLaU5oMCLl1E0urx82d83skZF8zfNPQiMlQeH

