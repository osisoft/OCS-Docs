---
uid: PreviewDataView
---

# Preview Data View API

The preview data view APIs provide the users with the flexibility to work and query with the routes and get a response on the fly before saving the data view. All the preview routes expect a data view to be passed in the request body of the call. The user has the flexibility to change the data view any number of times. The syntax of the data view and all other objects for the routes will remain identical to that of the non-preview routes.

## General concepts

### What routes have a preview available?
Below data view API routes are available to be used as preview routes:

1. Resolved preview routes
- [Get Data Items by Query](xref:ResolvedDataViewPreviewAPI#GetDataItemsbyQuery)
- [Get Ineligible Data Items by Query](xref:ResolvedDataViewPreviewAPI#GetIneligibleDataItemsbyQuery)
- [Get Groups](xref:ResolvedDataViewPreviewAPI#GetGroups)
- [Get Available Field Sets](xref:ResolvedDataViewPreviewAPI#GetAvailableFieldSets)
- [Get Field Mappings](xref:ResolvedDataViewPreviewAPI#GetFieldMappings)
- [Get Statistics](xref:ResolvedDataViewPreviewAPI#GetStatistics)
2. [Get Data View Data](xref:DataViewsPreviewDataAPI#GetDataViewData)

### When to use the preview routes?
* The preview APIs are useful for testing how all resources will resolve for the data view. These include data included in the data view, its source, and its destination. 
* The preview data API provides the capability to identify the number of groups from which the `groupCount` query parameter will get preview data. The preview data API can also be used to identify the number of items per group using the `countPerGroup` parameter.

### Who can access the data view preview routes?

* The access rights required for the preview routes are identical to those of the non-preview data view create route.
* Users or clients with "Write" access rights on the Data views collection access control list can access the preview routes.