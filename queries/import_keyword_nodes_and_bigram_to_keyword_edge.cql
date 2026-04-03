LOAD CSV WITH HEADERS FROM 'file:///bigram_to_keyword.csv' AS row
MERGE (kw:Keyword {word: row.keyword})
MERGE (bg:Bigram {content: row.bigram})
MERGE (bg)-[:HAS_KEYWORD]->(kw)
