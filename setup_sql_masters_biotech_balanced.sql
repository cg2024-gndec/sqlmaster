SET SQL_SAFE_UPDATES = 0;

-- ======================================================================
-- 1. LEVEL 1 DATABASE (level1_db) — 40 Researchers
-- ======================================================================
DROP DATABASE IF EXISTS level1_db;
CREATE DATABASE level1_db;
USE level1_db;

CREATE TABLE researchers (
    researcher_id INT PRIMARY KEY,
    name VARCHAR(50),
    sample_type VARCHAR(30),
    shift VARCHAR(20),
    lab_division VARCHAR(30)
);

INSERT INTO researchers VALUES
(1, 'Dr. Sameer', 'vaccine', 'Night', 'Pharma_Wing'),
(2, 'Dr. Raghav', 'insulin', 'Night', 'Clinical_Wing'),
(3, 'Dr. Keshav', 'genome_seq', 'Night', 'Neuro_Wing'),
(4, 'Dr. Mansoor', 'antibiotics', 'Day', 'Pharma_Wing'),
(5, 'Dr. Govind', 'neural_map', 'Day', 'Genetics_Wing'),
(6, 'Dr. Tariq', 'rna_blueprint', 'Night', 'Neuro_Wing'),
(7, 'Dr. Kabir', 'neural_map', 'Night', 'Neuro_Wing'),
(8, 'Dr. Bhanu', 'insulin', 'Day', 'Clinical_Wing'),
(9, 'Dr. Zafar', 'genome_seq', 'Night', 'Neuro_Wing'),
(10, 'Dr. Devraj', 'rna_blueprint', 'Day', 'Pharma_Wing'),
(11, 'Dr. Farhan', 'cryo_code', 'Night', 'Neuro_Wing'),
(12, 'Dr. Karan', 'vaccine', 'Night', 'Pharma_Wing'),
(13, 'Dr. Ananya', 'antibiotics', 'Night', 'Neuro_Wing'),
(14, 'Dr. Vikram', 'genome_seq', 'Day', 'Clinical_Wing'),
(15, 'Dr. Meera', 'vaccine', 'Day', 'Virology_Wing'),
(16, 'Dr. Arjun', 'cryo_code', 'Day', 'Genetics_Wing'),
(17, 'Dr. Priya', 'insulin', 'Night', 'Oncology_Wing'),
(18, 'Dr. Siddharth', 'stem_matrix', 'Night', 'Neuro_Wing'),
(19, 'Dr. Neha', 'antibiotics', 'Night', 'Clinical_Wing'),
(20, 'Dr. Rajesh', 'neural_map', 'Day', 'Oncology_Wing'),
(21, 'Dr. Kavita', 'vaccine', 'Night', 'Virology_Wing'),
(22, 'Dr. Rohan', 'rna_blueprint', 'Day', 'Genetics_Wing'),
(23, 'Dr. Pooja', 'insulin', 'Night', 'Neuro_Wing'),
(24, 'Dr. Nikhil', 'prion_model', 'Night', 'Neuro_Wing'),
(25, 'Dr. Shreya', 'vaccine', 'Day', 'Pharma_Wing'),
(26, 'Dr. Aditya', 'stem_matrix', 'Day', 'Virology_Wing'),
(27, 'Dr. Divya', 'antibiotics', 'Night', 'Oncology_Wing'),
(28, 'Dr. Harsh', 'genome_seq', 'Day', 'Pharma_Wing'),
(29, 'Dr. Nisha', 'insulin', 'Day', 'Genetics_Wing'),
(30, 'Dr. Varun', 'cryo_code', 'Day', 'Clinical_Wing'),
(31, 'Dr. Tanvi', 'vaccine', 'Night', 'Neuro_Wing'),
(32, 'Dr. Manish', 'antibiotics', 'Day', 'Virology_Wing'),
(33, 'Dr. Sneha', 'rna_blueprint', 'Night', 'Neuro_Wing'),
(34, 'Dr. Vivek', 'prion_model', 'Day', 'Oncology_Wing'),
(35, 'Dr. Ritu', 'insulin', 'Night', 'Pharma_Wing'),
(36, 'Dr. Kunal', 'neural_map', 'Day', 'Virology_Wing'),
(37, 'Dr. Swati', 'antibiotics', 'Night', 'Genetics_Wing'),
(38, 'Dr. Deepak', 'stem_matrix', 'Day', 'Clinical_Wing'),
(39, 'Dr. Ishita', 'vaccine', 'Night', 'Oncology_Wing'),
(40, 'Dr. Gaurav', 'insulin', 'Day', 'Pharma_Wing');

