-- TEMPLATE QUERY - DO NOT RUN AS-IS!
-- You MUST replace the placeholders with actual numbers before running
--
-- Example usage:
-- UPDATE lawyer_assignment SET case_ID = 7 WHERE lawyer_ID = 2 AND case_ID = 3;
-- (This reassigns lawyer 2 from case 3 to case 7)

UPDATE lawyer_assignment
SET case_ID = NEW_CASE_ID
WHERE lawyer_ID = LAWYER_ID AND case_ID = OLD_CASE_ID;