---
uid: DataViewsSecuringDataViews
---

# Secure data views

Access rights to data views and their data are configurable in several ways. Permissions to the overall data views collection govern which users may create data views, and are also used as the default permissions for each data view that is created. Access to each data view is independently configurable. Finally, the permissions set on each data item, such as a [Stream](xref:sdsStreams), apply globally within OSIsoft Cloud Services, including within the data views feature.

This section covers information specific to access control within the data views feature. For background information about access control throughout OSIsoft Cloud Services and how to configure the access control objects, see [Role-based access control](xref:accessControl).

## Data views collection access control
The data views collection access control list is used to control which users and clients are authorized to create data views. Only users and clients with "Write" access rights can create data views. See [CommonAccessRightsEnum](xref:accessControl#commonaccessrightsenum) for a complete list of available access rights.

The data views collection access control list also determines the default access control list for individual data views. Note that changing the collection level access control list does not affect existing data views as the collection level access control list is only used when the data view is first created. Once the data view exists, data view level access control is managed independently of collection level access control. See Data Views Access Control for more information on securing individual data views.

When a namespace is first created, the data views collection access control list will default to the access control list for the entire namespace. Use the API routes in [Access Control API](xref:DataViewsAccessControlAPI) to view and update the data views collection access control list. Only users and clients with `ManageAccessControl` rights on the data views collection are authorized to view and update the collection-level access control list.

## Data view access control
Data views are secured individually. This allows granular control over who can see which data view, in order to restrict access to sensitive or compartmentalized information.

Each data view has two child resources that control authorization: the data view access control list and the data view owner. See [Role-based access control](xref:accessControl) for more information about the access control list and owner objects. Owner authorization supersedes access control list authorization. The owner (typically the user or client that created the data view) has full access to the data view regardless of the access control list.

The data view owner and access control list control basic authorization to a given data view. See the table below for the required access rights for each operation that can be performed against a data view. For the full list of available access rights, see [CommonAccessRightsEnum](xref:accessControl#commonaccessrightsenum).

| Operation | Required access rights |
|--|--|
| Create | `Write` on the _data views collection_ (see [Collection Access Control](xref:DataViewsSecuringDataViews#data-views-collection-access-control)) |
| Read | `Read` |
| Update | `Write` |
| Delete | `Delete` |
| Read access control | `ManageAccessControl` |
| Update access control | `ManageAccessControl` |

## Data access control
The access control rights of each data item, such as a stream (see [Streams](xref:sdsStreams)), apply globally within OSIsoft Cloud Services, including within data views. When a data view [resolves](xref:ResolvedDataView) per-user, each [`Query`](xref:DataViewsQueries) is executed with the user's own permissions, honoring the access control configured for each data item. Read access to a data view does not affect the user's read access to (or even the visibility of!) any streams or other data items.

When you inspect the _data items_ that resolve for a data view, you see only the data items that you have `Read` access to.

Configuring access control for streams and other data items is similar to data views. See the [Role-based access control](xref:accessControl) and [Streams](xref:sdsStreams) sections for more information.
