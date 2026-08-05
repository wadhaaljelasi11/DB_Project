


-- 1. SELECT Statements

SELECT * FROM Person;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
SELECT * FROM Treatment;
SELECT * FROM Medicine;
SELECT * FROM Payment;
SELECT * FROM Treatment_Medicine;

-- 2. JOIN Query

SELECT 
    a.AppointmentID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Status
FROM Appointment a
JOIN Patient pt ON a.PatientID = pt.PatientID
JOIN Person p ON pt.PatientID = p.PersonID
JOIN Doctor dc ON a.DoctorID = dc.DoctorID
JOIN Person d ON dc.DoctorID = d.PersonID;

-- 3. Nested Query

SELECT FirstName, LastName
FROM Person
WHERE PersonID IN (SELECT DISTINCT PatientID FROM Appointment);

-- 4. Aggregate Functions with GROUP BY

SELECT 
    d.FirstName,
    d.LastName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    AVG(t.Cost) AS AvgTreatmentCost
FROM Doctor dc
JOIN Person d ON dc.DoctorID = d.PersonID
LEFT JOIN Appointment a ON dc.DoctorID = a.DoctorID
LEFT JOIN Treatment t ON a.AppointmentID = t.AppointmentID
GROUP BY d.FirstName, d.LastName;

-- 5. UPDATE Statement

UPDATE Medicine SET Price = 20.00 WHERE MedicineName = 'Aspirin';

SELECT * FROM Medicine;

-- 6. DELETE Statement

DELETE FROM Appointment WHERE AppointmentID = 5;

SELECT * FROM Appointment;

-- 7. VIEW

CREATE VIEW AppointmentDetails AS
SELECT 
    a.AppointmentID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Status
FROM Appointment a
JOIN Patient pt ON a.PatientID = pt.PatientID
JOIN Person p ON pt.PatientID = p.PersonID
JOIN Doctor dc ON a.DoctorID = dc.DoctorID
JOIN Person d ON dc.DoctorID = d.PersonID;

SELECT * FROM AppointmentDetails;

-- 8. TRIGGER Simulation

SELECT * FROM Appointment WHERE AppointmentID = 3;

INSERT INTO Payment VALUES (6, 250.00, '2026-07-27', 'Cash', 3);

UPDATE Appointment SET Status = 'Completed' WHERE AppointmentID = 3;

SELECT * FROM Appointment WHERE AppointmentID = 3;