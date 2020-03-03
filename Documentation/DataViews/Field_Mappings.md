---
uid: DataViewsFieldMappings
---

# Field Mappings

A `FieldMapping` contains information on the source on every field of data in the data view. For each field in the data view, there is a corresponding `FieldMapping`. Within each field mapping, the list of `DataMapping`s shows the source of data for each group. There is one `DataMapping` per group, since the number of distinct data source for each field equals to the number of groups in the resolved data view. Inspecting the field mapping resource after defining the data view is a good way to confirm that the output data view does contain the data-of-interest prior to data generation.


## Interpreting Field Mapping
The number and order of field mappings is identical to the number and order of the resulting data view fields. 

### Id and label
The field mapping id represents the json property name (or column name in table or csv format) in the output data view data. The field mapping label represents the data view field label with tokens resolved. If all field mapping labels in a data view are unique, the field mapping id is identical to the label; if not, the id is generated from the label by adding an index number postfix. 

### Field set index and field index
The field set index and field index represents the zero-based positioning of the corresponding field set and field within the field set, respectively.

### Data Mapping
Data mappings represent the data source for each group.  

#### Index
`TargetId` and `TargetFieldKey` are not used for index fields. `TypeCode` is equivalent to the `IndexTypeCode` of the data view. 

#### Grouping Value
`TargetId` is the zero-based index of the corresponding grouping field. `TypeCode` is always `string`.

#### Data Item
`TargetId` represents the data item id. 
  * Id, name and tags: `TargetFieldKey` is empty
  * Metadata: `TargetFieldKey` shows the metadata key
  * Properties: `TargetFieldKey` shows the property id or property name path
