LOAD CSV WITH HEADERS FROM 'file:///trigram.csv' AS row
MATCH (t:Text {id: toInteger(row.index)})
MERGE (tg:Trigram {content: row.trigram})
MERGE (t)-[:HAS_TRIGRAM]->(tg);