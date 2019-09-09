---
uid: Mappings
---

 
 # Mappings
The Mappings object lets users define the columns in the resulting data set by specifying their name and properties, as well as create shared mapping rules that can be used throughout all columns of the Data View. By using default mappings, all properties of the query will be mapped to their own column, generated on data item retrieval. If the mappings are defined in the Data View definition they will be persisted over time, and might need to be updated accordingly should a change occur in the data source.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
TimeOfResolution | optional: DateTimeOffset | False | Time when the data view instance was resolved
SharedMappingRules | [SharedMappingRule] | False | Rules shared across mappings
Columns | [Column] | False | Columns in your Data View



 ## `SharedMappingRules` 
 The SharedMappingRule is used to define rules using a value and a pattern that can then be applied to one or many columns that share similar behavior. With the pattern property, users can specify a certain value that will differentiate the columns that adhere to the defined mapping rule pattern. See examples below.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | True | Id of the mapping rule
Pattern | string | True | Shared mapping rule pattern
MappingRule | PropertyMappingRule | True | Data source identifier



 ## `MappingRule` 
 The PropertyMappingRule is used to map a column to a data source by defining the paths to the property that the user wants to select, and an identifier to the resource of the property.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
PropertyPaths | [string] | True | Paths to property
ItemIdentifier | FilterUnit | False | Identifier for the resource that contains the property used



 ## `ItemIdentifier` 
 The FilterUnit identifies the property that the user wants to select with a [PropertyMappingRule](#mappingrule).
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Resource | FilterResource | True | Type of the resource used
Field | FilterField | True | Field within the resource to query against
Name | string | False | Name of the attribute within the field (Only applies when Field is an attribute)
Value | string | True | Value for field to use in query



 ## `Resource` 
 The Resource can have the following values: 

Value | Type | Description
 --- | --- | ---
Streams | string | Streams
TypeProperties | string | Type Properties




 ## `Field` 
 The Field can have the following values: 

Value | Type | Description
 --- | --- | ---
Id | string | Id of resource
Name | string | Name of resource
Tag | string | Tag of resource
Description | string | Description of resource
TypeId | string | TypeId of resource
MetadataKey | string | MetadataKey of resource







 ## `Columns` 
 The Column lets users specify the name and properties of a column in the resulting data set. Using the mapping rule object, users can decide what type of data mapping the column is using.
### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Name | string | True | Name to be displayed for the column
MappingRule | MappingRule | True | Mapping to the data source
IsKey | optional: bool | False | Column is the key column (Optional once key column is defined)
DataType | string | False | Type of the mapped data source



## `MappingRule` 
 The MappingRule can be used in the following forms 
 # [GroupRuleMappingRule](#tab/tabid-1) 
The GroupRuleMappingRule is used to map a column to a group rule by specifying the Id of the rule, and a group rule value defined in the group rule to identify what pattern to use.

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
GroupRuleId | string | True | Id of the group rule to use as mapping rule
GroupRuleValue | string | False | Group rule value to use in the specified group rule


# [LinkedMappingRule](#tab/tabid-2) 
The LinkedMappingRule is used when mapping a column to a shared mapping rule, using the value property to define the value to be used for the pattern property of the rule.

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
SharedMappingRuleId | string | True | Id of the shared mapping rule to use
Value | string | True | Value to use in the specified mapping rule


# [PropertyMappingRule](#tab/tabid-3) 
The PropertyMappingRule is used to map a column to a data source by defining the paths to the property that the user wants to select, and an identifier to the resource of the property.

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
PropertyPaths | [string] | True | Paths to property
ItemIdentifier | FilterUnit | False | Identifier for the resource that contains the property used


***


## `Example` 
The following examples show different definitions of the Mappings object. The first example shows a mapping with one column defined, using a property mapping rule to define the property paths while leaving the item identifier undefined. This is accepted as long as the specified paths do not lead to an ambiguous result, and would in such case require the user to include an item identifier to further specify their rule. Since only one column is defined, it is required to define it as the key column. 

The second example uses a shared mapping rule with a pattern to match the property path and the item identifier, including every stream with TankStream as its description. It also uses the group rule defined in the [Group Rules](xref:GroupRules) page to create data groups based on the states of the data source. The FlowRate and Temperature columns are defined with the shared mapping rule, using the value to specify their property path. The Volume column is an example of explicitly defining the property mapping rule in the column definition. This is done to demonstrate the difference and the result would be identical, using the shared rule and a value as the previous columns do.
```json
{
  "Columns": [
    {
      "Name": "column1",
      "MappingRule": {
        "PropertyPaths": [
          "path"
        ]
      },
      "IsKey": true
    }
  ]
}
``` 
```json
{
  "SharedMappingRules": [
    {
      "Id": "shared_mapping_rule",
      "Pattern": "{type_property}",
      "MappingRule": {
        "PropertyPaths": [
          "{type_property}"
        ],
        "ItemIdentifier": {
          "Resource": "Streams",
          "Field": "Description",
          "Value": "TankStream"
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
        ]
      },
      "IsKey": true,
      "DataType": "DateTime"
    },
    {
      "Name": "State",
      "MappingRule": {
        "GroupRuleId": "StateGroupRule"
      },
      "IsKey": false,
      "DataType": "string"
    },
    {
      "Name": "FlowRate",
      "MappingRule": {
        "SharedMappingRuleId": "shared_mapping_rule",
        "Value": "{FlowRate}"
      },
      "IsKey": false
    },
    {
      "Name": "Temperature",
      "MappingRule": {
        "SharedMappingRuleId": "shared_mapping_rule",
        "Value": "{Temperature}"
      },
      "IsKey": false
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
          "Value": "TankStream"
        }
      },
      "IsKey": false
    }
  ]
}
``` 
