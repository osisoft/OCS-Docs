---
uid: Mappings
---

 
 # Mappings
The Mappings object lets users define the columns in the resulting data set by specifying their name and properties, as well as create shared mapping rules that can be used throughout all columns of the data view. By using default mappings, all properties of the query will be mapped to their own column, generated on data item retrieval. If the mappings are defined in the data view definition they will be persisted over time, and might need to be updated accordingly should a change occur in the data source.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
SharedMappingRules | [SharedMappingRule] | False | Rules shared across mappings
Columns | [ColumnDefinition] | True | Columns in your data view
IsDefault | bool | False | Determines whether default parameters should be used



 ## `SharedMappingRules` 
 Used to define rules using a token and a pattern that can then be applied to one or many columns that share similar behavior. With the token property, users can specify a certain value that will differentiate the columns that adhere to the defined pattern. See examples below.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | True | Id of the mapping rule
Token | string | True | Shared mapping rule token
MappingRulePattern | PropertyMappingRule | True | Data source identifier



 ## `MappingRulePattern` 
 Used to map a column to a data source by defining the paths to the property that the user wants to select, and an identifier to the resource of the property.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
PropertyPaths | [string] | True | Paths to property
ItemIdentifier | QueryBase | False | Identifier for the resource that contain the property used





 ## `Columns` 
 The Column lets users specify the name and properties of a column in the resulting data set. Using the mapping rule object, users can decide what type of data mapping the column is using.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Name | string | True | Name to be displayed for the column
MappingRule | MappingRule | True | Mapping to the data source
IsKey | optional: bool | True | Column is the key column (Optional once key column is defined)
DataType | string | False | Type of the mapped data source



## `MappingRule` 
 The MappingRule can be used in the following forms 
 # [GroupRuleMappingRule](#tab/tabid-1) 
Used to map a column to a group rule by specifying the Id of the rule, and a token defined in the group rule to identify what pattern to use.

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
GroupRuleId | string | True | Id of the group rule to use as mapping rule
GroupRuleToken | string | True | Token to use in the specified group rule


# [LinkedMappingRule](#tab/tabid-2) 
Used when mapping a column to a shared mapping rule, using the token to define the value to be used for the token property of the rule.

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
SharedMappingRuleId | string | True | Id of the shared mapping rule to use
Token | string | True | Token to use in the specified mapping rule


# [PropertyMappingRule](#tab/tabid-3) 
Used to map a column to a data source by defining the paths to the property that the user wants to select, and an identifier to the resource of the property.

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
PropertyPaths | [string] | True | Paths to property
ItemIdentifier | QueryBase | False | Identifier for the resource that contain the property used


***


## `Example` 
The following examples show different definitions of the Mappings object. The first example is the simplest way to define mappings by using the default. The second example shows a mapping with one column defined, using a property mapping rule to define the property paths while leaving the item identifier undefined. This is accepted as long as the specified paths do not lead to an ambiguous result, and would in such case require the user to include an item identifier to further specify their rule. Since only one column is defined, it is required to define it as the key column. 

The last example uses a shared mapping rule with a token to match the property path, and the item identifier including every stream with TankStream as its description. It also uses the group rule defined in the [Group Rules](xref:Mappings) page to create data groups based on the states of the data source. The FlowRate and Temperature columns are defined with the shared mapping rule, using the token to specify their property path. The Volume column is an example of explicitly defining the property mapping rule in the column definition. This is done to demonstrate the difference and the result would be identical using the shared rule and a token, as the previous columns do.
```json
{
  "SharedMappingRules": null,
  "Columns": [],
  "IsDefault": true
}
``` 
```json
{
  "SharedMappingRules": null,
  "Columns": [
    {
      "Name": "column1",
      "MappingRule": {
        "PropertyPaths": [
          "path"
        ],
        "ItemIdentifier": null
      },
      "IsKey": true,
      "DataType": null
    }
  ]
}
``` 
```json
{
  "SharedMappingRules": [
    {
      "Id": "shared_mapping_rule",
      "Token": "{type_property}",
      "MappingRulePattern": {
        "PropertyPaths": [
          "{type_property}"
        ],
        "ItemIdentifier": {
          "Resource": "Streams",
          "Field": "Description",
          "Name": null,
          "Value": "TankStream",
          "Function": "Equals"
        }
      }
    }
  ],
  "Columns": [
    {
      "Name": "keyColumn",
      "MappingRule": {
        "PropertyPaths": [
          "path"
        ],
        "ItemIdentifier": null
      },
      "IsKey": true,
      "DataType": "DateTime"
    },
    {
      "Name": "State",
      "MappingRule": {
        "GroupRuleId": "StateGroupRule",
        "GroupRuleToken": null
      },
      "IsKey": false,
      "DataType": "string"
    },
    {
      "Name": "FlowRate",
      "MappingRule": {
        "SharedMappingRuleId": "shared_mapping_rule",
        "Token": "{FlowRate}"
      },
      "IsKey": false,
      "DataType": null
    },
    {
      "Name": "Temperature",
      "MappingRule": {
        "SharedMappingRuleId": "shared_mapping_rule",
        "Token": "{Temperature}"
      },
      "IsKey": false,
      "DataType": null
    },
    {
      "Name": "Volume",
      "MappingRule": {
        "PropertyPaths": [
          "Volume"
        ],
        "ItemIdentifier": {
          "Resource": "Streams",
          "Field": "Description",
          "Name": null,
          "Value": "TankStream",
          "Function": "Equals"
        }
      },
      "IsKey": false,
      "DataType": null
    }
  ]
}
``` 
