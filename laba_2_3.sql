CREATE TABLE author_of_book (
    authors_author_id   INTEGER NOT NULL,
    books_isbn          VARCHAR2(64 CHAR) NOT NULL,
    books_parts         INTEGER NOT NULL,
    books_issue_year    INTEGER NOT NULL
);

ALTER TABLE author_of_book
    ADD CONSTRAINT relation_13_pk PRIMARY KEY ( authors_author_id,
                                                books_isbn,
                                                books_parts,
                                                books_issue_year );

CREATE TABLE authors (
    surname       VARCHAR2(64 CHAR) NOT NULL,
    name          VARCHAR2(64 CHAR) NOT NULL,
    second_name   VARCHAR2(64 CHAR),
    author_id     INTEGER NOT NULL
);

ALTER TABLE authors ADD CONSTRAINT authors_pk PRIMARY KEY ( author_id );

ALTER TABLE authors ADD CONSTRAINT authors_name_surname_un UNIQUE ( name,
                                                                    surname );

CREATE TABLE book_on_shelf (
    shelves_shelf_id   INTEGER NOT NULL,
    shelves_box_id     INTEGER NOT NULL,
    books_isbn         VARCHAR2(64 CHAR) NOT NULL,
    books_parts        INTEGER NOT NULL,
    books_issue_year   INTEGER NOT NULL
);

ALTER TABLE book_on_shelf
    ADD CONSTRAINT r7v1_pk PRIMARY KEY ( shelves_shelf_id,
                                         shelves_box_id,
                                         books_isbn,
                                         books_parts,
                                         books_issue_year );

CREATE TABLE books (
    quantity     INTEGER NOT NULL,
    isbn         VARCHAR2(64 CHAR) NOT NULL,
    parts        INTEGER NOT NULL,
    issue_year   INTEGER NOT NULL,
    title        VARCHAR2(64 CHAR) NOT NULL
);

ALTER TABLE books
    ADD CONSTRAINT books_pk PRIMARY KEY ( isbn,
                                          parts,
                                          issue_year );

CREATE TABLE boxes (
    box_id             INTEGER NOT NULL,
    halls_short_name   VARCHAR2(12 CHAR) NOT NULL
);

ALTER TABLE boxes ADD CONSTRAINT boxes_pk PRIMARY KEY ( box_id );

CREATE TABLE halls (
    short_name   VARCHAR2(12 CHAR) NOT NULL,
    full_name    VARCHAR2(64 CHAR) NOT NULL
);

ALTER TABLE halls ADD CONSTRAINT halls_pk PRIMARY KEY ( short_name );

ALTER TABLE halls ADD CONSTRAINT halls_full_name_un UNIQUE ( full_name );

CREATE TABLE shelves (
    shelf_id       INTEGER NOT NULL,
    boxes_box_id   INTEGER NOT NULL
);

ALTER TABLE shelves ADD CONSTRAINT shelves_pk PRIMARY KEY ( shelf_id,
                                                            boxes_box_id );

ALTER TABLE boxes
    ADD CONSTRAINT boxes_halls_fk FOREIGN KEY ( halls_short_name )
        REFERENCES halls ( short_name );

ALTER TABLE book_on_shelf
    ADD CONSTRAINT r7v1_books_fk FOREIGN KEY ( books_isbn,
                                               books_parts,
                                               books_issue_year )
        REFERENCES books ( isbn,
                           parts,
                           issue_year )
            ON DELETE CASCADE;

ALTER TABLE book_on_shelf
    ADD CONSTRAINT r7v1_shelves_fk FOREIGN KEY ( shelves_shelf_id,
                                                 shelves_box_id )
        REFERENCES shelves ( shelf_id,
                             boxes_box_id )
            ON DELETE CASCADE;

ALTER TABLE author_of_book
    ADD CONSTRAINT relation_13_authors_fk FOREIGN KEY ( authors_author_id )
        REFERENCES authors ( author_id )
            ON DELETE CASCADE;

