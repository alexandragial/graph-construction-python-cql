LOAD CSV WITH HEADERS FROM 'file:///texts_with_properties.csv' AS row
CREATE (t:Text {id: toInteger(row.Index), 
text: row.Lemm_Cleaned_Email, 
url_exists: toInteger(row.Url_Exists),
urls: apoc.convert.fromJsonList(replace(row.Urls, "'", "\"")),
length: toInteger(row.Length), 
special_chars: apoc.convert.fromJsonList(row.Special_Characters),
uppercase_percentage: round(toFloat(row.Per_Email_Uppercase_Percentage) * 100) / 100.0,
huge_words_exist: toInteger(row.Huge_Word_Exists)});
