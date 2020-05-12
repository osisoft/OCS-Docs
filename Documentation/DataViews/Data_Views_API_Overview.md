---
uid: DataViewsAPIOverview
---

# Data Views API Overview

The data views API is a RESTful surface for creating, securing, and consuming data views. 
The supported content type of request and response bodies is JSON unless otherwise noted.

The API is comprised of the following main areas:

## [Data View API](xref:DataViewAPI)
Resources to create, read, update, and delete `/DataViews`. For more information, see [Data View](xref:DataView)

## [Resolved Data View API](xref:ResolvedDataViewAPI)
For each `/DataViews/{dataViewId}`, these resources show how the data view `./Resolved/` for your user context

## [Resolved Data View Preview API](xref:ResolvedDataViewPreviewAPI)
For each `/DataView` provided in the request body, resources to show how the data view `./Resolved/` for your user context

## [Data API](xref:DataViewsDataAPI)
For each `/DataViews/{dataViewId}`, resources for getting the `./Data/` for a particular time range

## [Preview Data API](xref:DataViewsPreviewDataAPI)
For each `/DataView` provided in request body, resources for getting the preview `./Data/` for a particular time range

## [Access Control API](xref:DataViewsAccessControlAPI)
For the `/DataViews` collection, resources for reading and updating the default `/AccessControl`.  
For each `/DataViews/{dataViewId}`, resources for reading and updating its `/Owner` and `/AccessControl`