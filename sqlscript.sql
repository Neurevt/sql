create table REGIONS (    
region_id number not null,    
region_name varchar2(50),    
constraint pk_region_id primary key (region_id)    
);

create table COUNTRIES (   
country_id number not null,   
country_name varchar2(50),   
region_id     number,   
constraint pk_country_id primary key (country_id),   
constraint fk_region_id foreign key (region_id)   
references REGIONS (region_id)  
);

create table LOCATIONS  (    
location_id number not null,    
street_id number,    
postal_code    number,    
city  varchar2(50),    
state_province varchar2(50),    
country_id number not null,    
constraint pk_location_id primary key (location_id),    
constraint fk_country_id foreign key (country_id)    
references COUNTRIES (country_id)    
);

create table DEPARTMENTS (     
  department_id           number not null,   
  department_name         varchar2(50),   
  manager_id                 number,   
  location_id             number,     
  constraint pk_department_id primary key (department_id),  
  constraint fk_location_id foreign key (location_id)  
  references LOCATIONS (location_id)  
);

create table JOBS (     
  job_id            number not null,   
  job_title         varchar2(50),   
  min_salary        number,   
  max_salary        number,     
    
  constraint pk_job_id primary key (job_id)   
);

create table EMPLOYEES (      
  employee_id            number not null,    
  fist_name              varchar2(50),   
  last_name              varchar2(50),    
  email                  varchar2(50),      
  phone_number           number,      
  hire_date              date,      
  job_id                 number,    
  salary                 number,    
  commission_pct         number,    
  manger_id              number,      
  department_id          number,    
constraint pk_employee_id primary key (employee_id),    
constraint fk_job_id foreign key (job_id)    
references JOBS (job_id)    
);

create table JOB_HISTORY (       
employee_id        number,   
start_date         date not null,     
end_date           date,   
job_id             number,   
department_id      number,  
  
constraint pk_start_date primary key (start_date), 
constraint fk_employee_id foreign key (employee_id) 
references EMPLOYEES (employee_id), 
constraint fk_department_id foreign key (department_id) 
references DEPARTMENTS (department_id) 
);

