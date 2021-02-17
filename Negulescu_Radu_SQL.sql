CREATE TABLE Facultati (
  id_facultate NUMBER constraint pk_facultati primary key,
  nume_facultate VARCHAR2(50),
  adresa VARCHAR2(50)
);

CREATE TABLE Domenii (
  id_domeniu NUMBER constraint pk_domenii primary key,
  id_facultate NUMBER constraint fk_id_facultate_domenii references Facultati (id_facultate) on delete cascade,
  nume_domeniu VARCHAR2(50)
);

CREATE TABLE Studenti (
  id_student NUMBER constraint pk_student primary key,
  id_domeniu NUMBER constraint fk_id_domeniu_studenti references Domenii (id_domeniu) on delete cascade,
  nume VARCHAR2(50),
  prenume VARCHAR2(50),
  program_studii VARCHAR2(50),
  an NUMBER,
  taxa NUMBER(1) constraint ck_taxa_valid_studenti CHECK (taxa IN (0, 1)),
  parinte_cadru_didactic NUMBER(1) constraint ck_parinte_valid_studenti CHECK (parinte_cadru_didactic IN (0, 1))
);


CREATE TABLE Complexe (
  id_complex NUMBER constraint pk_complexe primary key,
  nume_complex VARCHAR2(50),
  adresa VARCHAR2(50)
);

CREATE TABLE Camine (
  id_camin NUMBER constraint pk_camine primary key,
  id_complex NUMBER constraint fk_id_complex_camine references Complexe (id_complex) on delete cascade, 
  nume_camin VARCHAR2(50),
  pret_camera NUMBER
);

CREATE TABLE Camere (
  id_camera NUMBER constraint pk_camere primary key,
  id_camin NUMBER constraint fk_id_camin_camere references Camine (id_camin) on delete cascade,
  id_facultate NUMBER constraint fk_id_facultate_camere references Facultati (id_facultate) on delete cascade,
  nr_camera NUMBER,
  capacitate NUMBER
);

CREATE TABLE Cazari (
  id_camera NUMBER constraint fk_id_camera_cazari references Camere (id_camera) on delete cascade,
  id_student NUMBER constraint fk_id_student_cazari references Studenti (id_student) on delete cascade,  
  data_cazare DATE DEFAULT SYSDATE,
  data_decazare DATE DEFAULT SYSDATE,
  constraint pk_cazari primary key (id_camera, id_student, data_cazare)
);

insert into Facultati values(1,'FMI','Str. Academiei nr.14, Bucuresti'); 
insert into Facultati values(2,'Facultatea de drept','Bd. Mihail Kogalniceanu nr. 36-46, Bucuresti');
insert into Facultati values(3,'Facultatea de Geografie','Bd. Nicolae B?lcescu Nr. 1, Bucuresti');

insert into Domenii
values (1,1,'Informatica');

insert into Domenii
values (2,1,'Matematica');

insert into Domenii 
values (3,1,'CTI');

insert into Domenii
values (4,2,'Drept');

insert into Domenii
values (5,3,'Geografie');

insert into Domenii
values (6,3,'Stiinta Mediului');

insert into Studenti
values (1,1,'Negulescu','Radu','Licenta',2,0,0);

insert into Studenti
values (2,1,'Pavalasc','Irina','Licenta',2,0,0);

insert into Studenti
values (3,4,'Popescu','Ion','Master',1,1,0);

insert into Studenti
values (4,5,'Toma','Sergiu','Licenta',1,0,1);

insert into Studenti
values (5,3,'Popa','Andrei','Licenta',3,1,1);

insert into Studenti
values (6,1,'Bigan','Marian','Licenta',2,0,0);

insert into Studenti
values (7,1,'Nimara','Dan','Licenta',2,0,0);

insert into Studenti
values (8,1,'Popa','Andreea','Licenta',2,0,0);

insert into Studenti
values (20,1,'Georgescu','Sabina','Licenta',2,0,0);


insert into Complexe
values (1,'Complex Studentesc Grozavesti', 'Splaiul Independentei 204');

insert into Complexe
values (2,'Complex Mihail Kogalniceanu', ' Bvd. Mihail Kogalniceanu 36-46');

