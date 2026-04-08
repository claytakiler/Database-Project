-- 1. NUKE: Delete the database if it exists to start fresh
DROP DATABASE IF EXISTS database_project;
CREATE DATABASE database_project;
USE database_project;

-- Schemas
-- Example: SOURCE schema/test.sql;
SOURCE schema/clients.sql;

-- queries

-- Data files
-- Example: SOURCE data/seed_data.sql;