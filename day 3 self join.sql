create table staff (staff_id number(10), 
                             staff_name varchar2(30),
                              staff_email_id varchar2(30),
                              staff_designation varchar2(30),
                               manager_id number(10), 
                               Grade varchar2(4),
                                practice varchar2(20),
                                location varchar2(30));


insert into staff values(35817,'Balwant Sharma','Balwant.Sharma@zensar.in','Sr Software Engineer',89218,'F1', 'SAP','Hyderabad STPI ');
insert into staff values(33552,'Nishant Prasad','Nishant.Prasad@zensar.in','Sr Software Engineer',19289,'F1', 'SAP','Hyderabad STPI ');
insert into staff values(14556,'Pushpal kapadia','p.kapadia@zensar.com','Vice President',20062,'B2', 'AMS','Kharadi STPI Unit-IV'); 
insert into staff values(20605,'Purnima Sanketi','p.menon@zensar.com','Associate Vice President',14556,'C1', 'Consulting','Kharadi STPI Unit-IV');
insert into staff values(22728,'Sanjyot','s.khare@zensar.com','Associate Vice President',14556,'C1', 'AMS','Kharadi STPI Unit-IV');                                
insert into staff values(41797,'Jay kishore Narayan V','jay.vegesna@zensar.in','Associate Manager',22728,'E1', 'TRAINING','Kharadi STPI Unit-IV');
insert into staff values(22766,'Ashuthosh Bhat','a.bhat@zensar.in','Manager',22728,'D2','AMS','Kharadi STPI Unit-IV');
insert into staff values(46244,'Guruprasad Bhavsar','guruprasad.bhavsar@zensar.in','Jr Software Engineer',22766,'G0', 'Corporate','Kharadi STPI Unit-IV');
insert into staff values(46245,'Apeksha Wadhwa','apeksha.wadhwa@zensar.in','Jr Software Engineer',22766,'G0', 'Corporate','Kharadi STPI Unit-IV');

insert into staff values(77777,'Jai Gupta','codeme.jai@gmail.com','Jr Software Engineer' ,22728,'G0' , 'Corporate','Kharadi STPI Unit-IV');


select employee_id, last_name, manager_id from employees;

select worker.staff_name  || '  works for  ' || manager.staff_name
FROM staff worker, staff manager
WHERE worker.manager_id = manager.staff_id;

-------------
