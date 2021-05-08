-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Pacientes" | type: TABLE --
-- DROP TABLE IF EXISTS public."Pacientes" CASCADE;
CREATE TABLE public."Pacientes" (
	"ID_CC" integer NOT NULL,
	"Sexo" varchar(100) NOT NULL,
	edad smallint NOT NULL,
	"Mes" varchar NOT NULL,
	"Servicio" varchar(100) NOT NULL,
	"Estancia" smallint NOT NULL,
	"Tercero" varchar(100) NOT NULL,
	"año" varchar(50),
	"Numero_de_caso_Diagnostico" integer,
	CONSTRAINT "Pacientes_pk" PRIMARY KEY ("ID_CC")

);
-- ddl-end --
-- ALTER TABLE public."Pacientes" OWNER TO postgres;
-- ddl-end --

-- object: public."Registro_med" | type: TABLE --
-- DROP TABLE IF EXISTS public."Registro_med" CASCADE;
CREATE TABLE public."Registro_med" (
	id_med smallint NOT NULL,
	"Nombre_generico" varchar(300),
	"Descripcion" varchar(300),
	"Cantidad" varchar(300) NOT NULL,
	presentacion varchar(300),
	stock smallint NOT NULL,
	id_tipomed_id_tipo_med smallint,
	CONSTRAINT pk_id PRIMARY KEY (id_med)

);
-- ddl-end --
-- ALTER TABLE public."Registro_med" OWNER TO postgres;
-- ddl-end --

-- object: public.id_tipo_med | type: TABLE --
-- DROP TABLE IF EXISTS public.id_tipo_med CASCADE;
CREATE TABLE public.id_tipo_med (
	id_tipomed smallint NOT NULL,
	tipo_medicamento varchar(50),
	CONSTRAINT id_tipo_med_pk PRIMARY KEY (id_tipomed)

);
-- ddl-end --
-- ALTER TABLE public.id_tipo_med OWNER TO postgres;
-- ddl-end --

-- object: public."Diagnostico" | type: TABLE --
-- DROP TABLE IF EXISTS public."Diagnostico" CASCADE;
CREATE TABLE public."Diagnostico" (
	"Numero_de_caso" integer NOT NULL,
	diagnostico varchar(300),
	id_tipomed_id_tipo_med smallint,
	CONSTRAINT "Diagnostico_pk" PRIMARY KEY ("Numero_de_caso")

);
-- ddl-end --
-- ALTER TABLE public."Diagnostico" OWNER TO postgres;
-- ddl-end --

-- object: "Diagnostico_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Pacientes" DROP CONSTRAINT IF EXISTS "Diagnostico_fk" CASCADE;
ALTER TABLE public."Pacientes" ADD CONSTRAINT "Diagnostico_fk" FOREIGN KEY ("Numero_de_caso_Diagnostico")
REFERENCES public."Diagnostico" ("Numero_de_caso") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Pacientes_uq" | type: CONSTRAINT --
-- ALTER TABLE public."Pacientes" DROP CONSTRAINT IF EXISTS "Pacientes_uq" CASCADE;
ALTER TABLE public."Pacientes" ADD CONSTRAINT "Pacientes_uq" UNIQUE ("Numero_de_caso_Diagnostico");
-- ddl-end --

-- object: id_tipo_med_fk | type: CONSTRAINT --
-- ALTER TABLE public."Diagnostico" DROP CONSTRAINT IF EXISTS id_tipo_med_fk CASCADE;
ALTER TABLE public."Diagnostico" ADD CONSTRAINT id_tipo_med_fk FOREIGN KEY (id_tipomed_id_tipo_med)
REFERENCES public.id_tipo_med (id_tipomed) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: id_tipo_med_fk | type: CONSTRAINT --
-- ALTER TABLE public."Registro_med" DROP CONSTRAINT IF EXISTS id_tipo_med_fk CASCADE;
ALTER TABLE public."Registro_med" ADD CONSTRAINT id_tipo_med_fk FOREIGN KEY (id_tipomed_id_tipo_med)
REFERENCES public.id_tipo_med (id_tipomed) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


