---
uid: DataRetrieval
---

# Retrieving Data with Data Views

Once the data view is defined and saved, ([see Data Views APIs](DataViews_API.md)), data can be retrieved from the data view. In the following sections, we will discuss two kinds of useful information that can be obtained from each data view:
* [Resolved data view resources](#metadata)
* [Data](#data)

## <a name="metadata">`Resolved Data View Resources` </a>

Data view resources show the selected subset of data in each data view, as defined by the queries and group rules. Data values from the data view directly belong to these resources, so it is important to retrieve and verify that these resources include the data of interest before proceeding to obtain the data values. 

#### Data Items
A data item is an SdsStream. The collection of data items are defined by the [queries](Queries.md)  property in the data view, where the queries define the search criteria and the data items represent results of the search. Each data item can have one or more properties in the data view data.  

#### Data Groups
Data items can optionally be organized into data groups in order for users to more easily compare similar properties in the same column of a data view. Each data group contains one or more data items. The entire collection of data groups contains all data items. Data groups are defined by the [group rules](GroupRules.md) property in the data view, where the group rules define the grouping criteria and the data groups represent the results of such grouping. Any streams that do not meet grouping criteria are consolidated in a single group with a group rule name of "(NoMatch)". 

#### Data Mappings
Data mappings are identical to the [mappings](Mappings.md) property in the data view if explicitly defined. Otherwise, a default set of data mappings is generated based on all the properties of all data items, after taking grouping into account. 

In each of the data items, data groups, and data mappings, the resource is "resolved" and cached when any of the resources is first accessed on a per data view, per user basis. Subsequent calls to the resources return the cached results, which is evident from the time of resolution property in the returned response. A cache parameter can be included in the request to control whether the resolved resources are to be refreshed. By default, the cache parameter is set to preserve the cache for all data view resources endpoints. If there are changes to the underlying streams in SDS, the results will not be updated unless the cache is explicitly refreshed. 

The following APIs are available to retrieve resolved resources of a data view.

[Get data groups](DataRetrieval_API.md#get-data-groups)
```csharp
    GET Dataviews/{id}/datagroups
        Query parameters: skip, count, cache
```
 
This returns all data items matching the data view query, organized in groups based on the data view group rules. 

[Get data items](DataRetrieval_API.md#get-dataitems)
```csharp
    GET Dataviews/{id}/dataitems
        Query parameters: skip, count, cache
```
This returns all data items matching the data view query in a flat list. 

[Get data mappings](DataRetrieval_API.md#get-data-mappings)
```csharp
    GET Dataviews/{id}/datamappings
        Query parameters: cache
```
This returns the resolved mappings for the data view, defining where each column gets its data value.

[Get statistics](DataRetrieval_API.md#get-statistics)
```csharp
    GET Dataviews/{id}/statistics
        Query parameters: cache
```
This returns some statistics for the resolved data view resources, including item count and the shape of the resulting data view table.

#### Permissions
Per-user stream permissions in SDS mean per-user data view results. The data view resources - data groups, data items and data mappings - are unique for each user, as each user has unique permissions in SDS.

#### Paging
Results from the get data groups and data items API calls can be quite large. Links to view the first page and next page of data are stored in the response headers. Below are example links for paging through the data groups by 10 on each page. The cache parameter in this case is explicitly set to preserve to allow us to page through the whole collection without changes in the underlying results.

* FirstPage: .../DataViews/DataViewId/DataGroups?cache=preserve&skip=0&count=10
* NextPage: .../DataViews/DataViewId/DataGroups?cache=preserve&skip=10&count=10

## <a name="data">`Data View Data` </a>

Retrieving data involves retrieving data values from the optionally grouped data items defined in the data view. The [mappings](Mappings.md) in the data view define the sources of data in each column, whereas the [index config](IndexConfig.md) and index data type define which data values populate each row. 

Currently, only datetime interpolated data is supported. 

[Get Data View Data API](DataRetrieval_API.md#get-data-view-data): 
```csharp
    GET Dataviews/{id}/data/interpolated
        Query parameters: startindex, endindex, interval, count, form, continuationToken, cache
```

This returns the data view data results. Data is interpolated on the index data type based on the start index, end index, and interval. In the first page link the cache parameter controls resolution of the backing data view resources with a default of preserve. All necessary parameters to generate the next page of data are included in the continuationToken.  The user can override the indexconfig, form and count.

#### Paging

Since each data view can contain a large amount of data, the get data call can easily be paged to get the entire data collection. Each get data call to retrieve data view data results in two links stored in the HTTP response headers that can be used to navigate to the first page or the next page of data.

* FirstPage: .../DataViews/DataViewId/Data/Interpolated?count=100&cache=Preserve
* NextPage: ...DataViews/DataViewId/Data/Interpolated?count=100&continuationToken=MjAxOC0wMS0wMVQwMDowMDoxMVo_MD90Yk1OblE_QUxXcEZBP1VEdGxIMWJROG9z

#### Index config
A single data view can serve results with different ranges of indices. Therefore, index config can be overridden using query parameters during a get data call, even if one is specified in the data view. The index config needs to be specified on the first page of data retrieval, and remains the same on subsequent pages to allow correct paging through the entire data collection. If an index config is not specified in either the data view definition or in the query parameter, the default (start index of 24 hours ago, end index of current UTC time, with an interval of 1 minute) will be used. 

#### Format
There are several [data output formats](DataOutputFormats.md) available from the get data call.
