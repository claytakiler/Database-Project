-- 1. NUKE: Delete the database if it exists to start fresh
DROP DATABASE IF EXISTS database_project;
CREATE DATABASE database_project;
USE database_project;

-- Schemas
-- Example: SOURCE schema/test.sql;
SOURCE schema/client.sql;
SOURCE schema/lawyer.sql;

-- Data files
-- Example: SOURCE data/seed_data.sql;
SOURCE data/client_data.sql;
SOURCE data/lawyer_data.sql;

-- queries
-- SOURCE queries/query1_avg_salary_by_title.sql;
-- SOURCE queries/query2_partners_above_avg_salary.sql;
-- SOURCE queries/query3_lawyers_on_active_cases.sql;