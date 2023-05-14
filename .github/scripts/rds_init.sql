-- Table: public.customer

-- DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    id uuid NOT NULL,
    version bigint,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    inserted_at timestamp(6) without time zone,
    inserted_by character varying(255) COLLATE pg_catalog."default",
    updated_at timestamp(6) without time zone,
    updated_by character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT "CUSTOMER_pkey" PRIMARY KEY (id),
    CONSTRAINT udx_customer UNIQUE (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;
