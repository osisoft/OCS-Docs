---
uid: ResolvedDataView
---

# Resolved Data View

Various information is available about how each data view _resolves_. This information describes exactly what data will be in the data view, where it comes from, and where it will appear. This is useful when defining a data view and when consuming it.

## General concepts

### What does resolving mean?
A data view specifies `.Queries` to find data items, `.GroupingFields` (optionally) to group those data items into groups, and `.FieldSets` to include fields of data into the data view. *Resolving* the data view means the data views engine executes those queries and computes how the resulting data items will form a data view.

### What resolved information is available?
- [Data items, ineligible data items, and the groups they form](xref:DataViewsDataItemsandGroups) - currently, SDS streams are the supported type of data item.
- [Available field sets](xref:DataViewsAvailableFieldSets) - fields which are present on the data items but not included in the data view
- [Field mappings](xref:DataViewsFieldMappings) - details of the data behind each group of each field
- [Statistics](xref:ResolvedDataView#statistics) about how the view resolved

These are available via the [Resolved Data View API](xref:ResolvedDataViewAPI). The relevant [object types](xref:ResolvedDataView#object-types) are described below.

#### Paged collections
Some of this information is exposed as paged collections, which accept parameters controlling `skip` and `count` within the collection. 

Paged responses include a header called `FirstPage`, linking to the first page of results. If the results extend into an additional page, a `NextPage` header is included with a hyperlink to the next page.

Using these hyperlinks is the recommended method of paging. Alternatively, constructing paging links by manually incrementing the `skip` is allowable, though in this case it is recommended to specify cache behavior of "preserve".

### How is a data view resolved?
Data views resolve on a per user basis. Data views respect the permissions on underlying objects such as SDS Streams. If a user does not have read access to a particular stream in SDS, then that stream is not visible from data views.

As a consequence, different users may see different collections of data items resolve for a data view. This is by design.

### When is a data view resolved?
Each data view is resolved as needed for each user: upon request of any resolved information or data view data. In certain cases, a cached version is retrieved if available. 

This is evident when accessing the resolved information. It is contained in `ResolvedItem<T>/ResolvedItems<T>` container types which have a `.TimeOfResolution` property.

#### Controlling the cache behavior
By default: 
- accessing resolved information will retrieve a cached version if available: *preserve* the cache
- requesting a first page of data will cause the data view to re-resolve: *refresh* the cache

These defaults are overridable on each API call.
See the [Resolved Data View API](xref:ResolvedDataViewAPI) and [Getting Data](xref:DataViewsGettingData) for details.

The defaults are intended to strike a balance between predictability and freshness. When retrieving the various resolved information that is available, you will not cause regeneration (and possible changes) simply by viewing the resolved information. This is useful when diagnosing a data view that is not returning the data you expect.

#### Invalidation
If the data view is modified, any cached information is reset. The data view will be re-resolved the next time that information is requested.

No guarantee is made of the durability or lifespan of cached information. It may be reset by the system for maintenance reasons.

#### Paging through data
When using the [Data API](xref:DataViewsDataAPI) to page through data view data, the cache is automatically preserved on all pages after the first. This ensures consistency while paging through view data: if the view were re-resolved between pages, it might resolve differently (e.g. new streams just added to SDS) and return unpredictable results. The documentation on [Getting Data](xref:DataViewsGettingData) describes how the paging token helps guarantee consistency.

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

### DataItem
|Property | Type | Details |
|--|--|--|
| Id | string | Unique identifier 
| Name | string | Friendly name
| Description | string | Extended text description
| TypeId | string | The unique identifier of the data item's type
| ResourceType | DataItemResourceType | The resource type. See `DataView` [documentation](xref:DataView). Currently, the supported resource type is `.Stream`
| Tags | IReadOnlyList<string> | Tag strings assigned to the data item
| Metadata | IReadOnlyDictionary<string, string> | Metadata key-value pairs assigned to the data item
| DataItemFields | IReadOnlyList<DataItemField> | Data fields

### DataItemResourceType enumeration
Describes the resource type of a data item.

|Name| Description  |
|--|--|
| Stream | A stream from the Sequential Data Store |

### DataItemField
A field of a data item where values come from.  
Within a data item of resource kind `.Stream`, this corresponds to a stream property.

|Property | Type | Details |
|--|--|--|
| Id | string | The data item field's unique identifier 
| Name | string | The data item field's friendly name
| TypeCode | SdsTypeCode| The name of the field's data type
| IsKey | bool | True if the field is the primary index of the data item. False otherwise.

### Group
A group of the data view. The overall collection of data items is divided into groups as a result of the `.GroupingFields` defined on the `DataView`.

|Property | Type | Details |
|--|--|--|
| Values | IReadOnlyList<string> | This groups's value of each `.GroupingFields` defined on the `DataView`
| DataItems | IReadOnlyDictionary<string, IReadOnlyList<DataItem>> | The data items in this group

### FieldMapping
Details on the provenance on every field of data:

|Property | Type | Details |
|--|--|--|
| Id | string | Unique identifier
| Label | string | Friendly name
| FieldKind | FieldKind enumeration | Specifies if the mapping is for an index, grouping, data, or field id field
| TypeCode | SdsTypeCode | The primary data type of the mapping
| DataMappings | IReadOnlyList<DataMapping> | Per-group details of what this field resolved to

### FieldKind enumeration
Field type used in the mapping.

|Name| Description  |
|--|--|
|IndexField | Maps to an index field.
|GroupingField | Maps to a grouping field.
|DataField | Maps to a data field.
|FieldId | Maps to a field id field for a narrow shape data view.

### DataMapping
Per-group details of the data that a `FieldMapping` targets:

|Property | Type | Details |
|--|--|--|
| TargetId | string | The unique identifier of the target data item
| TargetFieldKey | string | The specific targeted part of the data item, if any.
| TypeCode | SdsTypeCode | The value type
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
