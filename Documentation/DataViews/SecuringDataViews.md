---
uid: SecuringDataViews
---

# Securing Data Views

Data view security is configured in multiple hierarchies. The highest level applies to the data views collection as a whole. Individual data views can then be secured. And finally, the data within a data view can be secured. Each of these levels are configured separately and act as independent authorization checks. 

This section covers information specific to access control within the data views feature. For background information about access control throughout OSIsoft Cloud Services and how to configure the access control objects, see [Role-based access control](..\Access_Control.md). 

## Data Views Collection Access Control
The data views collection access control list is used to control which users and clients are authorized to create data views. Only users and clients with Write access rights can create data views. See [CommonAccessRightsEnum](..\Access_Control.md#commonaccessrightsenum) for a complete list of available access rights. 

The data views collection access control list also determines the default access control list for individual data views. Note that changing the collection level access control list does not affect existing data views as the collection level access control list is only used when the data view is first created. Once the data view exists, data view level access control is managed independently of collection level access control. See [Data Views Access Control](#data-views-access-control) for more information on securing individual data views. 

When a namespace is first created, the data views collection access control list will default to the access control list for the entire namespace. Use the API routes in [Access Control API](AccessControl_API.md) to view and update the data views collection access control list. Note: only users and clients with ManageAccessControl rights on the data views collection are authorized to view and update the collection level access control list. 

## Data Views Access Control
Data views are also secured individually on a per data view basis. This allows data views containing sensitive information to be secured more tightly without limiting access to all data views within the collection. 

There are two objects that control authorization to an individual data view: the data view access control list and the data view owner. See [Role-based access control](..\Access_Control.md) for more information about the access control list and owner objects. Note: Owner authorization supersedes access control list authorization. The owner (typically the user or client that created the data view) has full access to the data view regardless of the access control list. 

The data view owner and access control list control basic authorization to a given data view. See the table below for the required access rights for each operation that can be performed against a data view. For the full list of available access rights, see [CommonAccessRightsEnum](..\Access_Control.md#commonaccessrightsenum). 

| Operation                      | Required access rights         |
| ------------------------------ | ------------------------------ |
| Read                           | Read                           |
| Update                         | Write                          |
| Delete                         | Delete                         |
| Read access control objects    | ManageAccessControl            |
| Update access control objects  | ManageAccessControl            |
| Create                         | Write on data view collection<br> (see [Collection access control](#data-views-collection-access-control))  |

On creation, a data view’s access control list will default to the access control list of the data views collection. The data view owner will default to the user or client that created the data view. Use the API routes in [Access Control API](AccessControl_API.md) to view and update the access control list and owner of a given data view. 

## Data Access Control
Data views honor the configured access control rights of streams (see [Streams](..\SequentialDataStore\SDS_Streams.md)). Users and clients with read access on a data view are not automatically granted read access to the data contained within the data view as this authorization is configured at the stream level. 

For example, there is a data view that contains data from three streams – stream1, stream2, and stream3. Both user1 and user2 have read access to the data view. User1 also has read authorization to all three streams. However, user2 only has read authorization to stream1. When user1 requests data items for the data view (see [Get DataItems](DataRetrieval_API.md#get-dataitems)), user1 will see all three streams listed. When user2 makes the same request, user2 will only see stream1 listed. This is because the stream level authorization is preventing user2 from seeing the data associated with streams 2 and 3. Similarly, when user2 requests data for the data view using [Get Data View Data](DataRetrieval_API.md#get-data-view-data), he will only see data for stream1. Cells that should contain data for streams 2 and 3 as defined in the data view mappings will be empty.

This behavior will be the same for all API routes in the [Data Retrieval API](DataRetrieval_API.md) except for [Get Data Mappings](DataRetrieval_API.md#get-data-mappings). It is also possible to see different results when generating default mappings since default mappings are created based on the data items authorized to the user specifying defaultMappings = true in the API route. See [Defining the columns](Introduction.md#defining-the-columns) for more information on default mappings. 

Configuring access control for streams is similar to data views. See the [Role-based access control](..\Access_Control.md) and [Streams](..\SequentialDataStore\SDS_Streams.md) sections for more information. 