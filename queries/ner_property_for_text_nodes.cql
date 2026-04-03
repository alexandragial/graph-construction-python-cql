LOAD CSV WITH HEADERS FROM 'file:///texts_with_properties.csv' AS row
WITH row, REPLACE(REPLACE(row.NER_Clean_Results, '), (', '],['), '(', '[') AS fixedNer
WITH row, REPLACE(fixedNer, ')', ']') AS ner
MATCH (t:Text {id: toInteger(row.Index)})
SET t.ner = ner