insert into Complexe
values (3,'Complex Stoian Militaru', 'Strada Stoian Militaru 8-10');

insert into Camine
values (1, 1, 'Camin A1', 180);

insert into Camine
values (2, 1, 'Camin A', 140);

insert into Camine
values (3, 1, 'Camin B', 140);

insert into Camine
values (4, 1, 'Camin C', 140);

insert into Camine
values (5, 1, 'Camin D', 140);

insert into Camine
values (6, 2, 'Camin A', 160);

insert into Camine
values (7, 2, 'Camin B', 160);

insert into Camine
values (8, 3, 'Camin A', 170);

insert into Camine
values (9, 3, 'Camin B', 170);

insert into Camine
values (10, 3, 'Camin C', 165);

insert into Camere
values (1, 1, 1, 1, 3);

insert into Camere
values (2, 1, 1, 2, 3);

insert into Camere
values (3, 1, 2, 3, 3);

insert into Camere
values (4, 2, 1, 1, 2);

insert into Camere
values (5, 2, 1, 2, 2);

insert into Camere
values (6, 2, 3, 3, 2);

insert into Camere
values (7, 3, 1, 1, 2);

insert into Camere
values (8, 3, 1, 2, 2);

insert into Camere
values (9, 3, 2, 3, 2);

insert into Camere
values (10, 4, 1, 1, 2);

insert into Camere
values (11, 4, 1, 2, 2);

insert into Camere
values (12, 4, 3, 3, 2);

insert into Camere
values (13, 5, 1, 1, 2);

insert into Camere
values (14, 5, 1, 2, 2);

insert into Camere
values (15, 5, 1, 3, 2);

insert into Camere
values (16, 6, 2, 1, 3);

insert into Camere
values (17, 6, 1, 2, 3);

insert into Camere
values (18, 6, 3, 3, 3);

insert into Camere
values (19, 7, 2, 1, 3);

insert into Camere
values (20, 7, 1, 2, 3);

insert into Camere
values (21, 7, 3, 3, 3);

insert into Camere
values (22, 8, 1, 1, 2);

insert into Camere
values (23, 8, 2, 2, 2);

insert into Camere
values (24, 8, 3, 3, 2);

insert into Camere
values (25, 9, 2, 1, 3);

insert into Camere
values (26, 9, 1, 2, 3);

insert into Camere
values (27, 9, 3, 3, 3);

insert into Cazari
values (1,1,to_date('20-02-2020','dd-mm-yyyy'),to_date('01-06-2020','dd-mm-yyyy'));

insert into Cazari
values (2,2,to_date('20-02-2020','dd-mm-yyyy'),to_date('01-06-2020','dd-mm-yyyy'));

insert into Cazari
values (9,3,to_date('01-02-2020','dd-mm-yyyy'),to_date('05-06-2020','dd-mm-yyyy'));

insert into Cazari
values (1,6,to_date('20-02-2020','dd-mm-yyyy'),to_date('01-06-2020','dd-mm-yyyy'));

insert into Cazari
values (6,4,to_date('01-10-2020','dd-mm-yyyy'),to_date('01-02-2021','dd-mm-yyyy'));

insert into Cazari
values (20,5,to_date('01-10-2020','dd-mm-yyyy'),to_date('01-02-2021','dd-mm-yyyy'));

insert into Cazari
values (1,7,to_date('20-02-2020','dd-mm-yyyy'),to_date('01-06-2020','dd-mm-yyyy'));

insert into Cazari
values (1,1,to_date('01-10-2020','dd-mm-yyyy'),to_date('01-02-2021','dd-mm-yyyy'));

insert into Cazari
values (2,8,to_date('20-02-2020','dd-mm-yyyy'),to_date('01-06-2020','dd-mm-yyyy'));

insert into Cazari
values (7,2,to_date('01-10-2020','dd-mm-yyyy'),to_date('01-02-2021','dd-mm-yyyy'));

insert into Cazari
values (9,3,to_date('01-11-2020','dd-mm-yyyy'),to_date('05-06-2021','dd-mm-yyyy'));

insert into Cazari
values (2,2,to_date('10-10-2020','dd-mm-yyyy'),to_date('01-06-2021','dd-mm-yyyy'));




