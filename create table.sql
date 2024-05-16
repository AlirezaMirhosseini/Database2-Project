create table Patient (
	Patient_ID INT,
	Patient_FName VARCHAR(50),
	Patient_LName VARCHAR(50),
	Phone VARCHAR(50),
	Blood_Type VARCHAR(50),
	Email VARCHAR(50),
	Gender VARCHAR(50),
	Condition VARCHAR(50),
	Admission_Date DATE,
	Discharge_Date DATE,

	PRIMARY KEY (Patient_ID),
);



CREATE TABLE Department ( 
  Dept_ID INT NOT NULL, 
  Dept_Head VARCHAR(20) NOT NULL,
  Dept_Name VARCHAR(15) NOT NULL, 
  Emp_Count INT, PRIMARY KEY (Dept_ID) 
);


CREATE TABLE Staff ( 
  Emp_ID INT NOT NULL, 
  Emp_FName VARCHAR(20) NOT NULL, 
  Emp_LName VARCHAR(20) NOT NULL,
  Date_Joining DATE, 
  Date_Seperation DATE, 
  Emp_Type VARCHAR(15) NOT NULL, 
  Email VARCHAR(50), 
  Address VARCHAR(50) NOT NULL,
  Dept_ID INT NOT NULL,

  PRIMARY KEY (Emp_ID), 
  FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID) 
);


CREATE TABLE Doctor ( 
  Doctor_ID INT NOT NULL, 
  Emp_ID INT NOT NULL,
  Qualifications NVARCHAR(15) NOT NULL,
  Specialization NVARCHAR(20) NOT NULL, 
  
  PRIMARY KEY (Doctor_ID), 
  FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID), 
);



CREATE TABLE Nurse ( 
  Nurse_ID INT NOT NULL,

  PRIMARY KEY(Nurse_ID), 
  FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID), 
);

CREATE TABLE Payroll ( 
  Account_No VARCHAR(25) NOT NULL, 
  Salary DECIMAL(10,2) NOT NULL, 
  Bonus DECIMAL(10,2), 
  Emp_ID INT NOT NULL, 
  IBAN VARCHAR(25), 
  PRIMARY KEY (Account_No), 
  FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID) 
);


CREATE TABLE Lab_Screening ( 
  Lab_ID INT NOT NULL, 
  Patient_ID INT NOT NULL,
  Technician_ID INT NOT NULL, 
  Doctor_ID INT NOT NULL,   
  Test_Cost DECIMAL(10,2),
  Date DATE NOT NULL,   
  PRIMARY KEY (Lab_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID), 
  FOREIGN KEY (Technician_ID) REFERENCES Nurse (Nurse_ID), 
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID)
);


CREATE TABLE Insurance ( 
  Policy_Number int NOT NULL,
  Ins_Code VARCHAR(20) NOT NULL, 
  End_Date VARCHAR(10), 
  plan__ VARCHAR(20), 
  Co_Pay DECIMAL(10,2), 
  Coverage VARCHAR(20), 
  PRIMARY KEY (Policy_Number), 

);


CREATE TABLE Medicine( 
  Medicine_ID INT NOT NULL, 
  M_Name VARCHAR(20) NOT NULL,
  M_Quantity INT NOT NULL, 
  M_Cost Decimal(10,2), 
  PRIMARY KEY (Medicine_ID) 
);

CREATE TABLE Prescription ( 
  Prescription_ID INT NOT NULL, 
  Patient_ID INT NOT NULL,
  Medicine_ID INT NOT NULL, 
  Date DATE, 
  Dosage INT, 
  Doctor_ID INT NOT NULL, 
  PRIMARY KEY (Prescription_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID), 
  FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID)
);


CREATE TABLE Appointment ( 
  Apt_ID INT NOT NULL, 
  Scheduled_On DATETIME NOT NULL,
  Date DATE,
  Time TIME,
  Doctor_ID INT NOT NULL, 
  Patient_ID INT NOT NULL, 
  PRIMARY KEY (Appt_ID), 
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) 
);



CREATE TABLE Room ( 
  Room_ID INT NOT NULL, 
  Room_Type VARCHAR(50) NOT NULL, 
  Patient_ID INT NOT NULL,
  Room_Cost DECIMAL(10,2),       
  PRIMARY KEY (Room_ID),               
  
);




CREATE TABLE Bill ( 
  Bill_ID INT NOT NULL, 
  Patient_ID INT NOT NULL, 
  Date DATE NOT NULL, 
  Room_ID Decimal(10,2), 
  Lab_ID DECIMAL(10,2), 
  Other_Charges DECIMAL(10,2), 
  Medicine_ID DECIMAL(10,2), 
  Total DECIMAL(10,2),  
  Remaining_Balance DECIMAL(10,2), 
  Policy_Number VARCHAR(20) NOT NULL,
  PRIMARY KEY (Payment_ID), 
  FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID),
  FOREIGN KEY (Lab_ID) REFERENCES Lab_Screening (Lab_ID), 
  FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID), 
  FOREIGN KEY (Policy_Number) REFERENCES Insurance (Policy_Number) 
);


