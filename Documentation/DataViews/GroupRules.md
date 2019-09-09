---
uid: GroupRules
---

 
 # GroupRules
The GroupRule lets users organize data items in the query, within or across streams, to form data groups in the resulting data set. By specifying the resource and field to group on, users can retrieve organized data items to compare and better examine the results.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | True | Id of the rule
Resource | GroupRuleResource | True | Resource to base grouping on
Field | GroupRuleField | True | Field to base grouping on
Values | [string] | False | Values that form groups



 ## `Resource` 
 The Resource can have the following values: 

Value | Type | Description
 --- | --- | ---
Streams | string | Group on streams resource




 ## `Field` 
 The Field can have the following values: 

Value | Type | Description
 --- | --- | ---
Id | string | Group on Id
Name | string | Group on Name
Tag | string | Group on Tag
Metadata | string | Group on Metadata


## `Example` 
The following example shows a group rule definition that creates data groups based on state names defined in the stream metadata. It will result in a data group for every state, that will organize the data items accordingly in the result. By using this group rule as a group rule mapping rule (See [mappings](xref:Mappings)), the value of the state can be reflected in its own column in the result. Users can use different stream properties to create group rules, using values to define the values that they are interested in.
```json
[
  {
    "Id": "StateGroupRule",
    "Resource": "Streams",
    "Field": "Tag",
    "Values": [
      "Arizona",
      "Pennsylvania",
      "California"
    ]
  }
]
``` 
```json
An example output using this group rule as described above could look like the following:
``` 
```json

[
    {
        "Timestamp": "2018-10-03T03:00:00Z",
        "State": "Pennsylvania",
        "FlowRate": "2",
        "Temperature": "5",
        "Volume": "100"
    },
    {
        "Timestamp": "2018-10-03T03:00:00Z",
        "State": "California",
        "FlowRate": "44",
        "Temperature": "24.44",
        "Volume": "245.12"
    },
    {
        "Timestamp": "2018-10-03T03:00:00Z",
        "State": "Arizona",
        "FlowRate": "42",
        "Temperature": "25.223",
        "Volume": "247.5"
    },
]
``` 
