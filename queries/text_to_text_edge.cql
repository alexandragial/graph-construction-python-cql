LOAD CSV WITH HEADERS FROM 'file:///common_words.csv' AS row 
MATCH (t1:Text {id: toInteger(row.email1_id)}) 
MATCH (t2:Text {id: toInteger(row.email2_id)}) 
CREATE (t1)-[:COMMON_WORDS {count: toInteger(row.common_words)}]->(t2)