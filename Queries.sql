# Select
SELECT * FROM Patients LIMIT 10;

# WHERE clause
SELECT * FROM Doctors WHERE specialization = 'Pediatrics';

# ORDER BY
SELECT * FROM Billing ORDER BY amount DESC LIMIT 10;

 # HAVING clause
SELECT patient_id, COUNT(*) as bills_count FROM Billing GROUP BY patient_id HAVING bills_count > 1;

 # INNER JOIN
SELECT a.appointment_id, p.first_name, d.first_name
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
LIMIT 10;

# INSERT
INSERT INTO Nurses (nurse_id, first_name, last_name, specialization, phone_number, email, shift, years_experience)
VALUES ('N101', 'Jane', 'Doe', 'ICU', '5551234567', 'jane.doe@hospital.com', 'Night', 5);

# UPDATE
UPDATE Patients SET contact_number = '9999999999' WHERE patient_id = 'P001';

# DELETE
DELETE FROM Appointments WHERE appointment_id = 'A010';

# aggregate COUNT
SELECT COUNT(*) FROM Treatments;

# aggregate SUM
SELECT SUM(amount) FROM Billing WHERE payment_status = 'Paid';
