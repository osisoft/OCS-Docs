---
uid: DataViewsFieldMappings
---

# View field mappings

A `FieldMapping` contains information on the source on every field of data in the data view. Field mappings are part of a resolved data view that describe which data items will map to specific fields. Each field mapping can report the field kind (index, group, data, or field id) of the field as well as information on how it is mapped via its data mapping. For each field in the data view, there is a corresponding `FieldMapping`. Inspecting the field mapping resource after defining the data view is a good way to confirm that the output data view does contain the data-of-interest prior to data generation.

Within each field mapping, the list of `DataMapping`s shows the source of data for each group. There is one `DataMapping` per group, since the number of distinct data sources for each field equals the number of groups in the resolved data view. The order of the data mappings corresponds to the order of the groups as seen from [Get Groups](xref:ResolvedDataViewAPI#get-groups). If a field does not resolve for a specific group, then the data mapping will be empty. Empty data mappings have a `TypeCode` of `Empty`. See below for more details in `TypeCode`.

## Ordering
The first field mapping contains information for the index field. Next, field mappings are appended for each `GroupingField` in the data view. If there is more than one `GroupingField`, the order of the field mappings corresponds to the order of the `GroupingField`s in the data view.

Following the index and grouping field mappings are the data field mappings. Data field mappings are different depending on the data view [shape](xref:DataViewShape).

### Standard
For standard shape data views, the order of the field mappings reflects the order of the data fields in the data view. The first data field mappings are created for the first `DataFieldSet` `DataField`. Then field mappings are created for each subsequent `DataField` in the order they appear in the data view. If the data view contains more than one `DataFieldSet`, then the subsequent `DataFieldSet` `DataField`s will be added after the first `DataFieldSet` and following the same pattern.

### Narrow
Narrow shape data views have a fixed field mapping shape. There are only two data field mappings, the Field field mapping, which contains the field identifiers, and the Value field mapping, which contains the field values.

## Interpreting field mapping
The number and order of field mappings is identical to the number and order of the resulting data view fields. 

### Id and label
The field mapping id represents the JSON property name (or column name in table or csv format) in the output data view data. The field mapping label represents the data view field label with tokens resolved. If all field mapping labels in a data view are unique, the field mapping id is identical to the label; if not, the id is generated from the label by adding an index number postfix. 

### Field kind
The `FieldKind` specifies whether the field maps to an index field, grouping field, data field, or field id field. Not all `DataMapping` properties apply to each `FieldKind`.

#### Index field
Fields of kind `IndexField` map to the data view's [index field](xref:DataViewsQuickStartDefine#include-the-index-field).

| DataMapping Property | Details |
|--|--|
| TargetId | Not applicable |
| TargetStreamReferenceName *(coming soon)* | Not applicable |
| TargetFieldKey | Not applicable |
| TypeCode | Equivalent to the `IndexTypeCode` of the data view |
| SummaryType *(coming soon)* | Not applicable|
| Uom *(coming soon)* | Not applicable |
| FieldSetIndex | Not applicable |
| FieldIndex | Not applicable |

#### Grouping field
Fields of kind `GroupingField` map to a [grouping field](xref:DataViewsGrouping) on the data view.

| DataMapping Property | Details |
|--|--|
| TargetId | The group's value |
| TargetStreamReferenceName *(coming soon)* | Not applicable |
| TargetFieldKey | Not applicable |
| TypeCode | The group's data type |
| SummaryType *(coming soon)* | Not applicable|
| Uom *(coming soon)* | The unit of measure id for the grouping field |
| FieldSetIndex | Not applicable |
| FieldIndex | The zero-based positioning of the field within the data view's grouping fields |

#### Data field
Fields of kind `DataField` map to a [data field](xref:DataViewsFieldSets) on the data view.

| DataMapping Property | Details |
|--|--|
| TargetId | The data item id |
| TargetStreamReferenceName *(coming soon)* | The name of the asset stream reference. Only applicable to `PropertyId` fields and when the data field references an asset property. |
| TargetFieldKey | The metadata name (`Metadata` fields), property id (`PropertyId` fields), or property name (`PropertyName` fields). Not applicable to `Id`, `Name`, or `Tags` fields. |
| TypeCode | The data item's data type |
| SummaryType *(coming soon)* | The summary type calculation for the data field. Applicable to 'PropertyId' and 'PropertyName' fields only. |
| SummaryDirection *(coming soon)* | SummaryDirection controls whether the start or end index of the summary is used by the data view to calculate the summary values. |
| Uom *(coming soon)*| The unit of measure id for the data field |
| FieldSetIndex | The zero-based positioning of the data field set |
| FieldIndex | The zero-based positioning of the data field within the appropriate data field set |

#### Field id field
The field id field only applies to data views with [narrow shape](xref:DataViewShape#narrow-shape). The `FieldId` field maps to the field column.

| DataMapping Property | Details |
|--|--|
| TargetId | The data item id |
| TargetStreamReferenceName *(coming soon)* | Not applicable |
| TargetFieldKey | Not applicable |
| TypeCode | String |
| SummaryType *(coming soon)* | Not applicable|
| Uom *(coming soon)* | Not applicable |
| FieldSetIndex | The zero-based positioning of the data field set |
| FieldIndex | The zero-based positioning of the data field within the appropriate data field set |

### Type code
The `TypeCode` is the primary data type of the field mapping. This value comes from the field mapping's first populated `DataMapping`. The field mapping `TypeCode` is informational; it is not enforced.
