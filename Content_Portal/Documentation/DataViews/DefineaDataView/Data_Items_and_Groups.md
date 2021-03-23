---
uid: DataViewsDataItemsandGroups
---

# Identify data items

A `DataItem` is an OCS resource, such as a stream or asset, included in the data view. The collection of data items is specified by the data view queries, where the queries define the search criteria and the data items represent the results of the search. The data view can include one or more properties from each data item.


## Data items

The collection of data items in the data view represents all OCS resources that match the [`.Queries`](xref:DataViewsQueries) field of the data view, excluding data items that are ineligible (see discussion of ineligible data items below). To add data items to a data view, either refine an existing query, or add a new query (refer to [queries](xref:DataViewsQueries) for which option to choose from). Similarly, to remove data items from a data view, either refine an existing query, or remove a query (this will remove all data items from the query).

Note: Each query is executed independently to generate the list of data items. It is thus possible to have duplicate data items resulting from different queries. This can be desirable or undesirable depending on the use case.

There is a maximum of 10,000 data items per query. You can add more than 10,000 data items to a data view by adding additional queries. Data items are ordered alphabetically by data item id within the data items collection.

### Adding fields
Each data item contains information that can be optionally (and explicitly) added to the data view by setting the [`.DataFieldSets`](xref:DataViewsFieldSets) field of the data view. Currently, there are two supported resource types: `stream` and `asset`. 

The resource type `stream` has the following available fields:
* Stream id
* Stream name
* Stream tags
* Stream metadata
* Data from each stream property

The resource type `asset` has the following available fields:
* Asset id
* Asset name
* Asset metadata
* Data from each asset stream reference property

### Adding or removing data items
When requesting for [resolved data items](xref:ResolvedDataViewAPI) or when [getting the data view data](xref:DataViewsDataAPI), the list of data items reflects the list of OCS resources that match one or more queries when the data view was last resolved. This means that if new data items, such as new streams or assets, were added or existing data items were removed, the list of data items will only reflect the latest changes if the data view is re-resolved. For more information, refer to the caching section in the resolved data view resource [page](xref:ResolvedDataView).


## Ineligible data items
The collection of ineligible data items represents OCS resources that match the queries but cannot be included in the data view. A data item is ineligible if it does not contain at least one eligible non-key [data item field](xref:ResolvedDataView#dataitemfield).

A data item field is ineligible if its index is not appropriate for the data view, or if the field has an SdsTypeCode that may not be included in data views.

The following are examples of ineligible index:

* The index is compound (multiple properties)
* The index property's SdsTypeCode differs from the IndexTypeCode of the data view

The following are examples of ineligible field types:

* SdsTypeCode.Object (nested type)
* SdsTypeCode.Array (collection type)
* SdsTypeCode.TimeSpan (time spans and nullable time spans are currently unsupported)
