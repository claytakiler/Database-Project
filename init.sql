-- 1. NUKE: Delete the database if it exists to start fresh
DROP DATABASE IF EXISTS database_project;
CREATE DATABASE database_project;
USE database_project;

-- Schemas
-- Example: SOURCE schema/test.sql;
SOURCE schema/client.sql;
SOURCE schema/case.sql;
SOURCE schema/hearing.sql; -- hearing requires case
SOURCE schema/specialization.sql;
-- queries

-- Data files
-- Example: SOURCE data/seed_data.sql;
SOURCE data/client_data.sql;
SOURCE data/case_data.sql;
SOURCE data/hearing_data.sql; -- hearing requires case
SOURCE data/specialization_data.sql;
-- queries