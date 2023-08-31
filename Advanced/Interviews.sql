-- output:
-- contest_id
-- hacker_id
-- name
-- sum(total_submissions)
-- sum(total_accepted_submissions)
-- sum(total_views)
-- sum(total_unique_views)

-- group by contest_id
-- sort by contest_id
-- exclude results if all 4 sums == 0
-- college -> contest = many to one

-- WITH statement allows us to make temp tables if we are making complex multitable queries
-- NOTE WORKS ON MS SQL Server not on MYSQL
WITH total_submit as (
SELECT  
    coll.contest_id,
    sum(ss.total_submissions) as sumts,
    sum(ss.total_accepted_submissions) as sumtas
FROM Colleges coll
INNER JOIN Challenges chall ON coll.college_id = chall.college_id
INNER JOIN Submission_Stats ss on chall.challenge_id = ss.challenge_id
GROUP BY coll.contest_id
),

total_view as (
SELECT  coll.contest_id,
        sum(vs.total_views) as sumtv,
        sum(vs.total_unique_views) as sumtuv
FROM Colleges coll
INNER JOIN Challenges chall ON coll.college_id = chall.college_id
INNER JOIN View_Stats vs ON chall.challenge_id = vs.challenge_id
GROUP BY coll.contest_id
)

SELECT  cont.contest_id, 
        cont.hacker_id, 
        cont.name,
        ts.sumts,
        ts.sumtas,
        tv.sumtv,
        tv.sumtuv
FROM Contests cont
INNER JOIN total_submit ts ON ts.contest_id = cont.contest_id
INNER JOIN total_view tv ON tv.contest_id = cont.contest_id
WHERE ts.sumts > 0
OR    ts.sumtas > 0
OR    tv.sumtv > 0
OR    tv.sumtuv > 0
ORDER BY cont.contest_id;

-- We have to use HAVING instead of where as the sums are aggregates
-- if we aggregate in the temp tables then bring them into the final table we can use the where clause & don't have to use group by