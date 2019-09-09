---
uid: Queries
---

 
 # Queries
A list of queries to select the data items to be displayed in the Data View
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | True | Id of the query
Query | string | True | Query to use for data retrieval

## `Example` 
The first example shows a simple Queries object with a list of queries defined using strings. The second example shows a Queries object with a complex query string. Notice how the OR, AND, and NOT operators can be used to build complex expressions. Queries support all of the operators supported by [Sequential Data Store](..\SequentialDataStore\Searching.md). This way users can build complex queries with the same search strings used to find a desired set of streams.
```json
[
  {
    "Id": "Query1",
    "Query": "id:testStream1"
  },
  {
    "Id": "Query2",
    "Query": "id:*testStream2*"
  }
]
``` 
```json
[
  {
    "Id": "QueryWithOperators",
    "Query": "(id:*testStream1* and id;*testStream2*) or (not description:*testStream3*)"
  }
]
``` 
