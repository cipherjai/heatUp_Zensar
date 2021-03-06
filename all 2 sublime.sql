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
// How many associates are there per location , practice, grade. 


create table venue
(venue_id number(5),
Room_name varchar2(40),
Floor varchar2(20),
Building_name varchar2(20),
Capicity number(6),
location varchar2(20));

insert into venue values(33,'Minerva',3,'DLF Hyderabad',16,'Hyderabad');
insert into venue values(38,'A Tharva 1st floor Hyderabad',1,'DLF Hyderabad',16,'Hyderabad');
insert into venue values(31,'Training room Ninth floor Dlf',9,'DLF Hyderabad',16,'Hyderabad');
insert into venue values(21,'Aristotle lower ground floor Himalaya',-1,'Himalaya',30,'Pune');
insert into venue values(22,'Gurkul Himalaya third floor ',3,'Himalaya',25,'Pune');
insert into venue values(23,'Kolyma fuji second floor ',2,'Fuji',16,'Pune');
insert into venue values(27,'Prime IT Tower second floor ',2,'IT Tower',16,'Pune');
insert into venue values(28,'Prestine IT Tower second floor ',2,'IT Tower',8,'Pune');
insert into venue values(30,'Salween Fuji fourth floor',4,'Fuji',20,'Pune');
insert into venue values(35,'Vortex',3,'Himalaya',30,'Pune');






create table training_requests (training_id number(6),
                                staff_id number(6),
                                subject varchar2(40),
                                description varchar2(20),
                                num_of_candidates number (4));
insert into training_requests values(1088,38068,'Mansoor alaram for fusion','Hyderabad',20);
insert into training_requests values(485,22766,'CORE JAVA','None',15);
insert into training_requests values(749,37073,'JAVA SPRING FRAMEWORK','None',25);
insert into training_requests values(1096,38068,'Mastering Java Swing','Tech Training',10);
insert into training_requests values(543,37073,'Msproject','None',30);
insert into training_requests values(1098,38068,'Sales for developers ','Tech Training',10);
insert into training_requests values(1099,38068,'Share point ','Tech Training',10);
insert into training_requests values(1093,38068,'ADFn ','Tech Training',10);
insert into training_requests values(1090,38068,'OAF','Tech Training',10);
insert into training_requests values(424,41726,'JAVA WEB SERVICES','None',25);
insert into training_requests values(697,37073,'RDBMS','None',25);
insert into training_requests values(785,37073,'J QUERY','None',15);
insert into training_requests values(1080,37073,'ADV SQL','None',25);
insert into training_requests values(1079,37073,'Performance Tuning','None',15);
insert into training_requests values(1113,37073,'Hibernate','None',20);
insert into training_requests values(1082,37073,'Spring 3.0','None',15);
insert into training_requests values(1100,37073,'WCF 4.5','None',15);
insert into training_requests values(1087,37073,'Getting standard with Jenkins','None',15);

create table training_schedule (
shedule_id number(5),
training_id number(6),
start_date date,
end_date date, 
start_time varchar2(20), 
end_time varchar2(20),
venue_id number(5),
Training_hours number(3));   
insert into training_schedule values(43,424,'25-MAR-14','28-MAR-14','14:00:00','18:00:00',26,16)
insert into training_schedule values(69,485,'25-APR-14','28-APR-14','14:00:00','18:00:00',20,0);
insert into training_schedule values(102,543,'27-MAY-14','27-MAY-14','09:00:00','17:30:00',21,8);
insert into training_schedule values(244,697,'29-SEP-14','29-SEP-14','14:30:00','18:00:00',22,4);
insert into training_schedule values(295,749,'19-NOV-14','26-NOV-14','09:30:00','13:30:00',28,24);
insert into training_schedule values(312,785,'03-DEC-14','05-DEC-14','09:30:00','13:30:00',23,20);
insert into training_schedule values(579,1079,'26-AUG-15','28-AUG-15','14:30:00','18:00:00',22,12);
insert into training_schedule values(580,1080,'20-AUG-15','21-AUG-15','09:30:00','13:00:00',22,8);
insert into training_schedule values(582,1082,'10-AUG-15','13-AUG-15','14:00:00','18:00:00',27,16);
insert into training_schedule values(586,1087,'17-AUG-15','17-AUG-15','10:00:00','13:00:00',30,04);
insert into training_schedule values(588,1088,'03-AUG-15','07-AUG-15','09:30:00','12:30:00',38,15);
insert into training_schedule values(591,1090,'24-AUG-15','28-AUG-15','14:00:00','18:00:00',31,20);
insert into training_schedule values(593,1093,'10-AUG-15','21-AUG-15','14:00:00','18:00:00',31,40);
insert into training_schedule values(596,1096,'17-AUG-15','21-AUG-15','10:00:00','14:00:00',33,20);
insert into training_schedule values(598,1098,'24-AUG-15','28-AUG-15','10:00:00','14:00:00',33,20);
insert into training_schedule values(599,1099,'24-AUG-15','28-AUG-15','14:00:00','18:00:00',33,20);
insert into training_schedule values(600,1100,'10-AUG-15','12-AUG-15','09:30:00','13:30:00',28,12);
insert into training_schedule values(612,1113,'23-SEP-15','26-SEP-15','14:00:00','18:00:00',21,16);


create table nomination(nomination_id number(6),
                        nomination_timestamp varchar2(30),
                        staff_id number(5),
                        training_id number(5),
                        status number(2));
                        
                        insert into nomination values(33,'10-MAR-14 12:15:29',22766,424,4)
                        insert into nomination values(771,'28-MAR-14 10:57:44',24085,485,4)
                        insert into nomination values(1933,'28-APR-14 13:41:12',37934,543,4)
                        insert into nomination values(4576,'27-AUG-14 10:38:54',82818,697,1)
                        insert into nomination values(5619,'29-OCT-14 12:06:36',37847,749,5)
                        insert into nomination values(6175,'26-NOV-14 14:36:04',31295,785,5)
                        insert into nomination values(13641,'27-JUL-15 13:11:21',40429,1079,4)
                        insert into nomination values(13639,'27-JUL-15 12:51:00',43615,1080,1)
                        insert into nomination values(13647,'27-JUL-15 14:18:32',46121,1082,1)
                        insert into nomination values(13646,'27-JUL-15 14:18:14',46121,1087,1)
                        insert into nomination values(13777,'30-JUL-15 14:39:37',46071,1088,5)
                        insert into nomination values(13868,'03-AUG-15 10:24:03',40424,1090,5)
                        insert into nomination values(13852,'31-Jul-15 16:21:08',39480,1093,5)
                        insert into nomination values(14099,'10-AUG-15 13:02:09',44267,1096,1)
                        insert into nomination values(13817,'31-Jul-15 05:46:29',46123,1098,1)
                        insert into nomination values(13815,'30-Jul-15 22:48:41',34366,1099,7)
                        insert into nomination values(13972,'04-AUG-15 18:18:46',34623,1100,5)
                        insert into nomination values(14467,'26-AUG-15 18:18:46',46318,1113,1)
                         