ALTER TABLE author_of_book
    ADD CONSTRAINT relation_13_books_fk FOREIGN KEY ( books_isbn,
                                                      books_parts,
                                                      books_issue_year )
        REFERENCES books ( isbn,
                           parts,
                           issue_year )
            ON DELETE CASCADE;

ALTER TABLE shelves
    ADD CONSTRAINT shelves_boxes_fk FOREIGN KEY ( boxes_box_id )
        REFERENCES boxes ( box_id );



DROP TABLE book_on_shelf;
DROP TABLE author_of_book;
DROP TABLE authors;
DROP TABLE books;
DROP TABLE shelves;
DROP TABLE boxes;
DROP TABLE halls;


INSERT ALL
INTO halls VALUES ('Зал 1','Читальный зал для детей')
INTO halls VALUES ('Зал 2','Зал с научной литературой')
INTO halls VALUES ('Зал 3','Зал с художественной литературой')
INTO halls VALUES ('Зал 4','Зал с комиксами')
INTO halls VALUES ('Зал 5','Зал с компьютерами')
select*from dual;
Select* from halls;

INSERT ALL
INTO boxes values ('1','Зал 1')
INTO boxes values ('2','Зал 1')
INTO boxes values ('3','Зал 2')
INTO boxes values ('4','Зал 2')
INTO boxes values ('5','Зал 3')
INTO boxes values ('6','Зал 4')
INTO boxes values ('7','Зал 5')
select*from dual;
Select* from boxes;
delete*from boxes;

INSERT ALL
INTO shelves values('1','1')
INTO shelves values ('2','1')
INTO shelves values('3','1')
INTO shelves values ('1','2')
INTO shelves values ('2','2')
INTO shelves values('1','3')
INTO shelves values ('2','3')
INTO shelves values('3','3')
INTO shelves values ('1','4')
INTO shelves values ('1','5')
INTO shelves values ('1','6')
INTO shelves values ('1','7')
select *from dual;
Select* from shelves;
delete*from shelves;

INSERT ALL
INTO books values (3,'2-266-11156',1,1000,'Курочка Ряба')
INTO books values (1,'5-020-13850',2,2015,'Человек-паук')
INTO books values (4,'4-358-02156',1,1969,'А зори здесь тихие')
INTO books values (5,'2-266-11146',1,1960,'Книжный вор')
INTO books values (2,'2-350-76458',1,1856,'Анна Каренина')
INTO books values (1,'2-358-02156',4,1835,'Война и мир')
INTO books values (5,'4-266-11146',5,2019,'Приключение котика')
INTO books values (2,'5-350-76458',3,2017,'Когда лучше спать?')
INTO books values (2,'2-350-76458',1,1857,'Анна Каренина')
INTO books values (2,'2-350-76458',2,1856,'Анна Каренина')
INTO books values (5,'4-266-22246',4,2018,'Приключение петушка')
INTO books values (5,'4-266-33346',3,2017,'Приключение собачки')
INTO books values (5,'4-266-44446',2,2016,'Приключение льва')
INTO books values (7,'5-020-13850',3,2015,'Человек-паук')
INTO books values (8,'5-333-13850',2,2016,'Человек-паук')
INTO books values (1,'5-111-13850',1,2015,'Человек-паук')
select*from dual;
delete from books;
Select* from books;

INSERT ALL
Into book_on_shelf values (1,1,'2-266-11156',1,1000)
Into book_on_shelf values(2,1,'5-020-13850',2,2015)
Into book_on_shelf values (2,1,'4-358-02156',1,1969)
Into book_on_shelf values(1,3,'2-266-11146',1,1960)
Into book_on_shelf values (2,3,'2-350-76458',1,1856)
Into book_on_shelf values (2,3,'2-358-02156',4,1835)
Into book_on_shelf values(1,5,'4-266-11146',5,2019)
Into book_on_shelf values(1,6,'5-350-76458',3,2017)
Into book_on_shelf values(1,5,'4-266-22246',4,2018)
Into book_on_shelf values(1,5,'4-266-33346',3,2017)
Into book_on_shelf values(1,5,'4-266-44446',2,2016)
select*from dual;

