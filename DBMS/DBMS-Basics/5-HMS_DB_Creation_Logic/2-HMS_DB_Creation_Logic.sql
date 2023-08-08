 create table grocery_item( item_name varchar2(15),qty number(5,3), price number(8,2),  DOP date,  TOP timestamp, shop_name varchar2(10) not null);
 create table school(sid number constraint sc_p primary key, sc_name varchar2(30) not null, address varchar2(10) not null);
 create table school_fee_payment(pay_id varchar2(10) constraint sc_pay_p primary key,
    pay_date date not null,
    pay_mode varchar2(10) ,
    pay_amt number(6) ,
    who_paid varchar2(10) ,
    class number(2),
    constraint sc_fee_check_1 check( pay_mode in ('cash','db_card','cr_card')),
    constraint sc_fee_check_2 check( pay_amt <60000),
    constraint sc_fee_check_3 check (class <=10),
    constraint sc_fee_check_4 check (who_paid in('sukumar','veena')));
 


    create table fee_pay_Cleared_in(pay_id varchar2(10),
    sid number(2),
    constraint fee_pay_Rel_p primary key(pay_id),
    foreign key(pay_id)references school_fee_payment(pay_id),
    foreign key(sid)references school(sid));


    create table person(pid number constraint per_che check (pid<6),
    pname varchar2(15) constraint per_che_2 check (pname in ('sukumar','veena','sulakshmi','sumanvitha','suhanvitha')),
    tob timestamp,
    dob date not null,
    lob varchar2(10) not null,
    gender number(1) constraint per_che_3 check(gender=1 or gender=0),
    age number(3),
    pan_no varchar2(10) ,
    aadhar_no number(13) not null,
   contact_no   varchar2(12) constraint per_che_4 check(length(contact_no)=10));
  
    create table account (ac_no number(12) constraint acc_p primary key,
       acc_type varchar2(10) constraint acc_che check (acc_type in ('sav','cur','fd','ssa','rd','lic')),
       c_card number(1),
       d_card number(1),
      min_bal number(5) default 3000);




alter table account add  photo blob;
alter table person add constraint per_p primary key(pid);






   create table per_acc(pid number,
   ac_no number,
   since date,
   primary key(pid,ac_no),
    foreign key(pid) references person(pid),
   foreign key(ac_no)references account(ac_no));



create table gold_arnaments(item_no number(2) constraint go_p primary key,
    item_name varchar2(10),
    quantity number(5,2),
    price number not null,
    dom date not null,
    is_kdm number(1),
    shop_name varchar2(10) not null,
    photo blob);





    create table financial_institution(ISBN varchar2(10) constraint fin_p primary key,
    name varchar2(10)not null,
    address varchar2(10) not null,
   inst_type varchar2(10) constraint fin_che check(inst_type in ('bank','po','lic')))




    create table exist_in (ac_id number constraint ex_rel primary key,
    isbn varchar2(10),
   foreign key(ac_id)references account(ac_no),
   foreign key(isbn)references financial_institution(isbn))







   create table ssa(ac_no number(10),
    ssa_id number(10) primary key,
    guardian varchar2(10) check (guardian in ('sukumar','veena')),
    closing_date date,
    total_amt number(8,3) not null,
   foreign key(ac_no)references account(ac_no))






   create table fd(ac_no number(10),
    princ_amt number(8,2),
    mi varchar(1),
    mature_amt number(10) ,
    closing_date date,
    int_rate number(5,2),
    nominee varchar2(10) constraint fd_rel_2 check(nominee in ('sukumar','veena','sumanvitha','suhanvitha','samba')),
    fd_no number(10) primary key,
   foreign key(ac_no)references account(ac_no))