--6. Defini?i un subprogram stocat care s? utilizeze un tip de colec?ie studiat. Apela?i subprogramul.
--6. Scrieti o functie care returneaza numarul de cazari ale unui student cu anumit id si care afiseaza detaliile acestor cazari(camera, data cazare, data decazare, nume camin).

/
CREATE OR REPLACE FUNCTION f_cazari
 (v_id Studenti.id_student%TYPE DEFAULT 1)
RETURN NUMBER IS
  nr_cazari NUMBER;
  i NUMBER;
  aux Studenti.id_student%TYPE;
  TYPE cazare_record IS RECORD
    (nr_camera Camere.nr_camera%TYPE,
    data_cazare Cazari.data_cazare%TYPE,
    data_decazare Cazari.data_decazare%TYPE,
    camin Camine.nume_camin%TYPE);
  TYPE tablou_indexat IS TABLE OF cazare_record INDEX BY PLS_INTEGER;
  t tablou_indexat;
 BEGIN
 
  select id_student into aux
  from Studenti
  where id_student = v_id;

  SELECT nr_camera, data_cazare, data_decazare, nume_camin BULK COLLECT INTO t
  FROM Studenti join Cazari using(id_student) join Camere using(id_camera) join Camine using(id_camin)
  WHERE id_student = v_id;
  
  if t.count != 0 then
      for i in t.FIRST..t.LAST loop
        DBMS_OUTPUT.PUT_LINE('Caminul: ' || t(i).camin || ' Camera: ' || t(i).nr_camera || ' Data cazare: ' || t(i).data_cazare || ' Data decazare: ' || t(i).data_decazare);
      end loop;
  end if;
  
  RETURN t.count;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20000,
  'Nu exista studenti cu id-ul dat');
END f_cazari;
/

DECLARE
id NUMBER;
nr_cazari Number;
BEGIN
 id := 2;
 nr_cazari := f_cazari(id);
 if nr_cazari>1 then
 DBMS_OUTPUT.PUT_LINE('Studentul ' || id || ' are '|| nr_cazari || ' cazari!');
 else if nr_cazari = 1 then DBMS_OUTPUT.PUT_LINE('Studentul ' || id || ' are 1 cazare!');
                        else DBMS_OUTPUT.PUT_LINE('Studentul ' || id || ' nu are cazari!');
      end if;
 end if;
END;
/

--7. Defini?i un subprogram stocat care s? utilizeze un tip de cursor studiat. Apela?i subprogramul.
--7. Scrieti o procedura care sa afiseze pentru fiecare complex studentesc, numarul de camine, valoarea medie a pretului unei camere si caminele din aceste complexe.

/
CREATE OR REPLACE PROCEDURE p_complexe
IS
  nr number;
  pret number;
  CURSOR c1 IS
  SELECT id_complex, nume_complex
  FROM Complexe;
  
  CURSOR c2 IS
  SELECT co.id_complex id_complex, nume_camin, pret_camera 
  FROM Complexe co, Camine ca
  WHERE co.id_complex=ca.id_complex;
BEGIN

  for i in c1 loop
        nr := 0;
        pret :=0;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Complexul ' || i.nume_complex);
        for j in c2 loop
            if i.id_complex = j.id_complex then
                nr := nr+1;
                pret := pret + j.pret_camera;
                DBMS_OUTPUT.PUT_LINE(nr || '. Caminul ' || j.nume_camin || ' are pretul pe camera ' || j.pret_camera);
            end if;
        end loop;
        if nr = 0 then DBMS_OUTPUT.PUT_LINE('Nu sunt camine');
        else DBMS_OUTPUT.PUT_LINE('Complexul ' || i.nume_complex || ' are ' || nr || ' camine si media pretului unei camere: ' || (pret/nr));
        end if;
        DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
END p_complexe;

/
begin
    p_complexe;
end;
/

-- 8. Defini?i un subprogram stocat de tip func?ie care s? utilizeze 3 dintre tabelele definite. Trata?i toate excep?iile care pot ap?rea. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.
-- 8. Scrieti o functie care, pentru un camin cu id-ul dat, sa afiseze locul caminului in topul caminelor complexului din care face parte in functie de pretul acestora si sa returneze numarul de camere al acelui camin.

  
CREATE TYPE tip_pereche_loc_nr IS OBJECT
(loc NUMBER,
nr_cazari NUMBER);
/

