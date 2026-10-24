SET SQL_SAFE_UPDATES = 0;

-- ==========================================
-- 1. LEVEL 1 DATABASE (level1_db)
-- ==========================================
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
(12, 'Dr. Karan', 'vaccine', 'Night', 'Pharma_Wing');

-- ==========================================
-- 2. LEVEL 2 DATABASE (level2_db)
-- ==========================================
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
(1, 'Dr. Sameer', 'Pharma_Wing', 'BIO_02'),
(2, 'Dr. Raghav', 'Clinical_Wing', 'BIO_02'),
(3, 'Dr. Keshav', 'Neuro_Wing', 'BIO_02'),
(6, 'Dr. Tariq', 'Neuro_Wing', 'BIO_02'),
(7, 'Dr. Kabir', 'Neuro_Wing', 'HELIX_07'),
(9, 'Dr. Zafar', 'Neuro_Wing', 'HELIX_07'),
(11, 'Dr. Farhan', 'Neuro_Wing', 'HELIX_07');

INSERT INTO server_nodes VALUES
(101, 'Mumbai'), (102, 'Mumbai'), (103, 'Bengaluru'), (104, 'Bengaluru'),
(105, 'Delhi'), (106, 'Delhi'), (107, 'Hyderabad');

INSERT INTO access_logs VALUES
(1, 1, 101), (2, 1, 103), (3, 2, 101), (4, 2, 102),
(5, 3, 101), (6, 3, 103), (7, 6, 105), (8, 6, 107),
(9, 7, 105), (10, 7, 106), (11, 9, 101),
(13, 11, 103), (14, 11, 104);

-- ==========================================
-- 3. LEVEL 3 DATABASE (level3_db)
-- ==========================================
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
(1, 'Dr. Sameer', 'BIO_02'),
(7, 'Dr. Kabir', 'HELIX_07'),
(9, 'Dr. Zafar', 'HELIX_07'),
(11, 'Dr. Farhan', 'HELIX_07');

INSERT INTO storage_units VALUES
(101, 'Alpha Cryo-Drive', 500), (103, 'Beta Neural-Array', 600),
(105, 'Omega Core-Vault', 400), (106, 'Sigma Bio-Server', 500),
(107, 'Delta Backup-Node', 300);

INSERT INTO data_transfers VALUES
(1, 1, 107, 700), (3, 9, 101, 250),
(4, 11, 101, 300), (5, 11, 103, 200),
(2, 7, 105, 900), (6, 7, 106, 200);
