SELECT
<<<<<<< HEAD
    lawyer.lawyer_ID, lawyer.name, lawyer.title AS lawyer_title, client.client_ID AS clients_id, client.name, client.type AS client_type,
=======
    lawyer.lawyer_ID, lawyer.name, client.client_ID AS clients_id, client.name,
>>>>>>> 3096ddc (Adding totals query)
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
    INNER JOIN lawyer ON lawyer_assignment.lawyer_ID = lawyer.lawyer_ID
WHERE
    client.type = 'corporate'
GROUP BY
    lawyer.lawyer_ID, client.client_id -- First, Sort clients into their own group;