CREATE OR REPLACE FUNCTION f_camine
 (v_id Camine.id_camin%TYPE DEFAULT 1)
RETURN tip_pereche_loc_nr IS
  pereche tip_pereche_loc_nr;
  nr_cazari NUMBER := 0;
  loc NUMBER := 0;
  TYPE camin_record IS RECORD
    (nume_camin Camine.nume_camin%TYPE,
    nume_complex Complexe.nume_complex%TYPE);
  camin camin_record;
 BEGIN
 
  select row_number into loc
  from (select ROW_NUMBER() Over (Order By pret_camera desc) AS row_number, id_camin
        from Camine)
  where v_id = id_camin;

  select nume_camin, nume_complex into camin
  from Camine join Complexe using(id_complex)
  where id_camin = v_id;

  DBMS_OUTPUT.PUT_LINE('Caminul ' || camin.nume_camin || ' din complexul ' || camin.nume_complex);

  select count (*) into nr_cazari
  from Cazari join Camere using(id_camera) join Camine using(id_camin)
  where id_camin = v_id and data_cazare <= SYSDATE and data_decazare >= SYSDATE;

  pereche := tip_pereche_loc_nr(loc,nr_cazari);
  return pereche;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20000,
  'Nu exista camine cu id-ul dat');
END f_camine;
/


declare
  id number;
  rez tip_pereche_loc_nr;
begin
  id := 1;
  rez := f_camine(id);
  if rez.nr_cazari>1 then
  DBMS_OUTPUT.PUT_LINE('Se afla pe locul ' || rez.loc || ' si in prezent are ' || rez.nr_cazari || ' cazari');
  else if rez.nr_cazari = 1 then DBMS_OUTPUT.PUT_LINE('Se afla pe locul ' || rez.loc || ' si in prezent are 1 cazare');
       else DBMS_OUTPUT.PUT_LINE('Se afla pe locul ' || rez.loc || ' si in prezent nu are cazari');
       end if;
  end if;
end;

/

--9. Defini?i un subprogram stocat de tip procedur? care s? utilizeze 5 dintre tabelele definite.
--Trata?i toate excep?iile care pot ap?rea. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.
--9. Pentru fiecare student sa se calculeze cat trebuie sa plateasca in luna acesta. Sa se afiseze suma corespunzatoare, numele acestuia, caminul, camera si domeniul la care se afla.

SELECT nume_camin, pret_camera, nume_domeniu, id_student, nr_camera, data_cazare, data_decazare 
FROM Cazari join Studenti using(id_student) join Domenii using(id_domeniu) join Camere using(id_camera) join Camine using(id_camin)
WHERE data_cazare <= SYSDATE and data_decazare >= SYSDATE;

CREATE OR REPLACE PROCEDURE p_studenti
IS
  nr number;
  pret number;

  CURSOR c1 IS
  SELECT id_student, nume, prenume, taxa, parinte_cadru_didactic
  FROM Studenti;
  -- obtinerea studentilor
  
  CURSOR c2 IS
  SELECT nume_camin, pret_camera, nume_domeniu, id_student, nr_camera 
  FROM Cazari join Studenti using(id_student) join Domenii using(id_domeniu) join Camere using(id_camera) join Camine using(id_camin)
  WHERE data_cazare <= SYSDATE and data_decazare >= SYSDATE;
  -- obtinerea cazarilor, a domeniului si a caminului
BEGIN
  for i in c1 loop
        nr := 0;
        pret :=0;
        DBMS_OUTPUT.PUT_LINE('');
        for j in c2 loop
            if i.id_student = j.id_student then
                nr := nr+1;
                pret := j.pret_camera;
                if i.parinte_cadru_didactic = 1 then pret := 0;
                else if i.taxa = 1 then pret := pret * 2;
                     end if;
                end if;
                DBMS_OUTPUT.PUT_LINE('Studentul ' || i.nume || ' ' || i.prenume || ' de la domeniul ' || j.nume_domeniu ||' cazat in ' || j.nume_camin || ' in camera ' || j.nr_camera ||' are de platit ' || pret || ' de lei.');
            end if;
        end loop;
        if nr = 0 then DBMS_OUTPUT.PUT_LINE('Studentul ' || i.nume || ' ' || i.prenume || ' nu este cazat in prezent');
        end if;
        DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
