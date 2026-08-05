INSERT INTO Medicine VALUES (1, 'Aspirin', 15.00, 100);
INSERT INTO Medicine VALUES (2, 'Atorvastatin', 75.00, 50);
INSERT INTO Medicine VALUES (3, 'Metformin', 45.00, 30);
INSERT INTO Medicine VALUES (4, 'Amoxicillin', 25.00, 80);
INSERT INTO Medicine VALUES (5, 'Paracetamol', 10.00, 200);

INSERT INTO Payment VALUES (1, 530.00, '2026-07-20', 'Credit Card', 1);
INSERT INTO Payment VALUES (2, 700.00, '2026-07-20', 'Cash', 2);
INSERT INTO Payment VALUES (3, 300.00, '2026-07-25', 'Credit Card', 3);
INSERT INTO Payment VALUES (4, 500.00, '2026-07-25', 'Online', 4);
INSERT INTO Payment VALUES (5, 200.00, '2026-07-26', 'Cash', 5);

INSERT INTO Treatment_Medicine VALUES (1, 1, 2);
INSERT INTO Treatment_Medicine VALUES (1, 2, 1);
INSERT INTO Treatment_Medicine VALUES (2, 4, 1);
INSERT INTO Treatment_Medicine VALUES (3, 1, 1);
INSERT INTO Treatment_Medicine VALUES (4, 4, 2);
INSERT INTO Treatment_Medicine VALUES (4, 5, 1);
INSERT INTO Treatment_Medicine VALUES (5, 2, 1);