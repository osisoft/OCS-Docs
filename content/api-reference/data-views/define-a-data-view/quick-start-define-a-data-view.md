---
uid: DataViewsQuickStartDefine
---

# Define a data view
The `DataView` object is a declarative query and shape for OCS data. This section describes the `DataView` object. See the [Data View API section](xref:DataViewAPI) for the corresponding API routes.

At times, this section makes reference to ways the view *resolves* into further resources, such as the collection of data items found by each data item query. See the [Resolved Data View](xref:ResolvedDataView) and [Resolved Data View API](xref:ResolvedDataViewAPI) sections for details.

## General concepts
You define multiple aspects of a data view when you define it, including data items and their organization, grouping, and shaping. 

### Define a data view identifier
A data view must have a unique identifier. It may have a friendly name and description. If a friendly name is not specified, the identifier will be used as the data view's name.

### Include data items
One or more queries determine the set of data items (such as streams and assets) that the data view will include. Each [Query](xref:DataViewsQueries) should represent a collection of like data items. Use separate queries to include data items that represent very different items, such as power inverters and weather stations.

### Include data fields

Information from, or about, those data items must be included explicitly in the data view as Fields within [DataFields](xref:DataViewsFieldSets) or [GroupingFields](xref:DataViewsGrouping). By default, a data view includes no fields, except the default [IndexField](#include-the-index-field).

The fields that are available for use are exposed as a "resolved" resource, [Available Field Sets](xref:DataViewsAvailableFieldSets). It is recommended to use or adapt those fields instead of defining new fields. Individual fields are organized into [DataFieldSets](xref:DataViewsFieldSets) and [GroupingFields](xref:DataViewsGrouping).

### Group the data items

Data items may be [grouped](xref:DataViewsGrouping), which amounts to grouping or partitioning them by one or more field values. To group data items in a data view, define one or more fields as `.GroupingFields` of the data view. This is one way of producing a meaningful, consumable shape of data.

### Organize the data fields
Field sets and fields resolve in the order they are defined. They may be re-ordered.

Within each group, a field set may be associated with multiple data items. It is often necessary to disambiguate these items. If a group contains multiple data items from the same query, you may wish to identify those data items so that they are not ambiguous and so they will be aligned across groups. Items can be disambiguated by specifying an [`.IdentifyingField`](xref:DataViewsFieldSets#identifying-field). An identifying field is a field that differentiates the data items within a group, such as the value of _Measurement_ metadata (i.e., the data items are identified by what they measure). Identifying data items also allows the data views engine to "align" them across groups, since it is clear, for example, that streams measuring _Power Out_ and streams measuring _Power In_ are alike. Ensure that each data field's label includes the {IdentifyingValue} token so the field labels are unique. The default field labels already include it.

### Include the index field
The field used for indexing.  If not specified, a default value with a label of "Timestamp" is applied. If specified, a label is required. Field source and keys are not applicable for index field.

### Define index type and default range
Data views currently operate on timestamped data, which is data indexed by a DateTime property. This is reflected by the `.IndexTypeCode` of the DataView, whose value must be "DateTime". Default values may be defined for the start index, end index, and/or interval used when data view data is queried.

### Define data view shape
Data views may be set to resolve as standard shape or narrow shape. Standard shape resolves fields similar to how they are defined. Narrow shape pivots the fields vertically, resulting in a view whose schema is independent of what data items are resolved by the data view. Narrow shape may be used when an invariant output schema is required.

## Data view properties
The following table lists the properties of a `DataView`:

| Property |Type    |Optionality  | Default | Details  |
|----------|--------|-------------|---------|----------|
| Id       | string | Required |  | Unique indentifier
| Name | string | Optional | value of Id | Friendly name
| Description | string | Optional  | null | Longer description of the view
| IndexField | Field | Optional | { Label:"Timestamp" } | The field used for indexing.  If unspecified a field labeled "Timestamp" is included.
| Queries | Query[] | Optional | [ ] | Queries for OCS resources (such as streams and assets) to include in the view. This is the starting point when defining a data view. Each Query should represent a collection of like data items. To include data items that represent very different items (e.g. solar inverters and weather), use separate queries.
| DataFieldSets | FieldSet[] | Optional | [ ] | The sets of fields included in the data view. Often copied or adapted from the view's available field sets, which are exposed in a resolved resource.
| GroupingFields | Field[] | Optional | [ ] | Fields by which the data items are partitioned/grouped.
| DefaultStartIndex | string | Optional | null | The default value of StartIndex used when querying the data view data if none is specified.
| DefaultEndIndex | string | Optional | null | The default value of EndIndex used when querying the data view data if none is specified.
| DefaultInterval | string | Optional | null | The default value of Interval used when querying the data view data if none is specified.
| IndexTypeCode | SdsTypeCode | Optional | DateTime | The name of the index data type. DateTime is the currently supported index type.
| Shape | DataViewShape | Optional | Standard | Data views may be set to resolve as standard shape or narrow shape. Narrow shape may be used when an invariant output schema is required.

### Rules for Id property
- Is not case sensitive, but case is preserved
- Can contain spaces
- Cannot contain forward slash ("/")
- Can contain a maximum of 100 characters

## Related object types
The following sections describe the classes and enumerations used when defining data views.

### Query
A query for OCS resources to include in the view.
|Property| Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| Id  | string | Required |  | Unique identifier. Used by FieldSet to link to the query's results. |
| Kind  | DataItemResourceType | Optional | Stream | Type of resource to be queried. |
| Value | string | Optional | null | A query for OCS resources in the corresponding query syntax. For example, a query for streams must be in SDS query syntax. A null or empty query will not match any data items.

### DataItemResourceType enumeration
The `DataItemResourceType` enumeration specifies the OCS resource type included in the data view query.

| Name | Enumeration Id | Details |
|--|--|--|--|
| Stream | 1 | [SDS streams](xref:sdsStreams)
| Asset | 2 | [Assets](xref:AssetsProperties)

### FieldSet
A set of fields included in the data view, sharing a common role and query. One `DataView` is likely to include one `FieldSet` per query.
|Property | Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| QueryId | string | Required | | Must correspond to a query defined in the data view. 
| DataFields | Field[] | Optional | [ ] | Data fields to include in the data view. Often copied or adapted from the view's available field sets, which are exposed in a resolved resource.
| IdentifyingField | Field | Optional | null | A field by which to tell the data items apart, within each group. Any field from field sources `FieldSource.Id`, `FieldSource.Name`, `FieldSource.Metadata` and `FieldSource.Tags` can be used as an identifying field.

### Field
An individual piece of information, such as a property of an SDS stream, an asset stream reference, or metadata of that stream or asset.
All sources except `FieldSource.NotApplicable` can be used as data fields. Fields from sources `FieldSource.Id`, `FieldSource.Name`, `FieldSource.Metadata` and `FieldSource.Tags` can be used as grouping fields and identifying fields. Some sources are used in conjunction with the Keys property (see below).
|Property | Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| Source | FieldSource | Optional | NotApplicable | Identifies the `.Source` of the field's values (not applicable for an index field). See the FieldSource enumeration section in this topic for details.
| Keys | String[] | Optional | [ ] | Used for sources `FieldSource.PropertyId`, `FieldSource.PropertyName`, `FieldSource.Metadata` and `FieldSource.Tags`, e.g. to map to specific data item properties by id. If more than one key is specified, they are matched as exclusive-or. A key has to be a non-null value.
| StreamReferenceNames | String[] | Optional | [ ] | Identifies the stream reference name when referencing an asset property. `StreamReferenceNames` only applies to source `FieldSource.PropertyId`. If more than one key is specified, they are matched as exclusive-or. A key has to be a non-null value.
| Label | string | Optional | null | Friendly name for the field. Certain tokens have special meaning: one of these, {IdentifyingValue}, is included in the suggested labels of AvailableFieldSets. Tokens that do not resolve are "" (empty string). The label is required in a field for all usages except in an identifying field. Label is trimmed of whitespace when used to identify field mappings. 
| IncludeUom | bool | Optional | false | Specifies whether to include the unit of measure for this field as an additional field mapping in the resolved data view.

### FieldSource enumeration
For fields that derive data from a data item (e.g. a stream or asset), the `FieldSource` enumeration specifies the part of that data item that a Field resolves to. Some sources require one or more `.Keys` to be specified on the field, such as `PropertyId`, in which a key is the id of a desired property.

|Name | Enumeration Id | Keyed | Details |
|--|--|--|--|
|NotApplicable | 0 | No | FieldSource is not applicable for an index field
|Id | 1 | No | The id of the data item
|Name | 2 | No | The name of the data item
|PropertyId | 3 | Yes | Data from a property, found by id
|PropertyName | 4 | Yes | Data from a property, found by name
|Metadata | 5 | Yes | Value of the data item metadata, found by key
|Tags | 6 | Yes | Data item tags matching the collection provided

### SdsTypeCode enumeration
`SdsTypeCode` enumeration is the name of a data type. It is used when defining a data view, where the only supported `.IndexTypeCode` is "DateTime".

See [SdsTypeCode](xref:sdsTypes#sdstypecode) for details.

### DataViewShape enumeration
`DataViewShape` enumeration describes possible output shapes for a data view.
|Name| Enumeration Id | Details  |
|--|--|--|
|Standard | 0 | Fields are resolved into a shape similar to how they were defined. This is the recommended shape unless specific needs dictate.
|Narrow | 1 | Fields are pivoted vertically, resulting in a view whose schema is independent of what data items are resolved by the data view.
