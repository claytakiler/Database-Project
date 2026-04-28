WITH lawyer_case_info AS (
   
    SELECT 
        lawyer_assignment.lawyer_ID,
        lawyer_assignment.case_ID AS old_case_id,
        lawyer.name AS lawyer_name,
        lawyer.title AS lawyer_title,
        lawyer.salary
    FROM lawyer_assignment
    INNER JOIN lawyer 
        ON lawyer_assignment.lawyer_ID = lawyer.lawyer_ID
    WHERE lawyer_assignment.case_ID = OLD_CASE_ID 
      AND lawyer_assignment.lawyer_ID = LAWYER_ID
),

new_case_check AS (
   
    SELECT 
        `case`.case_ID,
        `case`.status,
        lawyer_assignment.lawyer_ID AS existing_lawyer
    FROM `case`
    LEFT OUTER JOIN lawyer_assignment 
        ON `case`.case_ID = lawyer_assignment.case_ID
    WHERE `case`.case_ID = NEW_CASE_ID
)

UPDATE lawyer_assignment
SET case_ID = NEW_CASE_ID
WHERE lawyer_ID = LAWYER_ID
  AND case_ID = OLD_CASE_ID

  AND lawyer_ID IN (
      SELECT lawyer.lawyer_ID
      FROM lawyer
      INNER JOIN lawyer_assignment 
          ON lawyer.lawyer_ID = lawyer_assignment.lawyer_ID
      WHERE lawyer_assignment.case_ID = OLD_CASE_ID
  );

INSERT INTO lawyer_assignment (
    lawyer_ID,
    case_ID
)
SELECT
    LAWYER_ID,
    NEW_CASE_ID
FROM lawyer
WHERE lawyer.lawyer_ID = LAWYER_ID

AND NOT EXISTS (
    SELECT 1
    FROM lawyer_assignment
    WHERE lawyer_assignment.lawyer_ID = LAWYER_ID
      AND lawyer_assignment.case_ID = NEW_CASE_ID
);