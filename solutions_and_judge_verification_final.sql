-- =================================================================
-- SQL MASTERS: PARTICIPANT SOLUTIONS & JUDGE VERIFICATION SCRIPT
-- =================================================================
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------------------
-- LEVEL 1 SOLUTIONS (Database: level1_db)
-- -----------------------------------------------------------------
USE level1_db;

-- Question 1.1: Delete commercial medical thefts
DELETE FROM researchers WHERE sample_type IN ('vaccine', 'insulin', 'antibiotics');

-- Question 1.2: Delete Day shift researchers
DELETE FROM researchers WHERE shift = 'Day';

-- Question 1.3: View remaining suspects to get Clue #1
SELECT * FROM researchers;
-- CLUE #1 FOR LEVEL 2: lab_division = 'Neuro_Wing'


-- -----------------------------------------------------------------
-- LEVEL 2 SOLUTIONS (Database: level2_db)
-- -----------------------------------------------------------------
USE level2_db;

-- Question 2.1: Keep only suspects from 'Neuro_Wing' (Clue #1)
DELETE FROM researchers WHERE lab_division != 'Neuro_Wing';

-- Question 2.2: Find suspects who accessed >1 city OR <2 total nodes
SELECT a.researcher_id, COUNT(DISTINCT s.city) AS cities, COUNT(a.node_id) AS total_nodes
FROM access_logs a
JOIN server_nodes s ON a.node_id = s.node_id
GROUP BY a.researcher_id
HAVING COUNT(DISTINCT s.city) > 1 OR COUNT(a.node_id) < 2;
-- Returns researcher_id: 3, 6 (multiple cities) and 9 (only 1 node)

-- Question 2.3: Delete those suspects and reveal Clue #2
DELETE FROM researchers
WHERE researcher_id IN (
    SELECT a.researcher_id
    FROM access_logs a
    JOIN server_nodes s ON a.node_id = s.node_id
    GROUP BY a.researcher_id
    HAVING COUNT(DISTINCT s.city) > 1 OR COUNT(a.node_id) < 2
);

SELECT * FROM researchers;
-- CLUE #2 FOR LEVEL 3: clearance_code = 'HELIX_07' (IDs 7 and 11 survive)


-- -----------------------------------------------------------------
-- LEVEL 3 SOLUTIONS (Database: level3_db)
-- -----------------------------------------------------------------
USE level3_db;

-- Question 3.1: Keep only suspects with clearance_code = 'HELIX_07' (Clue #2)
DELETE FROM researchers WHERE clearance_code != 'HELIX_07';

-- Question 3.2: Find researcher whose SUM(transfer_size) > SUM(max_capacity)
SELECT dt.researcher_id, SUM(dt.transfer_size) AS total_transfer, SUM(su.max_capacity) AS total_cap
FROM data_transfers dt
JOIN storage_units su ON dt.unit_id = su.unit_id
GROUP BY dt.researcher_id
HAVING SUM(dt.transfer_size) > SUM(su.max_capacity);
-- Returns researcher_id: 7

-- Question 3.3: Delete everyone except that researcher and reveal final winner
DELETE FROM researchers
WHERE researcher_id NOT IN (
    SELECT dt.researcher_id
    FROM data_transfers dt
    JOIN storage_units su ON dt.unit_id = su.unit_id
    GROUP BY dt.researcher_id
    HAVING SUM(dt.transfer_size) > SUM(su.max_capacity)
);

SELECT * FROM researchers;
-- FINAL WINNER OUTPUT: researcher_id = 7, name = 'Dr. Kabir'


-- -----------------------------------------------------------------
-- JUDGE INSTANT VERIFICATION QUERY (Run to check all 3 levels)
-- -----------------------------------------------------------------
SELECT
    (SELECT IF(COUNT(*) = 5 AND COUNT(DISTINCT lab_division) = 1 AND MAX(lab_division) = 'Neuro_Wing', 'PASS', 'FAIL') FROM level1_db.researchers) AS Level_1_Status,
    (SELECT IF(COUNT(*) = 2 AND COUNT(DISTINCT clearance_code) = 1 AND MAX(clearance_code) = 'HELIX_07', 'PASS', 'FAIL') FROM level2_db.researchers) AS Level_2_Status,
    (SELECT IF(COUNT(*) = 1 AND MAX(name) = 'Dr. Kabir', 'WINNER! (Dr. Kabir)', 'INCOMPLETE') FROM level3_db.researchers) AS Level_3_Final_Verdict;
