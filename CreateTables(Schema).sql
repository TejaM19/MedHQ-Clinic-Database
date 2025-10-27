CREATE TABLE Patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    date_of_birth DATE,
    contact_number VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number VARCHAR(60),
    email VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(50),
    phone_number VARCHAR(20),
    years_experience INT,
    email VARCHAR(100)
);

CREATE TABLE Appointments (
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id VARCHAR(10) PRIMARY KEY,
    appointment_id VARCHAR(10),
    treatment_type VARCHAR(50),
    description VARCHAR(255),
    cost DECIMAL(10,2),
    treatment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Billing (
    bill_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    treatment_id VARCHAR(10),
    bill_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE Nurses (
    nurse_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(30) CHECK (specialization IN ('General', 'ICU', 'Emergency', 'Pediatric', 'Surgical', 'Oncology')),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    shift VARCHAR(10),
    years_experience INT
);
