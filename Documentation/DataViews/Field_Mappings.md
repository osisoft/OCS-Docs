---
uid: DataViewsFieldMappings
---

# Field Mappings

A `FieldMapping` contains information on the source on every field of data in the data view. For each field in the data view, there is a corresponding `FieldMapping`. Within each field mapping, the list of `DataMapping`s show the source of data for each group. There is one `DataMapping` per group, since the number of distinct data sources for each field equals the number of groups in the resolved data view. Inspecting the field mapping resource after defining the data view is a good way to confirm that the output data view does contain the data-of-interest prior to data generation.


## Interpreting Field Mapping
The number and order of field mappings is identical to the number and order of the resulting data view fields. 

### Id and label
The field mapping id represents the json property name (or column name in table or csv format) in the output data view data. The field mapping label represents the data view field label with tokens resolved. If all field mapping labels in a data view are unique, the field mapping id is identical to the label; if not, the id is generated from the label by adding an index number postfix. 

### Field kind
The `FieldKind` specifies whether the field maps to an index field, grouping field, data field, or field id field.

#### Index field
`TargetId`, `TargetFieldKey`, `FieldSetIndex` and `FieldIndex` are not used for index fields. `TypeCode` is equivalent to the `IndexTypeCode` of the data view. 

#### Grouping field
`FieldSetIndex` and `TargetFieldKey` are not used. `FieldIndex` is the zero-based positioning of the field within the grouping field. `TargetId` represents the value of the item in the grouping field.

#### Data field
`FieldSetIndex` is the zero-based positioning of the data field set. `FieldIndex` is the zero-based positioning of the data field within the appropriate data field set. `TargetId` represents the data item id.
  * Id, name and tags: `TargetFieldKey` is empty
  * Metadata: `TargetFieldKey` shows the metadata key
  * Properties: `TargetFieldKey` shows the property id or property name path

#### Field id field
`TargetFieldKey` is not used. `TargetId` represents the data item id, `FieldSetIndex` is the zero-based positioning of the data field set, and `FieldIndex` is the zero-based positioning of the data field within the appropriate data field set.

### Type code
The `TypeCode` is the primary data type of the field mapping. This value comes from the field mapping's first populated `DataMapping`. The field mapping `TypeCode` is informational; it is not enforced.
