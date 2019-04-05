---
uid: Queries
---

 
 # Queries
A list of queries to select the data items to be displayed in the data view
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | True | Id of the query
Query | QueryBase | True | Query to use for data retrieval



 ## `Query` 
 The Query lets users define query parameters or build expressions to form queries using Or, And, and Not operators. It serves as the base for the different type of query operations available and can therefore be used recursively to form logical expressions as well as simple queries. To form a simple query, users would specify the parameters using the query properties. To form complex queries, the user can specify the Or, And, or Not operator to introduce a logical expression, and then proceed to build the query from that. See examples below. Whether building simple or complex queries, however, the expression needs to be concluded with query parameters.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Resource | QueryResource | True | Type of the resource used
Field | QueryField | True | Field within the resource to query against
Name | string | False | Name of the attribute within the field (Only applies when Field is an attribute)
Value | string | True | Value for field to use in query
Function | QueryFunction | True | Function to use in query



 ## `Resource` 
 The Resource can have the following values: 
Value | Type | Description
 --- | --- | ---
Streams | string | Query Streams
TypeProperties | string | Query Type Properties




 ## `Field` 
 The Field can have the following values: 
Value | Type | Description
 --- | --- | ---
Id | string | Query Id of resource
Name | string | Query Name of resource
Tag | string | Query Tag of resource
Description | string | Query Description of resource
TypeId | string | Query TypeId of resource
MetadataKey | string | Query MetadataKey of resource




 ## `Function` 
 The Function can have the following values: 
Value | Type | Description
 --- | --- | ---
Contains | string | Use Contains as query function
Equals | string | Use Equals as query function
EndsWith | string | Use EndsWith as query function
StartsWith | string | Use StartsWith as query function



## `Example` 
The first example shows a simple Queries object with a list of queries defined using only query parameters. The second example shows a Queries object with nested queries that creates a complex query. Notice how the Or, And, and Not operators can be used in place of the query parameters when building expressions. This way users can build complex queries, as long as the expression ends with parameters to conclude the query.
```json
[
  {
    "Id": "Query1",
    "Query": {
      "Resource": "Streams",
      "Field": "Id",
      "Name": "nameofQuery",
      "Value": "testStream1",
      "Function": "Equals"
    }
  },
  {
    "Id": "Query2",
    "Query": {
      "Resource": "Streams",
      "Field": "Id",
      "Name": null,
      "Value": "testStream2",
      "Function": "Contains"
    }
  }
]
``` 
```json
[
  {
    "Id": "NestedQueryWithOperators",
    "Query": {
      "Or": [
        {
          "And": [
            {
              "Resource": "Streams",
              "Field": "Id",
              "Name": null,
              "Value": "testStream1",
              "Function": "Contains"
            },
            {
              "Resource": "Streams",
              "Field": "Id",
              "Name": null,
              "Value": "testStream2",
              "Function": "Contains"
            }
          ]
        },
        {
          "Not": {
            "Resource": "Streams",
            "Field": "Description",
            "Name": null,
            "Value": "testStream3",
            "Function": "Contains"
          }
        }
      ]
    }
  }
]
``` 
