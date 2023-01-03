---
uid: DataViewsDataItemsandGroups
---

# Identify data items

A `DataItem` is an OCS resource, such as a stream or asset, included in the data view. The collection of data items is specified by the data view queries, where the queries define the search criteria and the data items represent the results of the search. The data view can include one or more properties from each data item.

## Data items

The collection of data items in the data view represents all OCS resources that match the [`.Queries`](xref:DataViewsQueries) field of the data view, excluding data items that are ineligible (see [ineligible data items](#ineligible-data-items)). To add data items to a data view, either refine an existing query, or add a new query (refer to the [Define Queries](xref:DataViewsQueries) topic for which option to choose from). Similarly, to remove data items from a data view, either refine an existing query, or remove a query. If you remove a query, this will remove all data items from the query.

[!include[query-notes](../../../analytics/data-views/_includes/query-notes.md)]

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

When requesting for [resolved data items](xref:ResolvedDataViewAPI) or when [getting the data view data](xref:DataViewsDataAPI), the list of data items reflects the list of OCS resources that match one or more queries when the data view was last resolved. This means that if new data items, such as new streams or assets, were added or existing data items were removed, the list of data items will only reflect the latest changes if the data view is re-resolved. For more information, refer to the caching section in the [Get resolved data view](xref:ResolvedDataView) topic.

[!include[ineligible-data-items](../../../analytics/data-views/_includes/ineligible-data-items.md)]