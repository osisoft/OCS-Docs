---
uid: GroupRules
---

 
 # GroupRules
The GroupRule lets users organize data items in the query, within or across streams, to form data groups in the resulting data set. By specifying the type to group on, users can retrieve organized data items to compare and better examine the results.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | True | Id of the rule
Type | GroupRuleType | False | Stream property to base grouping on
TokenRules | TokenRules | True | Token rules that create patterns to form groups



 ## `Type` 
 The Type can have the following values: 
Value | Type | Description
 --- | --- | ---
StreamId | string | Group on Stream ID
StreamName | string | Group on Stream Name
StreamTag | string | Group on Stream Tag
StreamMetadata | string | Group on Stream Metadata


## `Example` 
The following example shows a group rule definition that creates data groups based on state names defined in the stream metadata. It will result in a data group for every state, that will organize the data items accordingly in the result. By using this group rule as a group rule mapping rule (See [mappings](xref:Mappings)), the value of the state can be reflected in its own column in the result. Users can use different stream properties to create group rules, using tokens to define the values that they are interested in.
```json
[
  {
    "Id": "StateGroupRule",
    "Type": "StreamTag",
    "TokenRules": {
      "Tokens": [
        "Arizona",
        "Pennsylvania",
        "California"
      ],
      "Patterns": null
    }
  }
]
``` 
```json
An example output using this group rule as described above could look like the following: (See [mappings](xref:Mappings) for a description on how to create the columns).
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
