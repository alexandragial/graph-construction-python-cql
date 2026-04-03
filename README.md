## Overview

This repository contains the code and queries accompanying the manuscript.

It contains:

* Python scripts for data preprocessing and analysis
* Cypher queries for graph operations in Neo4j
---

## Repository Structure

```
project/
│── queries/             # Cypher query files (.cypher)
│── code/                # Python code
│── README.md
```

---

## Requirements

* Python 3.11+
* Neo4j 5.22+
* Section *Libraries* of the notebook installs and loads all required packages automatically

---

## Setup

1. Install and start Neo4j
2. Create a new Project
3. Add a Local DBMS and start the database
4. Set or note the database password when prompted
5. Open the database (default name: `neo4j`)

---

## Data Preprocessing (Python)

Run the preprocessing script to load and clean the dataset:

```
python3 code/data-preprocessing.ipynb
```

This will:

* Load the provided dataset
* Extract entities and relationships from the raw text using NLP techniques
* Generate CSV files formatted for import into Neo4j


---

## Cypher Queries

Cypher queries are stored in the `/queries` folder.

Example:

```cypher
// queries/text_to_trigrams_edge.cql
LOAD CSV WITH HEADERS FROM 'file:///trigram.csv' AS row
MATCH (t:Text {id: toInteger(row.index)})
MERGE (tg:Trigram {content: row.trigram})
MERGE (t)-[:HAS_TRIGRAM]->(tg);
```

To run the queries:

* **Using Neo4j Desktop**:

  * Open Neo4j Desktop
  * Start the Graph DBMS

* **Using Neo4j Browser**:

  * Connect to the Neo4j database
  * Log in and select the database (default: `neo4j`)

* Copy and paste the queries into the query editor and execute them


---

## Notes

* Ensure Neo4j is running before executing scripts
* Tested on Neo4j 5.22.0 and Python 3.12

---
