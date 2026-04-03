LOAD CSV WITH HEADERS FROM 'file:///trigram_to_bigram.csv' AS row
MATCH (tg:Trigram {content: row.trigram})
MERGE (bg:Bigram {content: row.bigram})
MERGE (tg)-[:HAS_BIGRAM]->(bg);