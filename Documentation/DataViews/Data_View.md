---
uid: DataView
---

# Data View

The `DataView` object is a declarative query and shape for stream data. This section describes the `DataView` object. For the corresponding API routes, see [API documentation](xref:DataViewAPI).  

At times, this section makes reference to ways the view *resolves* into further resources, such as the collection of data items found by each data item query. See the documentation of [resolved resources](xref:ResolvedDataView) for details.


## General concepts

### Identification
A DataView must have a unique identifier. It may have a friendly name and description. If a friendly name is not specified, the identifier will be used as the data view's name.

### Including data items
One or more queries determine the set of data items (such as SDS streams) that the data view will include. Each [Query](xref:DataViewsQueries) should represent a collection of like streams. To include streams that represent very different items, such as power inverters and weather stations, use separate queries.

### Including data fields

Information from, or about, those data items must be included explicitly in the data view as [Field](xref:DataViewsFieldSets)s. By default, a data view includes no fields. The fields that are available for use are exposed as a "resolved" resource (AvailableFieldSets). It is recommended to use or adapt those fields instead of defining fields from scratch.

Individual fields are organized into [FieldSets](xref:DataViewsFieldSets). Each field set has a  `.SourceType` that defines its role:
- FieldSetSourceType.**Index** - Provides the index field for the data view. A data view may have only one Index field set
- FieldSetSourceType.**SectionerValue** - Displays values that the view is sectioned by
- FieldSetSourceType.**DataItem** - Resolves for each data item from a particular query

### Organizing the data items

Data items may be [sectioned](xref:DataViewsSectioning), which amounts to grouping or partitioning them by one or more field values. This is one way of producing a meaningful, consumable shape of data.

### Organizing the data fields
Field sets and fields resolve in the order they are defined. They may be re-ordered.

Within each section, a field set may be associated with multiple data items. It is often necessary to disambiguate these items. Items can be disambiguated by specifying a [`.Distinguisher`](xref:DataViewsFieldSets#distinguisher). A distinguisher is a field that tells the data items apart within a section, such as the value of _Measurement_ metadata (i.e., the data items are distinguished by what they measure). Distinguishing data items also allows the data views engine to "align" them across sections, since it is clear that streams measuring, e.g., _Power Out_ are alike, and the streams measuring _Power In_ are alike.


### Defining index type and default range
Data views currently operate on timestamped data, which is data indexed by a DateTime property. This is reflected by the DataView's `.IndexTypeCode`, whose value must be "DateTime". Default values may be defined for the StartIndex, EndIndex, and/or Interval used when data view data is queried. 

## DataView properties
The following table lists the properties of a DataView:

| Property |Type    |Optionality  | Default | Details  |
|----------|--------|-------------|---------|----------|
| Id       | string | Required |  | Unique indentifier
| Name | string | Optional | value of Id | Friendly name
| Description | string | Optional  | null | Longer description of the view
| Queries     | Query[] | Optional* | [ ] | Queries for SDS Streams to include in the view. This is the starting point when defining a data view. Each Query should represent a collection of like streams. To include streams that represent very different items (e.g. solar inverters and weather), use separate queries.
| FieldSets   | FieldSet[] | Optional* | [ ] | The sets of fields included in the data view. Often copied or adapted from the view's available field sets, which are exposed in a resolved resource.
| Sectioners  | Field[] | Optional | [ ] | Fields by which the data items are partitioned/grouped.
| IndexTypeCode | SdsTypeCode | Optional | DateTime | The name of the index data type. DateTime is the currently supported index type.
| DefaultStartIndex | string | Optional | null | The default value of StartIndex used when querying the data view data, if none is specified then.
| DefaultEndIndex | string | Optional | null | The default value of EndIndex used when querying the data view data, if none is specified then.
| DefaultInterval | string | Optional | null | The default value of Interval used when querying the data view data, if none is specified then.
| Shape | DataViewShape | Optional | Standard | Data views may be set to resolve as standard shape or "narrow" shape. Narrow shape may be used when an invariant output schema is required.

### Rules for Id property
- Is not case sensitive, but case is preserved
- Can contain spaces
- Cannot contain forward slash ("/")
- Can contain a maximum of 100 characters

## Related object types
The following sections describe the classes and enumerations used when defining data views.

### Query
A query for SDS Streams to include in the view.
|Property| Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| Id  | string | Required |  | Unique identifier. Used by FieldSet to link to the query's results |
| Value | string | Optional | null | A query for streams, in SDS query syntax. A null or empty query will not match any streams. 

### FieldSet
A set of fields included in the data view, sharing a common role or source (`.SourceType`). One `DataView` is likely to include multiple `FieldSet`s.
|Property | Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| SourceType | FieldSetSourceType | Required |  | The type of role fulfilled by the field set |
| QueryId | string | Optional/Required | null | Required when SourceType is DataItem. Must correspond to a query defined in this data view. Not applicable to other source types.
| Fields | Field[] | Optional | [ ] | Data fields to include in the data view. Often copied or adapted from the view's available field sets, which are exposed in a resolved resource.
| Distinguisher | Field | Optional | null | A field by which to tell the data items apart, within each section.

### FieldSetSourceType enumeration
Defines the role or source type of a field set.
|Name| Description  |
|--|--|
|Index | Contains the field serving as index/key value of the data view's data |
|SectionerValue  | Links to the fields defined as sectioners of the data view, thus staying in sync as sectioner fields are changed or shuffled.  |
|DataItem  | Each data item returned by a particular query |

### Field
Individual piece of information, such as a property of an SDS stream, or metadata of that stream.
|Property | Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| Source | FieldSource | Optional | NotApplicable | For fields of a DataItem-sourced FieldSet, identifies the source of the field's values. Some sources are used in conjunction with the Keys property (see below).
| Keys | String[] | Optional | [ ] | Used for certain FieldSources, e.g. to map to specific stream properties by id. If more than one key is specified, they are matched as exclusive-or.
| Label | string | Optional | null | Friendly name for the field. Certain tokens have special meaning: one of these, {DistinguisherValue}, is included in the suggested labels of AvailableFieldSets. Tokens that do not resolve are "" (empty string). Label is trimmed of whitespace when used to identify field mappings.

### FieldSource enumeration
For fields that derive data from a data item (e.g. an SDS stream), the `FieldSource` enumeration specifies the part of that data item that a Field resolves to. Some sources require one or more `.Keys` to be specified on the field, such as `PropertyId` in which a key is the id of a desired property.

|Name | Keyed | Details
|--|--|--|
|NotApplicable | No | FieldSource is only applicable to FieldSets whose source type is DataItem
|Id | No | The id of the data item (stream)
|Name | No | The name of the data item (stream)
|PropertyId | Yes | Data from a stream property, found by id
|PropertyName | Yes | Data from a stream property, found by name
|Tags | Yes | Data item tags matching the collection provided
|Metadata | Yes | Value of the data item metadata, found by key

### SdsTypeCode enumeration
`SdsTypeCode` enumeration is the name of a data type. It is used when defining a data view, where the only supported `.IndexTypeCode` is "DateTime".

See [Sds documentation](xref:sdsTypes#sdstypecode) for details.

### DataViewShape enumeration
`DataViewShape` enumeration describes possible output shapes for a data view.
|Name| Description  |
|--|--|
|Standard | Fields are resolved into a shape similar to how they were defined. This is the recommended shape unless specific needs dictate.
|Narrow  | Fields are "pivoted" vertically, resulting in a view whose schema is independent of what data items (streams) are resolved by the data view.
