
-- counts number of challenges completed by each hacker
with tbl_num_challenges as 
(SELECT h.hacker_id, h.name, count(c.challenge_id) as num_challenges
from hackers h 
join challenges c
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
),

-- counts amount of hackers that completed a certian number of challenges
tbl_count_challenges as
(SELECT num_challenges, 
        count(num_challenges) as count_challenges
from tbl_num_challenges
group by num_challenges)

SELECT 
       tnc.hacker_id,
       tnc.name,
       tnc.num_challenges
FROM tbl_num_challenges tnc
JOIN tbl_count_challenges tcc
ON tnc.num_challenges = tcc.num_challenges


WHERE tcc.count_challenges <= 1
OR
tnc.num_challenges = (SELECT MAX(num_challenges) FROM tbl_num_challenges)
ORDER BY tnc.num_challenges desc, hacker_id;