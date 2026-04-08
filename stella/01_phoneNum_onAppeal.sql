– get phone_#, title (from client) for all clients who have a case with case status = “on appeal”.

select
    client.phone_#,
    client.title as client_title,
    case.title as case_title

from
    client join case
    on client.client_id = case.client_id

where case.status = 'on appeal';