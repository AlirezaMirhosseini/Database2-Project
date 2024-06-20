CREATE TABLE Department (
    Dept_id INT PRIMARY KEY,
    Dept_head_EmpID INT,
    Dept_Name VARCHAR(100),
    Emp_count INT
);

CREATE TABLE Staff (
    Emp_id INT PRIMARY KEY,
    Dept_id INT FOREIGN KEY REFERENCES Department(Dept_id),
    Emp_FName VARCHAR(100),
    Emp_LName VARCHAR(100),
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Join_Date DATE,
    Sep_Date DATE,
    Emp_type VARCHAR(50),
    Field VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Doctor (
    Doctor_id INT PRIMARY KEY,
    Emp_id INT FOREIGN KEY REFERENCES Staff(Emp_id),
    Research VARCHAR(255),
    Specialization VARCHAR(255)
);

CREATE TABLE Nurse (
    Nurse_id INT PRIMARY KEY,
    Emp_id INT FOREIGN KEY REFERENCES Staff(Emp_id),
    shift VARCHAR(50),
    Supervisor_id INT FOREIGN KEY REFERENCES Staff(Emp_id)
);

CREATE TABLE Room (
    Room_id INT PRIMARY KEY,
    type VARCHAR(50),
    cost DECIMAL(10, 2),
    capacity INT
);

CREATE TABLE Insurance (
    Insurance_id INT PRIMARY KEY,
    Insurance_name VARCHAR(100),
    Co_pay DECIMAL(10, 2)
);

CREATE TABLE Patient (
    Patient_id INT PRIMARY KEY,
    Patient_FName VARCHAR(100),
    Patient_LName VARCHAR(100),
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Blood_Type VARCHAR(10),
    Insurance_id INT FOREIGN KEY REFERENCES Insurance(Insurance_id)
);



CREATE TABLE Reception (
    Rcp_id INT PRIMARY KEY,
    Emp_id INT FOREIGN KEY REFERENCES Staff(Emp_id),
    Patient_id INT FOREIGN KEY REFERENCES Patient(Patient_id),
    Sickness VARCHAR(255),
    Admission_Date DATE,
    Discharge_Date DATE
);

CREATE TABLE Room_Reception (
    Room_Rcp_id INT PRIMARY KEY,
    Room_id INT FOREIGN KEY REFERENCES Room(Room_id),
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    start_date DATE,
    end_date DATE
);


CREATE TABLE Service_type (
    Service_type_id INT PRIMARY KEY,
    type VARCHAR(50)
);

CREATE TABLE Service (
    Service_id INT PRIMARY KEY,
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    Service_type_id INT FOREIGN KEY REFERENCES Service_type(Service_type_id),
    SubService_type_id INT,
    service_date DATE
);

CREATE TABLE Surgery_type (
    Surgery_type_id INT PRIMARY KEY,
    type VARCHAR(50)
); 
CREATE TABLE Result (
    Result_id INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE Surgery (
    Surgery_id INT PRIMARY KEY,
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    Service_type_id INT FOREIGN KEY REFERENCES Service_type(Service_type_id),
    Surgery_type_id INT FOREIGN KEY REFERENCES Surgery_type(Surgery_type_id),
    Surgery_date DATE,
    Duration TIME,
    Result_id INT FOREIGN KEY REFERENCES Result(Result_id),
    cost DECIMAL(10, 2),
    Doctor_id INT FOREIGN KEY REFERENCES Doctor(Doctor_id)
);


CREATE TABLE Radiology_type (
    Radiology_type_id INT PRIMARY KEY,
    type VARCHAR(50)
);

CREATE TABLE Radiology (
    Radiology_id INT PRIMARY KEY,
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    Service_type_id INT FOREIGN KEY REFERENCES Service_type(Service_type_id),
    Radiology_type_id INT FOREIGN KEY REFERENCES Radiology_type(Radiology_type_id),
    Radiology_date DATE,
    cost DECIMAL(10, 2)
);

CREATE TABLE Lab_type (
    Lab_type_id INT PRIMARY KEY,
    type VARCHAR(50)
);

CREATE TABLE Lab (
    Lab_id INT PRIMARY KEY,
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    Service_type_id INT FOREIGN KEY REFERENCES Service_type(Service_type_id),
    LabType_id INT FOREIGN KEY REFERENCES Lab_type(Lab_type_id),
    Lab_date DATE,
    lab_type VARCHAR(50),
    cost DECIMAL(10, 2)
);


CREATE TABLE Visit (
    Visit_id INT PRIMARY KEY,
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    Service_type_id INT FOREIGN KEY REFERENCES Service_type(Service_type_id),
    Visit_date DATE,
    cost DECIMAL(10, 2)
);



CREATE TABLE Bill (
    Bill_id INT PRIMARY KEY,
    Rcp_id INT FOREIGN KEY REFERENCES Reception(Rcp_id),
    Bill_date DATE,
    Bill_cost DECIMAL(10, 2)
);
CREATE TABLE Prescription (
    Prescription_id INT PRIMARY KEY,
    Patient_id INT FOREIGN KEY REFERENCES Patient(Patient_id),
    Doctor_id INT FOREIGN KEY REFERENCES Doctor(Doctor_id),
    Prescription_date DATE
);


CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY,
    Payment_date DATE,
    type VARCHAR(50),
    tracking_number VARCHAR(50),
    discount DECIMAL(10, 2),
    amount DECIMAL(10, 2)
);


CREATE TABLE Orderinfo (
    order_id INT PRIMARY KEY,
    order_date DATE,
    Prescription_id INT FOREIGN KEY REFERENCES Prescription(Prescription_id),
    Payment_id INT FOREIGN KEY REFERENCES Payment(Payment_id)
);

CREATE TABLE Medicine (
    Medicine_id INT PRIMARY KEY,
    Medicine_Name VARCHAR(100),
    type VARCHAR(50),
    Production_date DATE,
    Expiration_date DATE,
    quantity INT,
    cost DECIMAL(10, 2)
);

CREATE TABLE PrescriptionMedicine (
    Prescription_id INT FOREIGN KEY REFERENCES Prescription(Prescription_id),
    Medicine_id INT FOREIGN KEY REFERENCES Medicine(Medicine_id),
    Medicine_quantity INT,
    PRIMARY KEY (Prescription_id, Medicine_id)
);