END p_studenti;
/

begin
    p_studenti;
end;
/

--10. Defini?i un trigger de tip LMD la nivel de comand?. Declan?a?i trigger-ul.
--10. Defini?i un trigger care s? permit? lucrul asupra tabelului Cazari (INSERT, UPDATE, DELETE) decât în intervalul de ore 8:00 - 18:00, de luni pân? vineri.

CREATE OR REPLACE TRIGGER trig_comanda
BEFORE INSERT OR DELETE OR UPDATE on Cazari 
BEGIN
IF (TO_CHAR(SYSDATE,'D') in (1,2)) OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 18)
THEN
IF INSERTING THEN RAISE_APPLICATION_ERROR(-20001,'Inserarea in tabel este permisa doar in timpul programului de lucru!');
ELSIF DELETING THEN RAISE_APPLICATION_ERROR(-20002,'Stergerea din tabel este permisa doar in timpul programului de lucru!');
ELSE RAISE_APPLICATION_ERROR(-20003,'Actualizarile in tabel sunt permise doar in timpul programului de lucru!');
END IF;
END IF;
END;
/

insert into Cazari
values (1,1,to_date('10-10-2022','dd-mm-yyyy'),to_date('01-06-2023','dd-mm-yyyy'));


--11. Defini?i un trigger de tip LMD la nivel de linie. Declan?a?i trigger-ul.
--11. Definiti un trigger care sa nu permita inserarea cazarilor in care studentul nu face parte din facutatea pentru care a fost asignata camera.

CREATE OR REPLACE TRIGGER trig_linie
BEFORE INSERT OR UPDATE OF id_camera, id_student ON Cazari
FOR EACH ROW
declare
  v_fac_camera NUMBER;
  v_fac_student NUMBER;
BEGIN
  select id_facultate into v_fac_camera
  from Camere 
  where id_camera = :NEW.id_camera;

  select id_facultate into v_fac_student
  from Studenti join Domenii using(id_domeniu) join Facultati using(id_facultate)
  where id_student = :NEW.id_student;

  IF v_fac_camera <> v_fac_student THEN RAISE_APPLICATION_ERROR (-20000, 'Facultatea camerei nu coincide cu facultatea studentului!');
  END IF;
END;
/

insert into Cazari
values (27,1,to_date('10-10-2021','dd-mm-yyyy'),to_date('01-06-2022','dd-mm-yyyy'));


--12. Defini?i un trigger de tip LDD. Declan?a?i trigger-ul.
--12. Defini?i un trigger care s? introduc? în tabelul audit_ex evenimentul sistem, numele obiectului si data producerii evenimentului.

CREATE TABLE audit_ex
 (eveniment VARCHAR2(20),
 nume_obiect VARCHAR2(30),
 data DATE);

