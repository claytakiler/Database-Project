-- 1. NUKE: Delete the database if it exists to start fresh
DROP DATABASE IF EXISTS database_project;
CREATE DATABASE database_project;
USE database_project;

-- Schemas
-- Example: SOURCE schema/test.sql;
SOURCE schema/client.sql;

-- queries

-- Data files
-- Example: SOURCE data/seed_data.sql;
SOURCE data/client_data.sql;