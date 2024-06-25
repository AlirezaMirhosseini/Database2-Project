CREATE TABLE Department (
    Dept_id INT PRIMARY KEY,
    Dept_head_EmpID INT,
    Dept_Name VARCHAR(100),
    Emp_count INT
);

CREATE TABLE Staff (
    Emp_id INT PRIMARY KEY,
    Dept_id INT,
    Emp_FName VARCHAR(100),
    Emp_LName VARCHAR(100),
    NationalCode VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(20),
    Join_Date DATE,
    Sep_Date DATE,
    Emp_type VARCHAR(50),
    Field VARCHAR(100),
    Address VARCHAR(255),
    FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

CREATE TABLE Doctor (
    Doctor_id INT PRIMARY KEY,
    Emp_id INT,
    Research VARCHAR(255),
    Specialization VARCHAR(255),
    FOREIGN KEY (Emp_id) REFERENCES Staff(Emp_id)
);

CREATE TABLE Nurse (
    Nurse_id INT PRIMARY KEY,
    Emp_id INT,
    shift VARCHAR(50),
    Supervisor_id INT,
    FOREIGN KEY (Emp_id) REFERENCES Staff(Emp_id)
);

CREATE TABLE Insurance (
    Insurance_id INT PRIMARY KEY,
    Insurance_name VARCHAR(100),
    Co_pay INT
);
CREATE TABLE Patient (
    Patient_id INT PRIMARY KEY,
    Patient_FName VARCHAR(100),
    Patient_LName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    PhoneNumber VARCHAR(20),
    NationalCode VARCHAR(50),
    Blood_type VARCHAR(10),
    Insurance_id INT,
    FOREIGN KEY (Insurance_id) REFERENCES Insurance(Insurance_id)
);



CREATE TABLE Reception (
    Rcp_id INT PRIMARY KEY,
    Emp_id INT,
    Patient_id INT,
    Sickness VARCHAR(255),
    Admission_Date DATE,
    Discharge_Date DATE,
    FOREIGN KEY (Emp_id) REFERENCES Staff(Emp_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);

CREATE TABLE Bill (
    Bill_id INT PRIMARY KEY,
    Rcp_id INT,
    Bill_date DATE,
    Original_cost INT,
    Discount INT,
    Final_cost INT,
    FOREIGN KEY (Rcp_id) REFERENCES Reception(Rcp_id)
);

CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY,
    tracking_number VARCHAR(100),
    type VARCHAR(50),
    type_description VARCHAR(255),
    Payment_date DATE,
    Original_amount INT,
    discount INT,
    Final_amount INT,
    
);

CREATE TABLE Prescription (
    Prescription_id INT PRIMARY KEY,
    Patient_id INT,
    Doctor_id INT,
    Prescription_date DATE,
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)

);

CREATE TABLE Orderinfo (
    order_id INT PRIMARY KEY,
    Prescription_id INT,
    Payment_id INT,
    order_date DATE,
    FOREIGN KEY (Prescription_id) REFERENCES Prescription(Prescription_id),
    FOREIGN KEY (Payment_id) REFERENCES Payment(Payment_id)
);

CREATE TABLE Medicine (
    Medicine_id INT PRIMARY KEY,
    Medicine_Name VARCHAR(100),
    isGeneric Bit ,
    type VARCHAR(50),
    Production_date DATE,
    Expiration_date DATE,
    company_Name VARCHAR(200),
    quantity INT,
    cost INT
);

CREATE TABLE PrescriptionMedicine (
    Prescription_id INT,
    Medicine_id INT,
    Medicine_quantity INT,
    --PRIMARY KEY (Prescription_id, Medicine_id),
    FOREIGN KEY (Prescription_id) REFERENCES Prescription(Prescription_id),
    FOREIGN KEY (Medicine_id) REFERENCES Medicine(Medicine_id)
);

CREATE TABLE Service_type (
    Service_type_id INT PRIMARY KEY,
    type VARCHAR(100)
);

CREATE TABLE Service (
    Service_id INT PRIMARY KEY,
    Rcp_id INT,
    Service_type_id INT,
    SubService_type_id INT,
    service_date DATE,
    FOREIGN KEY (Rcp_id) REFERENCES Reception(Rcp_id),
    FOREIGN KEY (Service_type_id) REFERENCES Service_type(Service_type_id)
    
);



CREATE TABLE Room (
    Room_id INT PRIMARY KEY,
    type VARCHAR(50),
    cost INT,
    capacity INT
);

CREATE TABLE Room_Reception (
    Room_Rcp_id INT PRIMARY KEY,
    Room_id INT,
    Rcp_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (Room_id) REFERENCES Room(Room_id),
    FOREIGN KEY (Rcp_id) REFERENCES Reception(Rcp_id)
);
CREATE TABLE Result (
    Result_id INT PRIMARY KEY,
    Description VARCHAR(100)
);

CREATE TABLE Surgery_type (
	Service_type_id INT,
    Surgery_Type_id INT PRIMARY KEY,
    type VARCHAR(100)
);

CREATE TABLE Radiology_type (
	Service_type_id INT,
    Radiology_Type_id INT PRIMARY KEY,
    type VARCHAR(100)
);

CREATE TABLE Lab_type (
	Service_type_id INT,
    Lab_Type_id INT PRIMARY KEY,
    type VARCHAR(100)
);
CREATE TABLE Surgery (
    Surgery_id INT PRIMARY KEY,
    Service_id INT,
    Service_type_id INT,
    Surgery_Type_id INT,
    Surgery_date DATE,
    Duration INT,
    Result_id INT,
    cost INT,
    Doctor_id INT,
	FOREIGN KEY (Service_id) REFERENCES Service(Service_id),
    FOREIGN KEY (Service_type_id) REFERENCES Service_type(Service_type_id),
    FOREIGN KEY (Surgery_Type_id) REFERENCES Surgery_type(Surgery_Type_id),
    FOREIGN KEY (Result_id) REFERENCES Result(Result_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

CREATE TABLE Radiology (
    Radiology_id INT PRIMARY KEY,
    Service_id INT,
    Service_type_id INT,
    Radiology_Type_id INT,
    Radiology_date DATE,
    cost INT,
    Nurse_id INT,
    FOREIGN KEY (Service_id) REFERENCES Service(Service_id),
    FOREIGN KEY (Service_type_id) REFERENCES Service_type(Service_type_id),
    FOREIGN KEY (Radiology_Type_id) REFERENCES Radiology_type(Radiology_Type_id),
    FOREIGN KEY (Nurse_id) REFERENCES Nurse(Nurse_id)
);

CREATE TABLE Lab (
    Lab_id INT PRIMARY KEY,
    Service_id INT,
    Service_type_id INT,
    Lab_Type_id INT,
    Lab_date DATE,
    cost INT,
    Nurse_id INT,
    FOREIGN KEY (Service_id) REFERENCES Service(Service_id),
    FOREIGN KEY (Service_type_id) REFERENCES Service_type(Service_type_id),
    FOREIGN KEY (Lab_Type_id) REFERENCES Lab_type(Lab_Type_id),
    FOREIGN KEY (Nurse_id) REFERENCES Nurse(Nurse_id)
);

CREATE TABLE Visit (
    Visit_id INT PRIMARY KEY,
    Service_id INT,
    Service_type_id INT,
    Doctor_id INT,
    Visit_date DATE,
    cost INT,
    FOREIGN KEY (Service_id) REFERENCES Service(Service_id),
    FOREIGN KEY (Service_type_id) REFERENCES Service_type(Service_type_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);
