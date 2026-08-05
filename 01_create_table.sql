CREATE TABLE Person (
    PersonID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(100),
    DateOfBirth DATE
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Email VARCHAR(50),
    RegistrationDate DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (PatientID) REFERENCES Person(PersonID) ON DELETE CASCADE
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Specialty VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    HireDate DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (DoctorID) REFERENCES Person(PersonID) ON DELETE CASCADE
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status VARCHAR(20) DEFAULT 'Scheduled' 
        CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE CASCADE
);

CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    TreatmentName VARCHAR(50) NOT NULL,
    Description VARCHAR(200),
    Cost DECIMAL(10,2) NOT NULL CHECK (Cost >= 0),
    AppointmentID INT NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) ON DELETE CASCADE
);

CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY AUTO_INCREMENT,
    MedicineName VARCHAR(50) NOT NULL UNIQUE,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    QuantityInStock INT DEFAULT 0 NOT NULL
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    PaymentDate DATE DEFAULT (CURRENT_DATE),
    PaymentMethod VARCHAR(20) NOT NULL 
        CHECK (PaymentMethod IN ('Cash', 'Credit Card', 'Online')),
    AppointmentID INT NOT NULL UNIQUE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) ON DELETE CASCADE
);

CREATE TABLE Treatment_Medicine (
    TreatmentID INT NOT NULL,
    MedicineID INT NOT NULL,
    QuantityUsed INT NOT NULL CHECK (QuantityUsed > 0),
    PRIMARY KEY (TreatmentID, MedicineID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID) ON DELETE CASCADE,
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID) ON DELETE CASCADE
);