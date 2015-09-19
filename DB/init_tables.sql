-- INSERT INTO public.role (name) VALUES ('ROLE_ADMIN');
-- INSERT INTO public.role (name) VALUES ('ROLE_NURSE');
-- INSERT INTO public.role (name) VALUES ('ROLE_DOCTOR');

INSERT INTO public.employee_profession (name) VALUES ('Therapist');
INSERT INTO public.employee_profession (name) VALUES ('Surgeon');
INSERT INTO public.employee_profession (name) VALUES ('Ophthalmologist');
INSERT INTO public.employee_profession (name) VALUES ('Neurologist');
INSERT INTO public.employee_profession (name) VALUES ('Nurse');



INSERT INTO public.user (user_id,login,password_hash) VALUES (
5,'q','$2a$05$.h44Zj2IjmzylLRe2Ffx5O3/sA0NsMGw.ISS6T8j0bAEgzYLZkRgq');
INSERT INTO public.user (user_id,login,password_hash) VALUES (
6,'doctor','$2a$05$ytY3qm08j2Pe6MacElX/OOV2.mj3fLeFawfyq.jtGWjkU3EJYmQMS');
INSERT INTO public.user (user_id,login,password_hash) VALUES (
7,'nurse','$2a$05$Ec1PdoNgl0ik1NDOTcwqWeavv3tI1DHsxi9Qr4aCuPpxKiD1OGurW');
INSERT INTO public.user (user_id,login,password_hash) VALUES (
1,'admin','$2a$05$0hyMBPcggZpQB.zKSiZLAeB/aQsfPkpaEgZzPog/0mDT6JOjwG/Om');

INSERT INTO public.role (role_id,name,user_id) VALUES (
1,'ROLE_ADMIN',1);
INSERT INTO public.role (role_id,name,user_id) VALUES (
5,'ROLE_ADMIN',5);
INSERT INTO public.role (role_id,name,user_id) VALUES (
6,'ROLE_DOCTOR',6);
INSERT INTO public.role (role_id,name,user_id) VALUES (
7,'ROLE_NURSE',7);