-- ======================================================================
-- 2. LEVEL 2 DATABASE (level2_db) — 40 Researchers, 20 Nodes, 120 Scrambled Logs
-- ======================================================================
DROP DATABASE IF EXISTS level2_db;
CREATE DATABASE level2_db;
USE level2_db;

CREATE TABLE researchers (
    researcher_id INT PRIMARY KEY,
    name VARCHAR(50),
    lab_division VARCHAR(30),
    clearance_code VARCHAR(30)
);

CREATE TABLE server_nodes (
    node_id INT PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE access_logs (
    log_id INT PRIMARY KEY,
    researcher_id INT,
    node_id INT,
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    FOREIGN KEY (node_id) REFERENCES server_nodes(node_id) ON DELETE CASCADE
);

INSERT INTO researchers VALUES
(1, 'Dr. Sameer', 'Pharma_Wing', 'BIO_02'), (2, 'Dr. Raghav', 'Clinical_Wing', 'CRYO_04'),
(3, 'Dr. Keshav', 'Neuro_Wing', 'BIO_02'), (4, 'Dr. Mansoor', 'Pharma_Wing', 'ALPHA_01'),
(5, 'Dr. Govind', 'Genetics_Wing', 'SYNAPSE_05'), (6, 'Dr. Tariq', 'Neuro_Wing', 'BIO_02'),
(7, 'Dr. Kabir', 'Neuro_Wing', 'HELIX_07'), (8, 'Dr. Bhanu', 'Clinical_Wing', 'OMEGA_09'),
(9, 'Dr. Zafar', 'Neuro_Wing', 'HELIX_07'), (10, 'Dr. Devraj', 'Pharma_Wing', 'VORTEX_03'),
(11, 'Dr. Farhan', 'Neuro_Wing', 'HELIX_07'), (12, 'Dr. Karan', 'Pharma_Wing', 'TITAN_08'),
(13, 'Dr. Ananya', 'Neuro_Wing', 'CRYO_04'), (14, 'Dr. Vikram', 'Clinical_Wing', 'BIO_02'),
(15, 'Dr. Meera', 'Virology_Wing', 'HELIX_07'), (16, 'Dr. Arjun', 'Genetics_Wing', 'CRYO_04'),
(17, 'Dr. Priya', 'Oncology_Wing', 'SYNAPSE_05'), (18, 'Dr. Siddharth', 'Neuro_Wing', 'BIO_02'),
(19, 'Dr. Neha', 'Clinical_Wing', 'ALPHA_01'), (20, 'Dr. Rajesh', 'Oncology_Wing', 'VORTEX_03'),
(21, 'Dr. Kavita', 'Virology_Wing', 'TITAN_08'), (22, 'Dr. Rohan', 'Genetics_Wing', 'HELIX_07'),
(23, 'Dr. Pooja', 'Neuro_Wing', 'CRYO_04'), (24, 'Dr. Nikhil', 'Neuro_Wing', 'CRYO_04'),
(25, 'Dr. Shreya', 'Pharma_Wing', 'CRYO_04'), (26, 'Dr. Aditya', 'Virology_Wing', 'BIO_02'),
(27, 'Dr. Divya', 'Oncology_Wing', 'OMEGA_09'), (28, 'Dr. Harsh', 'Pharma_Wing', 'SYNAPSE_05'),
(29, 'Dr. Nisha', 'Genetics_Wing', 'HELIX_07'), (30, 'Dr. Varun', 'Clinical_Wing', 'TITAN_08'),
(31, 'Dr. Tanvi', 'Virology_Wing', 'ALPHA_01'), (32, 'Dr. Manish', 'Virology_Wing', 'VORTEX_03'),
(33, 'Dr. Sneha', 'Neuro_Wing', 'CRYO_04'), (34, 'Dr. Vivek', 'Oncology_Wing', 'CRYO_04'),
(35, 'Dr. Ritu', 'Pharma_Wing', 'BIO_02'), (36, 'Dr. Kunal', 'Virology_Wing', 'HELIX_07'),
(37, 'Dr. Swati', 'Genetics_Wing', 'OMEGA_09'), (38, 'Dr. Deepak', 'Clinical_Wing', 'ALPHA_01'),
(39, 'Dr. Ishita', 'Oncology_Wing', 'TITAN_08'), (40, 'Dr. Gaurav', 'Pharma_Wing', 'VORTEX_03');

INSERT INTO server_nodes VALUES
(101, 'Mumbai'), (102, 'Mumbai'), (103, 'Bengaluru'), (104, 'Bengaluru'),
(105, 'Delhi'), (106, 'Delhi'), (107, 'Hyderabad'), (108, 'Hyderabad'),
(109, 'Chennai'), (110, 'Chennai'), (111, 'Pune'), (112, 'Pune'),
(113, 'Kolkata'), (114, 'Bengaluru'), (115, 'Delhi'), (116, 'Mumbai'),
(117, 'Hyderabad'), (118, 'Chennai'), (119, 'Pune'), (120, 'Kolkata');

INSERT INTO access_logs VALUES
(1, 32, 101), (2, 29, 109), (3, 31, 109), (4, 33, 109), (5, 28, 105),
(6, 18, 107), (7, 31, 105), (8, 7, 105), (9, 18, 103), (10, 35, 105),
(11, 34, 101), (12, 25, 101), (13, 14, 102), (14, 1, 109), (15, 19, 102),
(16, 23, 109), (17, 24, 101), (18, 9, 116), (19, 20, 101), (20, 35, 101),
(21, 30, 116), (22, 14, 116), (23, 27, 101), (24, 16, 109), (25, 37, 109),
(26, 13, 109), (27, 13, 120), (28, 17, 101), (29, 10, 109), (30, 21, 105),
(31, 32, 109), (32, 2, 102), (33, 33, 105), (34, 22, 109), (35, 29, 101),
(36, 10, 105), (37, 18, 108), (38, 28, 109), (39, 27, 109), (40, 40, 109),
(41, 23, 106), (42, 22, 105), (43, 4, 101), (44, 16, 105), (45, 5, 101),
(46, 9, 101), (47, 3, 101), (48, 39, 105), (49, 2, 101), (50, 11, 103),
(51, 6, 105), (52, 1, 105), (53, 20, 105), (54, 15, 105), (55, 4, 105),
(56, 12, 109), (57, 25, 102), (58, 25, 116), (59, 3, 105), (60, 38, 101),
(61, 19, 101), (62, 36, 109), (63, 32, 105), (64, 21, 101), (65, 10, 101),
(66, 7, 106), (67, 15, 109), (68, 26, 105), (69, 8, 105), (70, 36, 101),
(71, 14, 101), (72, 34, 105), (73, 17, 105), (74, 11, 114), (75, 7, 115),
(76, 30, 101), (77, 17, 109), (78, 19, 116), (79, 40, 101), (80, 1, 101),
(81, 8, 101), (82, 8, 109), (83, 9, 102), (84, 16, 101), (85, 22, 101),
(86, 11, 104), (87, 27, 105), (88, 26, 101), (89, 29, 105), (90, 26, 109),
(91, 36, 105), (92, 38, 116), (93, 39, 101), (94, 5, 109), (95, 20, 109),
(96, 6, 107), (97, 15, 101), (98, 21, 109), (99, 37, 101), (100, 34, 109),
(101, 6, 111), (102, 24, 111), (103, 5, 105), (104, 40, 105), (105, 37, 105),
(106, 23, 112), (107, 33, 102), (108, 4, 109), (109, 39, 109), (110, 24, 113),
(111, 12, 101), (112, 2, 116), (113, 31, 101), (114, 12, 105), (115, 28, 101),
(116, 38, 102), (117, 3, 103), (118, 35, 109), (119, 30, 102), (120, 13, 113);

-- ======================================================================
-- 3. LEVEL 3 DATABASE (level3_db) — 40 Researchers, 16 Storage Units, 87 Scrambled Transfers
-- ======================================================================
DROP DATABASE IF EXISTS level3_db;
CREATE DATABASE level3_db;
USE level3_db;

CREATE TABLE researchers (
    researcher_id INT PRIMARY KEY,
    name VARCHAR(50),
    clearance_code VARCHAR(30)
);

CREATE TABLE storage_units (
    unit_id INT PRIMARY KEY,
    unit_name VARCHAR(50),
    max_capacity INT
);

CREATE TABLE data_transfers (
    transfer_id INT PRIMARY KEY,
    researcher_id INT,
    unit_id INT,
    transfer_size INT,
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    FOREIGN KEY (unit_id) REFERENCES storage_units(unit_id) ON DELETE CASCADE
);

INSERT INTO researchers VALUES
(1, 'Dr. Sameer', 'BIO_02'), (2, 'Dr. Raghav', 'CRYO_04'),
(3, 'Dr. Keshav', 'BIO_02'), (4, 'Dr. Mansoor', 'ALPHA_01'),
(5, 'Dr. Govind', 'SYNAPSE_05'), (6, 'Dr. Tariq', 'BIO_02'),
(7, 'Dr. Kabir', 'HELIX_07'), (8, 'Dr. Bhanu', 'OMEGA_09'),
(9, 'Dr. Zafar', 'HELIX_07'), (10, 'Dr. Devraj', 'VORTEX_03'),
(11, 'Dr. Farhan', 'HELIX_07'), (12, 'Dr. Karan', 'TITAN_08'),
(13, 'Dr. Ananya', 'CRYO_04'), (14, 'Dr. Vikram', 'BIO_02'),
(15, 'Dr. Meera', 'HELIX_07'), (16, 'Dr. Arjun', 'CRYO_04'),
(17, 'Dr. Priya', 'SYNAPSE_05'), (18, 'Dr. Siddharth', 'BIO_02'),
(19, 'Dr. Neha', 'ALPHA_01'), (20, 'Dr. Rajesh', 'VORTEX_03'),
(21, 'Dr. Kavita', 'TITAN_08'), (22, 'Dr. Rohan', 'HELIX_07'),
(23, 'Dr. Pooja', 'CRYO_04'), (24, 'Dr. Nikhil', 'CRYO_04'),
(25, 'Dr. Shreya', 'CRYO_04'), (26, 'Dr. Aditya', 'BIO_02'),
(27, 'Dr. Divya', 'OMEGA_09'), (28, 'Dr. Harsh', 'SYNAPSE_05'),
(29, 'Dr. Nisha', 'HELIX_07'), (30, 'Dr. Varun', 'TITAN_08'),
(31, 'Dr. Tanvi', 'ALPHA_01'), (32, 'Dr. Manish', 'VORTEX_03'),
(33, 'Dr. Sneha', 'CRYO_04'), (34, 'Dr. Vivek', 'CRYO_04'),
(35, 'Dr. Ritu', 'BIO_02'), (36, 'Dr. Kunal', 'HELIX_07'),
(37, 'Dr. Swati', 'OMEGA_09'), (38, 'Dr. Deepak', 'ALPHA_01'),
(39, 'Dr. Ishita', 'TITAN_08'), (40, 'Dr. Gaurav', 'VORTEX_03');

INSERT INTO storage_units VALUES
(201, 'Alpha Cryo-Drive', 320), (202, 'Beta Neural-Array', 450),
(203, 'Gamma Helix-Vault', 280), (204, 'Delta Bio-Server', 510),
(205, 'Epsilon Gene-Bank', 390), (206, 'Zeta Cortex-Node', 600),
(207, 'Eta Prion-Rack', 350), (208, 'Theta RNA-Cluster', 420),
(209, 'Iota Stem-Drive', 290), (210, 'Kappa Synapse-Core', 480),
(211, 'Lambda Tensor-Unit', 310), (212, 'Mu Quantum-Cell', 540),
(213, 'Nu Bio-Matrix', 370), (214, 'Xi Cryo-Buffer', 400),
(215, 'Omicron Vault-Bay', 260), (216, 'Omega Core-Vault', 500);

INSERT INTO data_transfers VALUES
(1, 38, 206, 420), (2, 29, 205, 340), (3, 34, 204, 310), (4, 2, 206, 420),
(5, 36, 202, 400), (6, 33, 215, 210), (7, 15, 207, 310), (8, 32, 206, 420),
(9, 9, 202, 380), (10, 40, 206, 420), (11, 29, 209, 260), (12, 11, 204, 420),
(13, 1, 203, 680), (14, 16, 204, 310), (15, 24, 206, 420), (16, 38, 204, 310),
(17, 21, 203, 680), (18, 33, 203, 680), (19, 5, 204, 310), (20, 10, 206, 420),
(21, 2, 204, 310), (22, 8, 203, 680), (23, 37, 204, 310), (24, 20, 206, 420),
(25, 29, 213, 320), (26, 7, 205, 850), (27, 7, 201, 240), (28, 1, 215, 210),
(29, 17, 206, 420), (30, 27, 203, 680), (31, 19, 204, 310), (32, 12, 204, 310),
(33, 4, 206, 420), (34, 6, 206, 420), (35, 15, 214, 350), (36, 30, 206, 420),
(37, 30, 204, 310), (38, 39, 204, 310), (39, 20, 204, 310), (40, 16, 206, 420),
(41, 8, 215, 210), (42, 3, 204, 310), (43, 23, 206, 420), (44, 35, 206, 420),
(45, 26, 204, 310), (46, 28, 206, 420), (47, 17, 204, 310), (48, 6, 204, 310),
(49, 40, 204, 310), (50, 19, 206, 420), (51, 9, 210, 310), (52, 13, 206, 420),
(53, 25, 206, 420), (54, 10, 204, 310), (55, 11, 208, 360), (56, 12, 206, 420),
(57, 3, 206, 420), (58, 14, 215, 210), (59, 39, 206, 420), (60, 5, 206, 420),
(61, 34, 206, 420), (62, 13, 204, 310), (63, 26, 206, 420), (64, 7, 209, 210),
(65, 31, 204, 310), (66, 36, 215, 220), (67, 22, 203, 250), (68, 14, 203, 680),
(69, 18, 206, 420), (70, 23, 204, 310), (71, 21, 215, 210), (72, 25, 204, 310),
(73, 18, 204, 310), (74, 11, 212, 450), (75, 35, 204, 310), (76, 27, 215, 210),
(77, 32, 204, 310), (78, 22, 211, 280), (79, 9, 206, 490), (80, 28, 204, 310),
(81, 37, 206, 420), (82, 36, 210, 390), (83, 4, 204, 310), (84, 31, 206, 420),
(85, 15, 201, 290), (86, 24, 204, 310), (87, 22, 216, 410);
