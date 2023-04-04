SELECT N, 
CASE 
WHEN P IS NULL THEN 'Root'
WHEN N IN (Select P From BST) THEN 'Inner'
ELSE 'Leaf'
END as p
From BST Order By N;

-- utilise case statement here, 
-- if the nodes parent is null it is the root,
-- if the node is in parent column then it is inner as the node itself is the parent of another node
-- if the node isnt in the parent column then it is a bottom node/ leaf node