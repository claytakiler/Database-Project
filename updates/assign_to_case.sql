INSERT INTO lawyer_assignment (lawyer_ID, case_ID)
SELECT l.lawyer_ID, c.case_ID
FROM
(
    SELECT l.lawyer_ID
    FROM lawyer l
    LEFT JOIN lawyer_assignment la
        ON l.lawyer_ID = la.lawyer_ID
    GROUP BY l.lawyer_ID
    ORDER BY COUNT(la.case_ID) ASC
    LIMIT 1
) AS l
CROSS JOIN
(
    SELECT c.case_ID
    FROM `case` c
    WHERE NOT EXISTS (
        SELECT 1
        FROM lawyer_assignment la
        WHERE la.lawyer_ID = (
            SELECT l2.lawyer_ID
            FROM lawyer l2
            LEFT JOIN lawyer_assignment la2
                ON l2.lawyer_ID = la2.lawyer_ID
            GROUP BY l2.lawyer_ID
            ORDER BY COUNT(la2.case_ID) ASC
            LIMIT 1
        )
        AND la.case_ID = c.case_ID
    )
    LIMIT 1
) AS c;