Select lawyer.name, count(ls.specialization) as num_specializations
From lawyer
Join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
Group by lawyer.lawyer_ID, lawyer.name
Having count(ls.specialization) > 1
Order by num_specialization desc;
