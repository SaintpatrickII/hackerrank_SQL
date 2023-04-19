WITH project_start as(
SELECT Start_Date,
RANK() OVER (ORDER BY Start_date) as rank_start
FROM Projects
WHERE Start_Date not in(SELECT End_Date from projects)),
project_end as(
SELECT End_Date,
RANK() OVER (ORDER BY End_date) as rank_end
FROM Projects
WHERE End_Date not in(SELECT Start_Date from projects))

SELECT Start_Date, End_Date FROM
project_start, project_end
WHERE rank_start = rank_end
ORDER BY
DATEDIFF(Start_Date, End_Date) DESC, Start_Date;