CREATE OR REPLACE TRIGGER trig_LDD
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO audit_ex
 VALUES (SYS.SYSEVENT,
 SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/
CREATE table tab_ex(prop1 VARCHAR2(20),
                    prop2 VARCHAR2(30));

DROP table tab_ex;
SELECT * FROM audit_ex;


--13. Defini?i un pachet care s? con?in? toate obiectele definite în cadrul proiectului.




CREATE OR REPLACE PACKAGE pack_rne IS
  FUNCTION f_cazari (v_id Studenti.id_student%TYPE)
  RETURN NUMBER;
  PROCEDURE p_complexe;
  FUNCTION f_camine(v_id Camine.id_camin%TYPE)
  RETURN tip_pereche_loc_nr;
  PROCEDURE p_studenti;
END;
/

CREATE OR REPLACE PACKAGE BODY pack_rne IS
 FUNCTION f_cazari
 (v_id Studenti.id_student%TYPE)
RETURN NUMBER IS
  nr_cazari NUMBER;
  i NUMBER;
  aux Studenti.id_student%TYPE;
  TYPE cazare_record IS RECORD
    (nr_camera Camere.nr_camera%TYPE,
    data_cazare Cazari.data_cazare%TYPE,
    data_decazare Cazari.data_decazare%TYPE,
    camin Camine.nume_camin%TYPE);
  TYPE tablou_indexat IS TABLE OF cazare_record INDEX BY PLS_INTEGER;
  t tablou_indexat;
 BEGIN
  select id_student into aux
  from Studenti
  where id_student = v_id;

  SELECT nr_camera, data_cazare, data_decazare, nume_camin BULK COLLECT INTO t
  FROM Studenti join Cazari using(id_student) join Camere using(id_camera) join Camine using(id_camin)
  WHERE id_student = v_id;
  
  if t.count != 0 then
      for i in t.FIRST..t.LAST loop
        DBMS_OUTPUT.PUT_LINE('Caminul: ' || t(i).camin || ' Camera: ' || t(i).nr_camera || ' Data cazare: ' || t(i).data_cazare || ' Data decazare: ' || t(i).data_decazare);
      end loop;
  end if;
  
  RETURN t.count;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20000,
  'Nu exista studenti cu id-ul dat');
END;


PROCEDURE p_complexe
IS
  nr number;
  pret number;
  CURSOR c1 IS
  SELECT id_complex, nume_complex
  FROM Complexe;
  
  CURSOR c2 IS
  SELECT co.id_complex id_complex, nume_camin, pret_camera 
  FROM Complexe co, Camine ca
  WHERE co.id_complex=ca.id_complex;
BEGIN

  for i in c1 loop
        nr := 0;
        pret :=0;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Complexul ' || i.nume_complex);
        for j in c2 loop
            if i.id_complex = j.id_complex then
                nr := nr+1;
                pret := pret + j.pret_camera;
                DBMS_OUTPUT.PUT_LINE(nr || '. Caminul ' || j.nume_camin || ' are pretul pe camera ' || j.pret_camera);
            end if;
        end loop;
        if nr = 0 then DBMS_OUTPUT.PUT_LINE('Nu sunt camine');
        else DBMS_OUTPUT.PUT_LINE('Complexul ' || i.nume_complex || ' are ' || nr || ' camine si media pretului unei camere: ' || (pret/nr));
        end if;
        DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
END;

FUNCTION f_camine
 (v_id Camine.id_camin%TYPE)
RETURN tip_pereche_loc_nr IS
  pereche tip_pereche_loc_nr;
  nr_cazari NUMBER := 0;
  loc NUMBER := 0;
  TYPE camin_record IS RECORD
    (nume_camin Camine.nume_camin%TYPE,
    nume_complex Complexe.nume_complex%TYPE);
  camin camin_record;
 BEGIN
 
  select row_number into loc
  from (select ROW_NUMBER() Over (Order By pret_camera desc) AS row_number, id_camin
        from Camine)
  where v_id = id_camin;

  select nume_camin, nume_complex into camin
  from Camine join Complexe using(id_complex)
  where id_camin = v_id;

  DBMS_OUTPUT.PUT_LINE('Caminul ' || camin.nume_camin || ' din complexul ' || camin.nume_complex);

  select count (*) into nr_cazari
  from Cazari join Camere using(id_camera) join Camine using(id_camin)
  where id_camin = v_id and data_cazare <= SYSDATE and data_decazare >= SYSDATE;

  pereche := tip_pereche_loc_nr(loc,nr_cazari);
  return pereche;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20000,
  'Nu exista camine cu id-ul dat');
END;


 PROCEDURE p_studenti
IS
  nr number;
  pret number;

  CURSOR c1 IS
  SELECT id_student, nume, prenume, taxa, parinte_cadru_didactic
  FROM Studenti;
  -- obtinerea studentilor
  
  CURSOR c2 IS
  SELECT nume_camin, pret_camera, nume_domeniu, id_student, nr_camera 
  FROM Cazari join Studenti using(id_student) join Domenii using(id_domeniu) join Camere using(id_camera) join Camine using(id_camin)
  WHERE data_cazare <= SYSDATE and data_decazare >= SYSDATE;
  -- obtinerea cazarilor, a domeniului si a caminului
