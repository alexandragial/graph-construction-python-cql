LOAD CSV WITH HEADERS FROM 'file:///keyword_to_topic.csv' AS row
MATCH (kw:Keyword {word: row.Keyword})
MERGE (tp:Topic {topicid: toInteger(row.Topic)})
MERGE (kw)-[:BELONGS_TO{weight: toFloat(row.Weight)}]->(tp);
