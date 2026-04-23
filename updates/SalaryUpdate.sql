-- Give a salary upgrade of 10% to everyone who is a partner and who has settled or closed a case more than three times.
-- Author: Clayton Houser
UPDATE lawyer
SET salary = salary + (salary * 0.1)
WHERE title = 'partner' AND EXISTS(
    SELECT lawyer_assignment.lawyer_ID FROM `case`
    INNER JOIN lawyer_assignment ON lawyer_assignment.case_ID = `case`.case_id
    WHERE lawyer_assignment.lawyer_ID = lawyer.lawyer_ID AND (`case`.status = 'settled' OR `case`.status = 'closed')
    GROUP BY lawyer_assignment.lawyer_ID
    HAVING
    COUNT(`case`.status) > 3
);