BEGIN
  for i in c1 loop
        nr := 0;
        pret :=0;
        DBMS_OUTPUT.PUT_LINE('');
        for j in c2 loop
            if i.id_student = j.id_student then
                nr := nr+1;
                pret := pret + j.pret_camera;
                if i.parinte_cadru_didactic = 1 then pret := 0;
                else if i.taxa = 1 then pret := pret * 2;
                     end if;
                end if;
                DBMS_OUTPUT.PUT_LINE('Studentul ' || i.nume || ' ' || i.prenume || ' de la domeniul ' || j.nume_domeniu ||' cazat in ' || j.nume_camin || ' in camera ' || j.nr_camera ||' are de platit ' || pret || ' de lei.');
            end if;
        end loop;
        if nr = 0 then DBMS_OUTPUT.PUT_LINE('Studentul ' || i.nume || ' ' || i.prenume || ' nu este cazat in prezent');
        end if;
        DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
END;

END;
/ 

begin
    pack_rne.p_studenti;
end;
/

drop package pack_rne;

--14. Defini?i un pachet care s? includ? tipuri de date complexe ?i obiecte necesare pentru ac?iuni integrate.
--14. Definiti un pachet care sa includa o procedura care determina studentul care a platit cel mai mult pentru camine.

drop package pack_rne2;

CREATE OR REPLACE PACKAGE pack_rne2 IS
  type student_pret is record(id_student Studenti.id_student%type, pret Camine.pret_camera%type); 
  type vector is table of student_pret;
  TYPE matrice IS table of vector;
  s student_pret;
  v vector := vector();
  m matrice := matrice();
  PROCEDURE preturi;
  PROCEDURE max_pay;
END pack_rne2;
/
-----------------------------

CREATE OR REPLACE PACKAGE BODY pack_rne2 IS
 
PROCEDURE preturi IS
  k NUMBER;
  l NUMBER;
  i NUMBER;
  j NUMBER;
  pret NUMBER;
  CURSOR c1 IS
  SELECT id_student, taxa, parinte_cadru_didactic
  FROM Studenti;

  CURSOR c2 IS
  SELECT pret_camera, id_student, round((data_decazare-data_cazare)/30) luni
  FROM Cazari join Studenti using(id_student) join Domenii using(id_domeniu) join Camere using(id_camera) join Camine using(id_camin);
BEGIN
  l := 0;
  for i in c1 loop
    l := l+1;
    v.delete;
    m.extend;
    k := 0;
    for j in c2 loop
      if i.id_student = j.id_student then
        k := k+1;
        pret := j.pret_camera * j.luni;
        if i.parinte_cadru_didactic = 1 then pret := 0;
        else if i.taxa = 1 then pret := pret * 2;
             end if;
        end if;
        s.id_student := j.id_student;
        s.pret := pret;
        v.extend;
        v(k) := s;
      end if;
    end loop;
    m(l) := v;
  end loop; 
  FOR i IN m.first..m.last LOOP
      if m(i).count>0 then
        FOR j IN m(i).first..m(i).last LOOP
            dbms_output.put(' id_student: ' || m(i)(j).id_student || ', pret: ' || m(i)(j).pret);
        end loop;
      end if;
    dbms_output.put_line('');
  end loop;
END preturi;

procedure max_pay is
id_s number;
aux_student number;
pret_max number;
nume_student Studenti.nume%type;
prenume_student Studenti.prenume%type;
suma number;
begin
preturi;
pret_max := -1;
FOR i IN m.first..m.last LOOP
      suma := 0;
      if m(i).count>0 then
        FOR j IN m(i).first..m(i).last LOOP
            suma := suma + m(i)(j).pret;
            aux_student := m(i)(j).id_student;
        end loop;
      end if;
      if suma > pret_max 
        then 
            pret_max := suma;
            id_s := aux_student;
      end if;
end loop;

select nume, prenume into nume_student, prenume_student
from Studenti
where id_s = id_student;

dbms_output.put_line('suma maxima: ' || pret_max || ', studentul: ' || nume_student || ' ' || prenume_student || ' id: ' || id_s);
end max_pay;

END pack_rne2;
/

begin
    pack_rne2.max_pay;
end;
/