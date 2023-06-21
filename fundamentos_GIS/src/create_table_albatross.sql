
CREATE TABLE public."gps-albatros-isla-guadalupe" (
    id integer NOT NULL,
    geom public.geometry(Point,4326),
    date character varying,
    latitude double precision,
    longitude double precision,
    name character varying
);

ALTER TABLE ONLY public."gps-albatros-isla-guadalupe"
    ADD CONSTRAINT "gps-albatros-isla-guadalupe_pkey" PRIMARY KEY (id);

CREATE INDEX "sidx_gps-albatros-isla-guadalupe_geom" ON public."gps-albatros-isla-guadalupe" USING gist (geom);