delete*from book_on_shelf ;
Select* from book_on_shelf ;

Insert all
into authors values('Иванов','Иван','Иванович','1')
into authors values('Толстой','Лев','Николаевич','2')
into authors values('Паланик','Чак',Null,'3')
into authors values('Васильев','Борис','Львович','4')
into authors values('Шекспир','Уильям',Null,'5')
select*from dual;
Select* from authors ;
delete from authors;

Insert all
into author_of_book values(1,'2-266-11156',1,1000)
into author_of_book values(5,'2-266-11156',1,1000)
into author_of_book values(1,'5-020-13850',2,2015)
into author_of_book values(4,'4-358-02156',1,1969)
into author_of_book values(3,'2-266-11146',1,1960)
into author_of_book values(2,'2-350-76458',1,1856)
into author_of_book values(2,'2-358-02156',4,1835)
into author_of_book values(1,'4-266-11146',5,2019)
into author_of_book values(3,'5-350-76458',3,2017)
into author_of_book values(1,'5-020-13850',3,2015)
into author_of_book values(1,'5-333-13850',2,2016)
into author_of_book values(1,'5-111-13850',1,2015)
select*from dual;
Select* from author_of_book ;
delete from author_of_book;


--№0
with t1 as(select authors_author_id,books_isbn,title,issue_year,parts,
surname,name,second_name,author_id
from books join author_of_book on books.isbn=author_of_book.books_isbn
join authors on author_of_book.authors_author_id=authors.author_id),
t2 as(select distinct authors_author_id from t1 
group by authors_author_id  )
select title,books_isbn,name,parts,issue_year
from t1 join t2 on t1.authors_author_id=t2.authors_author_id
where name='Иван' and surname='Иванов' and second_name='Иванович';



SELECT title FROM books b join author_of_book aob on b.isbn=aob.books_isbn
join authors a on aob.authors_author_id=a.author_id WHERE 
name='Иван' and surname='Иванов' and second_name='Иванович' and ;



SELECT title, (SELECT DISTINCT authors_author_id FROM author_of_book WHERE ) FROM books  ;



--№0
 with t1 as(select books_isbn,title,issue_year,parts,surname,name,second_name,author_id
from books join author_of_book on books.isbn=author_of_book.books_isbn
join authors on author_of_book.authors_author_id=authors.author_id),
t2 as(select books_isbn,issue_year,parts from t1 group by books_isbn,issue_year,parts having count(*)<2)
select title from t1 left join t2 on t1.books_isbn=t2.books_isbn 
where name='Иван' and surname='Иванов' and second_name='Иванович';
 
 select books_isbn,authors_author_id from author_of_book group by books_isbn,authors_author_id having count(*)<2
 
 --№0
 WITH t1 AS (SELECT books_isbn,title,issue_year,parts,surname,name,second_name,author_id
FROM books join author_of_book on books.isbn=author_of_book.books_isbn
join authors on author_of_book.authors_author_id=authors.author_id),
t2 AS (SELECT books_isbn,issue_year,parts FROM t1 GROUP BY books_isbn,issue_year,parts HAVING COUNT(*)<2)
SELECT title FROM t2 LEFT JOIN t1 ON t1.books_isbn=t2.books_isbn
where name='Иван' and surname='Иванов' and second_name='Иванович';
 
 
 
 
--№1
SELECT title "Название" FROM (SELECT shelves_box_id FROM(SELECT shelves_box_id , 
count(*) FROM book_on_shelf 
GROUP BY shelves_box_id ORDER BY count(*) DESC) WHERE ROWNUM<2) t3 JOIN book_on_shelf  
ON book_on_shelf.shelves_box_id=t3.shelves_box_id JOIN books
ON book_on_shelf.books_isbn=books.isbn; 
--правильный вариант 



