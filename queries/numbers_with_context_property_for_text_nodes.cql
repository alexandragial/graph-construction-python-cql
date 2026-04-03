LOAD CSV WITH HEADERS FROM 'file:///texts_with_properties.csv' AS row
WITH row, REPLACE(REPLACE(row.Numbers_With_Context, '), (', '],['), '(', '[') AS fixedNumbers
WITH row, REPLACE(fixedNumbers, ')', ']') AS numbers_with_context
MATCH (t:Text{id: toInteger(row.Index)})
SET t.numbers_with_context = numbers_with_context
