-- gives partners making less than the average partner a small salary bump

update lawyer
set salary = salary * 1.005
where title = 'partner'
  and salary < (
      select avg_salary
      from (
          -- gets average salary of partners
          select avg(salary) as avg_salary
          from lawyer
          where title = 'partner'
      ) as salary_threshold
  );
