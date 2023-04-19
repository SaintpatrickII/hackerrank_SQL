SELECT h.hacker_id, 
       h.name
       -- COUNT(s.challenge_id)
FROM hackers h 
LEFT JOIN submissions s ON h.hacker_id = s.hacker_id
LEFT JOIN challenges c ON s.challenge_id = c.challenge_id
LEFT JOIN difficulty d ON d.difficulty_level = c.difficulty_level
WHERE s.score = d.score 
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id ASC;
-- NEED TO LEFT JOIN HACKERS TO SUBMISSIONS FIRST (FOR ALL THE CHALLENGE SUBMISSIONS FOR EACH HACKER
-- THEN TO CHALLENGES, we need this table to create a link between submissions & difficulty
-- WE NEED DIFFICULTY TO MATCH SUB SCORE TO DIFF SCORE (IF MATCH THEN SUBMISSION AT FULL SCORE)
-- WE GROUP BY HACKER_ID AND NAME AS USING AGGREGATE
-- HAVING NEEDED AS CANNOT INC > 1 CONDITION IN WHERE CLAUSE
-- ORDER BY CONDITIONS ALSO MET