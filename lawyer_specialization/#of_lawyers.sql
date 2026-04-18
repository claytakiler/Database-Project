Select lawyer.name , lawyer.title, lawyer.salary
From lawyer
Join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
Where ls.specialization = ‘corporate law’
Order by lawyer.salary desc;
