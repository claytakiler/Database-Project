-- Promote any associate to a partner if they have represented a
-- corporate client and have closed more times than they have settled for that specific company.
-- Author: Clayton Houser

UPDATE lawyer
SET
    title = 'partner'
WHERE
    title = 'associate'
    AND EXISTS (
        SELECT
            client.client_ID AS clients_id,
            -- Secondly, add a 1 or 0 for every row of cases inside the clients group
            -- Thirdly, SUM up the 1's and 0's for each client
            SUM(
                CASE
                    WHEN status = 'closed' THEN 1
                    ELSE 0
                END
            ) AS total_closed,
            SUM(
                CASE
                    WHEN status = 'settled' THEN 1
                    ELSE 0
                END
            ) AS total_settled
        FROM
            `case`
            INNER JOIN client ON client.client_ID = `case`.client_id
            INNER JOIN lawyer_assignment ON `case`.case_id = lawyer_assignment.case_ID
        WHERE
            client.type = 'corporate'
            AND lawyer.lawyer_ID = lawyer_assignment.lawyer_ID
        GROUP BY
            client.client_id -- First, Sort clients into their own group
        HAVING
            total_closed > total_settled
    );