-- Find the case_id for cases that have lawyers
-- that make up every possible  specialization

WITH
    CasesWithAllSpec AS (
        SELECT DISTINCT
            case_ID
        FROM lawyer_assignment AS C1
            -- Filter out cases who do NOT have all specializations
        WHERE
            NOT EXISTS (
                -- Get a list of every case who does NOT have all specializations
                SELECT specialization
                FROM
                    lawyer_specialization AS spec_list
                WHERE
                    NOT EXISTS ( -- Collect current skill if NOT coverd
                        -- Go through our case list and see if they have the specialization
                        SELECT *
                        FROM (
                                SELECT case_ID, specialization
                                FROM
                                    lawyer_assignment
                                    INNER JOIN lawyer_specialization ON lawyer_specialization.lawyer_ID = lawyer_assignment.lawyer_ID
                            ) AS C2
                        WHERE
                            C2.case_ID = C1.case_ID
                            AND C2.specialization = spec_list.specialization
                    )
            )
    )
SELECT CasesWithAllSpec.case_ID, lawyer.name AS lawyer_name, lawyer_specialization.specialization AS lawyer_specialization, `case`.title AS case_title FROM CasesWithAllSpec
INNER JOIN `case` ON CasesWithAllSpec.case_ID = `case`.case_id
INNER JOIN lawyer_assignment ON lawyer_assignment.case_ID = CasesWithAllSpec.case_ID
INNER JOIN lawyer ON lawyer.lawyer_ID = lawyer_assignment.lawyer_ID
INNER JOIN lawyer_specialization ON lawyer_specialization.lawyer_ID = lawyer.lawyer_ID
ORDER BY CasesWithAllSpec.case_ID ASC
;