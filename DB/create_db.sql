--CREATE DATABASE "hospital"

CREATE SEQUENCE public.patient_patient_id_seq;

CREATE TABLE public.PATIENT (
                patient_id INTEGER NOT NULL DEFAULT nextval('public.patient_patient_id_seq'),
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                CONSTRAINT patient_id_pk PRIMARY KEY (patient_id)
);


ALTER SEQUENCE public.patient_patient_id_seq OWNED BY public.PATIENT.patient_id;

CREATE SEQUENCE public.employee_profession_employee_profession_id_seq;

CREATE TABLE public.EMPLOYEE_PROFESSION (
                employee_profession_id INTEGER NOT NULL DEFAULT nextval('public.employee_profession_employee_profession_id_seq'),
                name VARCHAR(255) NOT NULL,
                CONSTRAINT employee_profession_id_pk PRIMARY KEY (employee_profession_id)
);


ALTER SEQUENCE public.employee_profession_employee_profession_id_seq OWNED BY public.EMPLOYEE_PROFESSION.employee_profession_id;

CREATE SEQUENCE public.role_role_id_seq;

CREATE TABLE public.ROLE (
                role_id INTEGER NOT NULL DEFAULT nextval('public.role_role_id_seq'),
                name VARCHAR(255) NOT NULL,
                user_id INTEGER NOT NULL,
                CONSTRAINT role_id_pk PRIMARY KEY (role_id)
);


ALTER SEQUENCE public.role_role_id_seq OWNED BY public.ROLE.role_id;


CREATE SEQUENCE public.user_user_id_seq;

CREATE TABLE public.USER (
                user_id INTEGER NOT NULL DEFAULT nextval('public.user_user_id_seq'),
                login VARCHAR(50) NOT NULL,
                password_hash VARCHAR(255) NOT NULL,
                CONSTRAINT user_id_pk PRIMARY KEY (user_id)
);


ALTER SEQUENCE public.user_user_id_seq OWNED BY public.USER.user_id;

CREATE SEQUENCE public.employee_employee_id_seq;

CREATE TABLE public.EMPLOYEE (
                employee_id VARCHAR NOT NULL DEFAULT nextval('public.employee_employee_id_seq'),
                hire_date TIMESTAMP NOT NULL,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                office_number VARCHAR(255) NOT NULL,
                employee_profession_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                CONSTRAINT employee_id_pk PRIMARY KEY (employee_id)
);


ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.EMPLOYEE.employee_id;

CREATE SEQUENCE public.disease_disease_id_seq;

CREATE TABLE public.DISEASE (
                disease_id INTEGER NOT NULL DEFAULT nextval('public.disease_disease_id_seq'),
                created_date TIMESTAMP NOT NULL,
                disease_name VARCHAR(255) NOT NULL,
                closed_date TIMESTAMP NOT NULL,
                patient_id INTEGER NOT NULL,
                employee_id VARCHAR NOT NULL,
                CONSTRAINT disease_id_pk PRIMARY KEY (disease_id)
);


ALTER SEQUENCE public.disease_disease_id_seq OWNED BY public.DISEASE.disease_id;

CREATE SEQUENCE public.visit_visit_id_seq;

CREATE TABLE public.VISIT (
                visit_id INTEGER NOT NULL DEFAULT nextval('public.visit_visit_id_seq'),
                symptoms VARCHAR NOT NULL,
                visit_date TIMESTAMP NOT NULL,
                diagnosis VARCHAR NOT NULL,
                disease_id INTEGER NOT NULL,
                CONSTRAINT visit_id_pk PRIMARY KEY (visit_id)
);


ALTER SEQUENCE public.visit_visit_id_seq OWNED BY public.VISIT.visit_id;

CREATE SEQUENCE public.treatment_treatment_id_seq;

CREATE TABLE public.TREATMENT (
                treatment_id INTEGER NOT NULL DEFAULT nextval('public.treatment_treatment_id_seq'),
                description VARCHAR NOT NULL,
                treatment_type VARCHAR(255) NOT NULL,
                visit_id INTEGER NOT NULL,
                CONSTRAINT treatment_id_pk PRIMARY KEY (treatment_id)
);
COMMENT ON COLUMN public.TREATMENT.treatment_type IS 'backed up by enum in java';


ALTER SEQUENCE public.treatment_treatment_id_seq OWNED BY public.TREATMENT.treatment_id;

CREATE SEQUENCE public.treatment_execution_history_treatment_execution_history_id_seq;

CREATE TABLE public.TREATMENT_EXECUTION_HISTORY (
                treatment_execution_history_id INTEGER NOT NULL DEFAULT nextval('public.treatment_execution_history_treatment_execution_history_id_seq'),
                execution_date TIMESTAMP NOT NULL,
                comment VARCHAR NOT NULL,
                employee_id VARCHAR NOT NULL,
                treatment_id INTEGER NOT NULL,
                CONSTRAINT treatment_execution_history_id_pk PRIMARY KEY (treatment_execution_history_id)
);


ALTER SEQUENCE public.treatment_execution_history_treatment_execution_history_id_seq OWNED BY public.TREATMENT_EXECUTION_HISTORY.treatment_execution_history_id;

ALTER TABLE public.DISEASE ADD CONSTRAINT patient_disease_fk
FOREIGN KEY (patient_id)
REFERENCES public.PATIENT (patient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.EMPLOYEE ADD CONSTRAINT employee_profession_employee_fk
FOREIGN KEY (employee_profession_id)
REFERENCES public.EMPLOYEE_PROFESSION (employee_profession_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ROLE ADD CONSTRAINT user_role_fk
FOREIGN KEY (user_id)
REFERENCES public.USER (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.EMPLOYEE ADD CONSTRAINT user_employee_fk
FOREIGN KEY (user_id)
REFERENCES public.USER (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DISEASE ADD CONSTRAINT employee_disease_fk
FOREIGN KEY (employee_id)
REFERENCES public.EMPLOYEE (employee_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.TREATMENT_EXECUTION_HISTORY ADD CONSTRAINT employee_treatment_execution_history_fk
FOREIGN KEY (employee_id)
REFERENCES public.EMPLOYEE (employee_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.VISIT ADD CONSTRAINT disease_visit_fk
FOREIGN KEY (disease_id)
REFERENCES public.DISEASE (disease_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.TREATMENT ADD CONSTRAINT visit_treatment_fk
FOREIGN KEY (visit_id)
REFERENCES public.VISIT (visit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.TREATMENT_EXECUTION_HISTORY ADD CONSTRAINT treatment_treatment_execution_history_fk
FOREIGN KEY (treatment_id)
REFERENCES public.TREATMENT (treatment_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
