---
uid: PreviewDataView
---

# Preview data view API

The preview data view API provides the users with the flexibility to work and query with the routes and get a response on the fly before saving the data view. All the preview routes expect a data view to be passed in the request body of the call. The user has the flexibility to change the data view any number of times. The syntax of the data view and all other objects for the routes will remain identical to that of the non-preview routes.

## General concepts

### What routes have a preview available?
Below data view API routes are available to be used as preview routes:

1. Resolved preview routes
    - See [Get Data Items by Query](xref:ResolvedDataViewPreviewAPI#get-data-items-by-query).
    - See [Get Ineligible Data Items by Query](xref:ResolvedDataViewPreviewAPI#get-ineligible-data-items-by-query).
    - See [Get Groups](xref:ResolvedDataViewPreviewAPI#get-groups).
    - See [Get Available Field Sets](xref:ResolvedDataViewPreviewAPI#get-available-field-sets).
    - See [Get Field Mappings](xref:ResolvedDataViewPreviewAPI#get-field-mappings).
    - See [Get Statistics](xref:ResolvedDataViewPreviewAPI#get-statistics).
2. See [Get Data View Data](xref:DataViewsPreviewDataAPI#get-data-view-data).

### When to use the preview routes?
* The preview API is useful for testing how all resources will resolve for the data view. These include data included in the data view, its source, and its destination. 
* The preview data API provides the capability to identify the number of groups from which the `groupCount` query parameter will get preview data. The preview data API can also be used to identify the number of items per group using the `countPerGroup` parameter.

### Who can access the data view preview routes?

* The access rights required for the preview routes are identical to those of the non-preview data view create route.
* Users or clients with "Write" access rights on the data views collection access control list can access the preview routes.
