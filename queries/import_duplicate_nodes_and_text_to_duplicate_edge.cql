LOAD CSV WITH HEADERS FROM 'file:///texts_with_properties.csv' AS row
WITH row, apoc.convert.fromJsonMap(row.Duplicates) AS dupl
MATCH (t:Text {id: toInteger(row.Index)})
FOREACH (key IN keys(dupl) |
  MERGE (dpl:Duplicate {key: key})
  MERGE (t)-[:HAS_DUPLICATE {value: dupl[key]}]->(dpl)
)
