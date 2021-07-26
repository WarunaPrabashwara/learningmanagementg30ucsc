CREATE DATABASE thirdyearproject;
use thirdyearproject ;
create table users ( id int primary key auto_increment,name varchar(60) , email varchar(60) ,password  varchar(60) , userLevel varchar(15) ,indexNo  varchar(60) ,telephone  varchar(60) ,address  varchar(60) , dob  varchar(60) );
create table subject_categories ( id int primary key auto_increment,name varchar(60)  );
create table classes ( id int primary key auto_increment,section varchar(60),grade varchar(60)  );
create table subjects ( id int primary key auto_increment,name varchar(60),category int  ,allowed_classes int, FOREIGN KEY(category) references subject_categories(id) , FOREIGN KEY(allowed_classes) references classes(id)  );
create table student_bucket ( student_id int ,bin_id int,subject_id int  , FOREIGN KEY(student_id) references users(id) , FOREIGN KEY(bin_id) references subject_categories(id) , FOREIGN KEY(subject_id) references subjects(id) );
create table student_groups (id int , student_id int ,class_id int, FOREIGN KEY(student_id) references users(id) , FOREIGN KEY(class_id) references classes(id) );
create table student_teacher_class ( teacher_id int ,class_id int ,isHomeworkAvailFlag boolean,zoom_link varchar(70)  , FOREIGN KEY(teacher_id) references users(id) , FOREIGN KEY(class_id) references classes(id) );
create table time_table ( t_t_name varchar(60) ,t_t_path varchar(60),class_id int ,t_t_teacher_id int , FOREIGN KEY(class_id) references classes(id) , FOREIGN KEY(t_t_teacher_id) references users(id) );
create table announcements ( date_time datetime ,description varchar(250),made_by   varchar(60) ,isAvailableForTeachersFlag  boolean,isAvailableForStudentsFlag  boolean,isAvailableForAdminssFlag  boolean,isAvailableForPrincipalsFlag  boolean,isAvailableForSectionheadsFlag boolean );
create table attendance ( date date,subject_id int,class_id  int,student_id int ,is_present boolean, FOREIGN KEY(subject_id) references subjects(id) , FOREIGN KEY(class_id) references classes(id), FOREIGN KEY(student_id) references users(id) );
create table subject_materials ( subject_id int,class_id  int,teacher_id int ,material varchar(80), FOREIGN KEY(subject_id) references subjects(id) , FOREIGN KEY(class_id) references classes(id), FOREIGN KEY(teacher_id) references users(id) );
create table reports ( year year ,term  varchar(5),subject_id int ,section varchar(5) ,class_id  int,student_id int ,marks int , FOREIGN KEY(subject_id) references subjects(id) , FOREIGN KEY(class_id) references classes(id), FOREIGN KEY(student_id) references users(id) );
create table homework ( subject_id int ,class_id  int,teacher_id int,student_id int ,title varchar(50) ,submission_text varchar(250),submission_location varchar(150) ,mark int, FOREIGN KEY(subject_id) references subjects(id) , FOREIGN KEY(class_id) references classes(id), FOREIGN KEY(teacher_id) references users(id), FOREIGN KEY(student_id) references users(id) );

