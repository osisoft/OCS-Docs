---
uid: ResolvedDataView
---

# Get resolved data view

A resolved data view is used to describe the output of a data view at the time it was resolved and for the authorized user. It can provide information on what items will be in the results, how they will be grouped, what items are mapped to a particular field, what additional fields are available to be included in the data view, and data items which are ineligible for mapping. Resolved Data Views do not query or return event data. This is useful when defining a data view and when consuming it.

## General concepts

### What does resolving mean?
A data view specifies `.Queries` to find data items, `.GroupingFields` (optionally) to group those data items into groups, and `.FieldSets` to include fields of data into the data view. *Resolving* the data view means the data views engine executes those queries and computes how the resulting data items will form a data view.

### What resolved information is available?
- [Data items, ineligible data items, and the groups they form](xref:DataViewsDataItemsandGroups) - OCS resources retrieved by the data view query
- [Available field sets](xref:DataViewsAvailableFieldSets) - fields which are present on the data items but not included in the data view
- [Field mappings](xref:DataViewsFieldMappings) - details of the data behind each group of each field
- [Statistics](xref:ResolvedDataView#statistics) about how the view resolved

These are available via the [Resolved Data View API](xref:ResolvedDataViewAPI). The relevant [object types](xref:ResolvedDataView#object-types) are described below.

#### Paged collections
Some of this information is exposed as paged collections, which accept parameters controlling `skip` and `count` within the collection. 

Paged responses include a `Link` header, with a hyperlink to the first page of results. If the results extend into an additional page, a hyperlink to the next page will also be included in the `Link` header.

Using these hyperlinks is the recommended method of paging. Alternatively, constructing paging links by manually incrementing the `skip` is allowable, though in this case it is recommended to specify cache behavior of "preserve". In addition, `Next-Page` and `First-Page` headers are provided for applications that do not support the `Link` header. The values for these headers are identical to the hyperlinks from the `Link` header.

### How is a data view resolved?
Data views resolve on a per user basis. Data views respect the permissions on underlying data items such as streams and assets. For example, if a user does not have read access to a particular stream in SDS, then that stream is not visible from data views.

As a consequence, different users may see different collections of data items resolve for a data view. This is by design.

### When is a data view resolved?
Each data view is resolved as needed for each user: upon request of any resolved information or data view data. In certain cases, a cached version is retrieved if available. 

This is evident when accessing the resolved information. It is contained in `ResolvedItem<T>/ResolvedItems<T>` container types which have a `.TimeOfResolution` property.

#### Controlling the cache behavior
By default: 
- accessing resolved information will retrieve a cached version if available: *preserve* the cache
- requesting a first page of data will cause the data view to re-resolve: *refresh* the cache

These defaults are overridable on each API call.
See the [Resolved Data View API](xref:ResolvedDataViewAPI) and [Getting Data](xref:DataViewsQuickStartGetData) for details.

The defaults are intended to strike a balance between predictability and freshness. When retrieving the various resolved information that is available, you will not cause regeneration (and possible changes) simply by viewing the resolved information. This is useful when diagnosing a data view that is not returning the data you expect.

#### Invalidation
If the data view is modified, any cached information is reset. The data view will be re-resolved the next time that information is requested.

No guarantee is made of the durability or lifespan of cached information. It may be reset by the system for maintenance reasons.

#### Paging through data
When using the [Data API](xref:DataViewsDataAPI) to page through data view data, the cache is automatically preserved on all pages after the first. This ensures consistency while paging through view data: if the view were re-resolved between pages, it might resolve differently (e.g. new streams just added to SDS) and return unpredictable results. The documentation on [Getting Data](xref:DataViewsQuickStartGetData) describes how the paging token helps guarantee consistency.

## Object types

### ResolvedItems<T>
Holds a collection of items that were resolved at a specific time
|Property | Type | Details |
|--|--|--|--|--|
| Items | IReadOnlyList<T> | A collection of resolved objects
| TimeOfResolution | DateTimeOffset | The time the collection of items was resolved |

### ResolvedItem<T>
Holds an item that was resolved at a specific time.

|Property | Type | Details |
|--|--|--|--|--|
| Item | T | A resolved object
| TimeOfResolution | DateTimeOffset | The time the item was resolved |

### CacheBehavior enumeration
|Name| Enumeration Id | Description  |
|--|--|--|
| Preserve | 1 | Use cached resource values |
| Refresh | 2 | Re-resolve the resource values |

### DataItem
An OCS resource retrieved by the data view query.

|Property | Type | Details |
|--|--|--|
| Id | string | Unique identifier 
| Name | string | Friendly name
| Description | string | Extended text description
| TypeId | string | The unique identifier of the data item's type
| ResourceType | DataItemResourceType | The data item resource type.
| Tags | IReadOnlyList<string> | Tag strings assigned to the data item
| Metadata | IReadOnlyList<MetadataValue> | Metadata values assigned to the data item
| DataItemFields | IReadOnlyList<DataItemField> | Data fields
| IneligibleDataItemFields | IReadOnlyList<DataItemField> | Data fields assigned to the data item that are not supported by data views

### MetadataValue
Individual metadata value from the metadata list of a `DataItem`.

|Property | Type | Details |
|--|--|--|
| Name | string | Unique identifier 
| Value | object | Static value assigned to the metadata value
| Description | string | Extended text description
| TypeCode | SdsTypeCode| The name of the metadata value's data type
| Uom | string | The metadata value's unit of measurement identifier

### DataItemResourceType enumeration
Describes the resource type of a data item.

|Name| Enumeration Id | Description  |
|--|--|--|
| Stream | 1 | A stream from the Sequential Data Store |
| Asset | 2 | An asset |

### DataItemField
A field of a data item where values come from.  
Within a data item of resource kind `.Stream`, this corresponds to a stream property. For a data item of resource kind `.Asset`, this corresponds to a property associated with an asset stream reference.

|Property | Type | Details |
|--|--|--|
| Id | string | The data item field's unique identifier 
| Name | string | The data item field's friendly name
| StreamReferenceName | string | The asset stream reference name. Only applies to asset property data item fields.
| StreamId | string | Stream id corresponding to the asset stream reference. Only applies to asset property data item fields.
| TypeCode | SdsTypeCode| The name of the field's data type
| Uom | bool | The unit of measure id for the data item field
| IsKey | bool | True if the field is the primary index of the data item. False otherwise.

### SummaryDirection enumeration
Direction used in the summary calculation.

|Name| Enumeration Id | Description  |
|--|--|--|
|Forward | 1 | Uses the start index for the summary calculation.
|Backward | 2 | Uses the end index for the summary calculation.

### Group
A group of the data view. The overall collection of data items is divided into groups as a result of the `.GroupingFields` defined on the `DataView`.

|Property | Type | Details |
|--|--|--|
| GroupingValues | IReadOnlyList<GroupingValue> | This groups's value of each `.GroupingFields` defined on the `DataView`
| DataItems | IReadOnlyDictionary<string, IReadOnlyList<DataItem>> | The data items in this group

### GroupingValue
The individual group value from the list of `Groups`.

|Property | Type | Details |
|--|--|--|
| Value | object | This groups's value of each `.GroupingFields` defined on the `DataView`
| TypeCode | SdsTypeCode | The name of the group's type code
| Uom | string | The group's unit of measurement identifier

### FieldMapping
Details on the provenance on every field of data:

|Property | Type | Details |
|--|--|--|
| Id | string | Unique identifier
| Label | string | Friendly name
| FieldKind | FieldKind enumeration | Specifies if the mapping is for an index, grouping, data, or field id field
| TypeCode | SdsTypeCode | The primary data type of the mapping
| SummaryType | SdsSummaryType  |The summary type calculation. Null unless all data mappings' SummaryType within the field mappings are identical. |
| SummaryDirection | SummaryDirection Enumeration |SummaryDirection controls whether the start or end index of the summary is used by the data view to calculate the summary values. Null unless all data mappings' SummaryDirection within the field mappings are identical. |
| Uom | string | The unit of measure id. Null unless all data mappings' unit of measures within the field mapping are identical.
| DataMappings | IReadOnlyList<DataMapping> | Per-group details of what this field resolved to

### FieldKind enumeration
Field type used in the mapping.

|Name| Enumeration Id | Description  |
|--|--|--|
|IndexField | 1 | Maps to an index field.
|GroupingField | 2 | Maps to a grouping field.
|DataField | 3 | Maps to a data field.
|FieldId | 4 | Maps to a field id field for a narrow shape data view.

### DataMapping
Per-group details of the data that a `FieldMapping` targets:

|Property | Type | Details |
|--|--|--|
| TargetId | string | The unique identifier of the target data item
| TargetFieldKey | string | The specific targeted part of the data item, if any.
| TargetStreamReferenceName | string | The asset stream reference name. Only applies to asset property data mappings.
| TypeCode | SdsTypeCode | The value type
| SummaryType | SdsSummaryType  |The summary type calculation for the data field. |
| SummaryDirection | SummaryDirection Enumeration |SummaryDirection controls whether the start or end index of the summary is used by the data view to calculate the summary values. |
| Uom | string | The unit of measure id
| FieldSetIndex | Nullable<int> | The position of the corresponding field set within the data view
| FieldIndex | Nullable<int> | The position of the corresponding field within its field set

### Statistics
General statistics about how the data view resolved:

|Property | Type | Details |
|--|--|--|
| DataItemCount | int | The total count of data items resolved in the data view
| GroupCount | int | The total count of groups resolved in the data view
| FieldMappingCount | int | The total count of field mappings resolved by the data view
| DataFieldSets | IReadOnlyList<DataFieldSetStatistics> | Statistics about how the data view data field sets resolved

### DataFieldSetStatistics
Statistics about how a data field set resolved:

|Property | Type | Details |
|--|--|--|
| DataItemCount | int | The total count of data items resolved for the data field set
| UnmappedDataItemCount | int | The total count of data items not referenced by a field mapping resolved for the data field set
| DataFields | IReadOnlyList<DataFieldStatistics> | Statistics about how the data field set data fields resolved

### DataFieldStatistics
Statistics about how a data field resolved:

|Property | Type | Details |
|--|--|--|
| FieldMappingCount | int | The total count of field mappings associated with the data field
| DataMappingCount | int | The total count of data mappings associated with the data field
| EmptyDataMappingCount | int | The total count of data mappings associated with the data field that do not map to any data
| UnmappedGroupCount | int | The total count of groups that do not map to any field mappings in the data field