with t2 as (select shelves_boxes_box_id,count(*) as vsego
from book_on_shelf group by shelves_box_id),
t3 as (select shelves_box_id from t2 where vsego=(select max(vsego) from t2 ) and
shelves_box_id=(select min(shelves_box_id) from t2))
select title from book_on_shelf join t3 on book_on_shelf.shelves_box_id=t3.shelves_box_id join bookы
on book_on_shelf.book_isbn=bookы.isbn




--№2
 WITH t1 AS (SELECT books_isbn,title,issue_year,surname,name,second_name,author_id
FROM books JOIN author_of_book ON books.isbn=author_of_book.books_isbn
join authors on author_of_book.authors_author_id=authors.author_id),
t2 AS (SELECT books_isbn FROM t1 GROUP BY books_isbn HAVING COUNT(*)<2 )
SELECT title,name,surname,second_name,issue_year FROM t2 LEFT JOIN t1 ON t1.books_isbn=t2.books_isbn
WHERE (issue_year > (SELECT EXTRACT(YEAR FROM SYSDATE)-100 FROM DUAL) and
issue_year < (SELECT EXTRACT (YEAR FROM SYSDATE)-10 FROM DUAL))



--№3
DELETE FROM books WHERE issue_year IN
(SELECT issue_year FROM books b JOIN 
(SELECT ISBN FROM books GROUP BY ISBN HAVING COUNT(*)>1 ) a ON a.ISBN=b.ISBN 
ORDER BY issue_year DESC OFFSET 1 ROW);


--№4
UPDATE book_on_shelf SET shelves_box_id=2 WHERE shelves_box_id=1;

--№5 
ALTER TABLE books ADD price number(8,2);


drop view book_count;

create view books_count as select title,quantity,isbn from books;
create or replace trigger update_quantity
instead of update on books_count
for each row
begin
update books set quantity = :new.quantity
where isbn = :new.isbn;
end;

select* from books_count
update books_count set quantity =5 where isbn = '2-266-11156';


create or replace function prod_author (auth_id in integer)
return number
is
cnt number(4,2):=0;
k number:=0;
tek_isbn char(40 char);
cursor my_cur is select*from author_of_book;
my_row my_cur%rowtype;
begin
open my_cur;
fetch my_cur into my_row;
while my_cur%found loop
if (my_row.authors_author_id =auth_id)
then
tek_isbn:=my_row.books_isbn;
select count(*) into k from author_of_book where books_isbn=tek_isbn;
cnt:=1/k+cnt;
k:=0;
end if;
fetch my_cur into my_row;
end loop;
return cnt ;
end;
--
create or replace function prod_author (auth_id in integer)
return number
is
cnt number:=0;
cursor my_cur is select*from author_of_book;
my_row my_cur%rowtype;
begin
open my_cur;
fetch my_cur into my_row;
while my_cur%found loop
if (my_row.authors_author_id =auth_id)
then
cnt:=cnt+1;
end if;
fetch my_cur into my_row;
end loop;
return cnt ;
end;

select prod_author(1) from dual;


--№2
create or replace type body SumInst IS
static function ODCIAggregateInitialize(sctx IN OUT SumInst)
return NUMBER IS
begin
sctx:=SumInst(0);
return ODCIConst.Success;
end;

member function ODCIAggregateIterate(self IN OUT SumInst,
value IN NUMBER)
return NUMBER IS
begin
self.cnt:=self.cnt+value;
return ODCIConst.Success;
end;

member function ODCIAggregateTerminate(self IN SumInst,
returnValue OUT NUMBER, flags IN NUMBER)
return NUMBER IS
begin
returnValue:=self.cnt;
return ODCIConst.Success;
end;

member function ODCIAggregateMerge(self IN OUT SumInst,
ctx2 IN SumInst)
return NUMBER IS
begin
self.cnt:=self.cnt+ctx2.cnt;
return ODCIConst.Success;
end;
end;
/
CREATE OR REPLACE FUNCTION SymCnt (input NUMBER) RETURN NUMBER
PARALLEL_ENABLE AGGREGATE USING SumInst;
/
SELECT SymCnt(quantity) FROM books;
------------------------------------------------------------------------------

