SELECT Name FROM STUDENTS 
WHERE MARKS > 75
ORDER BY RIGHT(Name, 3), ID ASC;
-- right takes two arg(col, no_of_char), secondary sort is as simple as comma seperating the sorts you want :)