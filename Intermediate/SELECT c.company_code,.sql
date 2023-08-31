SELECT c.company_code,
       founder,
       COUNT(DISTINCT lm.lead_manager_code),
       COUNT(DISTINCT sm.senior_manager_code),
       COUNT(DISTINCT m.manager_code),
       COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lm on c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm on lm.lead_manager_code = sm.lead_manager_code
LEFT JOIN Manager m on sm.senior_manager_code = m.senior_manager_code
LEFT JOIN Employee e on m.manager_code = e.manager_code
GROUP BY c.company_code, founder
ORDER BY company_code ASC;


-- We need company_code, founder name & counts of every type of employee
-- we cannot just pull this straight from the employee table as this doesnt feature every person
-- it only features upper management who are designated to an employee of a further down peron 
-- connected to an employee
-- to get every type of person we have to left join all tables, left join keeps full table of 
-- whichever table is being left join i.e. left join employee e would keep all of employee table
-- in a domino effect we left join all tables ensuring that the upper management for each is the key
-- we group by as using aggregate function with non aggregate features as well