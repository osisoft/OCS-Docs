---
uid: DataViewsOverview
---

# Data views

Data views are subsets of data from one or more OCS sources, such as streams and assets, which can serve as a bridge between raw OCS data and data-driven applications. A data view is a declarative query and shape for OCS data. It is composed of an index field, a set of queries, sets of data field definitions, grouping instructions, and default data range and interval. A data view contains the following:

* Index field - Specifies the primary index type and label of the index. The index must be a timestamp and will be the first column of the data view

* Query – Part of the definition of a data view which determines what data items are available for a data view. Queries can be made against streams or assets. A data view can have multiple queries

* Data field set – Collections of fields originating from the same query

* Data view shape – A portion of a data view definition that determines if the data should be returned in the standard grouped row format or a narrow view which is a pivot of the standard table

The ability to create data views in OCS will mesh directly with OSIsoft's Data Science Enablement efforts, whereby users will be able to programmatically access data view content via an API for the purposes of advanced analytics. The ultimate goal is to deliver shaped data that is ready for consumption because it is normalized, aligned, and interpolated.

Understanding how the data view resolves into content is important both for the designer and the consumer. Data views provide extensive visibility into what data is included. The concept of "resolving" a data view is when the data view's queries and logic are executed to determine the data view's exact schema and content.

The collection(s) of OCS resources (such as streams and assets) on which a data view is based is the result of one or more queries. Streams, assets and other OCS resources are collectively known as *data items*. Values from the data items' properties can be included in the data view as *fields*, as well as information about the data items (such as Id and Metadata).

There are two primary means of controlling how the data items will be organized. One or more fields may be designated to *group* the data view, effectively grouping or partitioning the data items on some value. Within a set of fields, one field may be designated to *identify* or align the items.

Data view data is available in several formats, including JSON and CSV, with a user-specified range and granularity. Data is obtained by querying the REST API.

## Defining and refining a data view
There are several concepts and types used when defining data views. This is accomplished via the RESTful [data views API](xref:DataViewsAPIOverview). See the OCS documentation for greater detail on these concepts:
* [Define queries](xref:DataViewsQueries)
* [Define data field sets](xref:DataViewsFieldSets)
* [Group data items](xref:DataViewsGrouping)
* [Data view shape](xref:DataViewShape)

Data views are meant to be designed interactively. Each modification you make to a data view is likely to affect how the data view [resolves](xref:ResolvedDataView) into concrete information. The [resolved API resources](xref:ResolvedDataViewAPI) close the loop, showing you exactly what information is in the data view, and why.

Each data view can be individually [access-controlled](xref:DataViewsSecuringDataViews) using the [access control API resources](xref:DataViewsAccessControlAPI).

## Consuming a data view
[Data view data](xref:DataViewsQuickStartGetData) is available via queries to the RESTful data views [data API resource](xref:DataViewsDataAPI). 

To understand the source of each data field, inspect how the data view [resolved](xref:ResolvedDataView).