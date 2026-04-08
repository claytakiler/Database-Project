INSERT INTO
    client (
        client_ID,
        name,
        type,
        phone_number
    )
VALUES (
        '00001',
        'Mary Williams',
        'individual',
        2253418961
    ),
    (
        '00002',
        'Steven Fischer',
        'individual',
        2250175749
    ),
    (
        '00003',
        'Ethan Walker',
        'individual',
        2256419864
    ),
    (
        '00004',
        'Jacob Turner',
        'corporate',
        2253085729
    ),
    (
        '00005',
        'Hannah Reed',
        'individual',
        2252847897
    ),
    (
        '00006',
        'Lauren Hayes',
        'corporate',
        2251083096
    ),
    (
        '00007',
        'Brandon Hughes',
        'corporate',
        2258264655
    ),
    (
        '00008',
        'Chloe Simmons',
        'individual',
        2251745638
    ),
    (
        '00009',
        'Dylan Parker',
        'individual',
        2253418961
    ),
    (
        '00010',
        'Olivia Carter',
        'corporate',
        2253418961
    ),
    (
        '00011',
        'Megan Russell',
        'individual',
        2253418961
    ),
    (
        '00012',
        'Austin Griffin',
        'corporate',
        2253418961
    ),
    (
        '00013',
        'Tyler Jenkins',
        'individual',
        2253418961
    ),
    (
        '00014',
        'Madison Brooks',
        'corporate',
        2253418961
    ),
    (
        '00015',
        'Caleb Bryant',
        'individual',
        2253418961
    );

-- hearing data
insert into hearing (case_ID, judge, date_time, courthouse)
values
-- case_ID = 00001
    ('00001', 'Fontenot', '2026-1-3 11:00:00.00', 'Baton Rouge City Court'),
    ('00001', 'Fontenot', '2026-5-30 09:00:00.00', 'Baton Rouge City Court'),
-- case_ID = 00002
    ('00002', 'Johnson', '2026-1-11 14:30:00.00', 'New Orleans City Court'),
    ('00002', 'Johnson', '2026-4-20 09:30:00.00', 'New Orleans City Court'),
-- case_ID = 00003
    ('00003', 'Smith', '2026-6-12 12:30:00.00', 'Baton Rouge City Court'),
-- case_ID = 00005
    ('00005', 'Broussard', '2026-5-2 11:00:00.00', 'Lafayette City Court'),
    ('00005', 'Broussard', '2026-6-27 09:30:00.00', 'Lafayette City Court'),
-- case_ID = 00006
    ('00006', 'Williams', '2026-6-25 11:00:00.00', 'New Iberia City Court'),
-- case_ID = 00008
    ('00008', 'Boudreaux', '2026-1-29 10:30:00.00', 'Lafayette City Court'),
    ('00008', 'Hebert', '2026-4-6 12:30:00.00', 'Lafayette City Court'),
    ('00008', 'Hebert', '2026-5-2 15:30:00.00', 'Lafayette City Court'),
-- case_ID = 00014
    ('00014', 'Bourgeois', '2026-2-08 13:00:00.00', 'New Iberia City Court'),
-- case_ID = 00015
    ('00015', 'LeBlanc', '2026-3-3 09:00:00.00', 'New Orleans City Court'),
    ('00015', 'LeBlanc', '2026-3-27 15:00:00.00', 'New Orleans City Court'),
    ('00015', 'Guidry', '2026-5-5 11:30:00.00', 'New Orleans City Court');
