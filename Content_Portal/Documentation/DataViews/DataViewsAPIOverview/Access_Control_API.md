---
uid: DataViewsAccessControlAPI
---

# Access control API

This portion of the [overall data views API](xref:DataViewsAPIOverview) focuses on [securing data views](xref:DataViewsSecuringDataViews) by setting their ownership and permissions.


## `Get Data Views Access Control List`
Get the default [`AccessControlList`](xref:accessControl#access-control-lists) for the DataViews collection.

### Request
```text
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/DataViews
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

### Response
The response includes a status code and a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | The default access control list of the data views collection |
| 403 Forbidden | error | You are not authorized to view the requested data view collection's access control list |
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body
```json
HTTP 200 OK
{
  "RoleTrusteeAccessControlEntries": 
  [
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": Allowed,
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "22222222-2222-2222-2222-222222222222"
      },
      "AccessType": Allowed,
      "AccessRights": 15
    },
    {
      "Trustee": {
        "Type": User,
        "RoleId": "33333333-3333-3333-3333-333333333333"
      },
      "AccessType": Denied,
      "AccessRights": 8
    }
  ]
}
```

### .NET client libraries method
```csharp
   Task<AccessControlList> GetAccessControlListAsync();
```

## `Update Data Views Access Control List`
Update the default [`AccessControlList`](xref:accessControl#access-control-lists) for the DataViews collection.

### Request
```text
PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/DataViews
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

### Request body
An [`AccessControlList`](xref:accessControl#access-control-lists)

#### Example request body
```json
{
  "RoleTrusteeAccessControlEntries": 
  [
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": Allowed,
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "22222222-2222-2222-2222-222222222222"
      },
      "AccessType": Allowed,
      "AccessRights": 15
    },
    {
      "Trustee": {
        "Type": User,
        "RoleId": "33333333-3333-3333-3333-333333333333"
      },
      "AccessType": Denied,
      "AccessRights": 8
    }
  ]
}
```

### Response
The response includes a status code and, in some cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 204 No Content | (empty) | Successfully updated the default access control list of the data views collection |
| 400 Bad Request | error | The request is not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized to update the data views collection's default access control list |
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

### .NET client libraries method
```csharp
   Task UpdateAccessControlListAsync(AccessControlList acl);
```

## `Get Data Views Access Rights`
Get access rights to the data views collection for the calling user or client.

### Request
```text
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessRights/DataViews
```
### Parameters
`string tenantId`
The tenant identifier

`string namespaceId`
The namespace identifier

### Response
The response includes a status code and a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `string[]` | A list of access rights to the data views collection |
| 403 Forbidden | error | You are not authorized to view the requested data view collection's access control list |
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details. |

#### Example response body
```json
HTTP 200 OK
[
  "Read",
  "Write",
  "Delete",
  "ManageAccessControl"
]
```

### .NET client libraries method
```csharp
   Task<string[]> GetAccessRightsAsync();
```

## `Get Data View Access Control List`
Get the [`AccessControlList`](xref:accessControl#access-control-lists) of the specified data view.

### Request
```text
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/AccessControl
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Response
The response includes a status code and a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | The access control list of the requested data view |
| 403 Forbidden | error | You are not authorized to view the requested data view's access control list |
| 404 Not Found | error | The requested data view was not found
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body
```json
HTTP 200 OK
{
  "RoleTrusteeAccessControlEntries": 
  [
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": Allowed,
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "22222222-2222-2222-2222-222222222222"
      },
      "AccessType": Allowed,
      "AccessRights": 15
    },
    {
      "Trustee": {
        "Type": User,
        "RoleId": "33333333-3333-3333-3333-333333333333"
      },
      "AccessType": Denied,
      "AccessRights": 8
    }
  ]
}
```

### .NET client libraries method
```csharp
   Task<AccessControlList> GetDataViewAccessControlAsync(string id);
```

## `Update Data View Access Control List`
Update the [`AccessControlList`](xref:accessControl#access-control-lists) of the specified data view.

### Request
```text
PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/AccessControl
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Request body
An [`AccessControlList`](xref:accessControl#access-control-lists)

#### Example request body
```json
{
  "RoleTrusteeAccessControlEntries": 
  [
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": Allowed,
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "22222222-2222-2222-2222-222222222222"
      },
      "AccessType": Allowed,
      "AccessRights": 15
    },
    {
      "Trustee": {
        "Type": User,
        "RoleId": "33333333-3333-3333-3333-333333333333"
      },
      "AccessType": Denied,
      "AccessRights": 8
    }
  ]
}
```

### Response
The response includes a status code and, in some cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 204 No Content | (empty) | Successfully updated the data view access control list |
| 400 Bad Request | error | The request is not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized to update the requested data view's access control list |
| 404 Not Found | error | The requested data view was not found
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

### .NET client libraries method
```csharp
   Task UpdateDataViewAccessControlAsync(string id, AccessControlList acl);
```

## `Get Data View Access Rights`
Get access rights to the requested data view for the calling user or client.

### Request
```text
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/AccessRights
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Response
The response includes a status code and a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `string[]` | A list of access rights to the requested data view |
| 403 Forbidden | error | You are not authorized to make this request |
| 404 Not Found | error | The requested data view was not found
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body
```json
HTTP 200 OK
[
  "Read",
  "Write",
  "Delete",
  "ManageAccessControl"
]
```

### .NET client libraries method
```csharp
   Task<string[]> GetDataViewAccessRightsAsync(string id);
```


## `Get Data View Owner`
Get the owner [`Trustee`](xref:accessControl#owner) of the specified data view.

### Request
```text
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/owner
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Response
The response includes a status code and a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `Trustee` | The owner of the requested data view |
| 403 Forbidden | error | You are not authorized to view the requested data view's owner |
| 404 Not Found | error | The requested data view was not found
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body
```json
HTTP 200 OK
Content-Type: application/json
{
    "Type": User,
    "TenantId": "55555555-5555-5555-5555-555555555555",
    "ObjectId": "44444444-4444-4444-4444-444444444444"
}
```

### .NET client libraries method
```csharp
   Task<Trustee> GetDataViewOwnerAsync(string id);
```

## `Update Data View Owner`
Update the owner [`Trustee`](xref:accessControl#owner) of the specified data view.

### Request
```text
PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/owner
```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Request body
A [`Trustee`](xref:accessControl#owner)

#### Example request body
```json
{
    "Type": User,
    "TenantId": "55555555-5555-5555-5555-555555555555",
    "ObjectId": "44444444-4444-4444-4444-444444444444"
}
```

### Response
The response includes a status code and, in some cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 204 No Content | (empty) | Successfully updated the data view owner |
| 400 Bad Request | error | The request is not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized to update the requested data view's owner |
| 404 Not Found | error | The requested data view was not found
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

### .NET client libraries method
```csharp
   Task UpdateDataViewOwnerAsync(string id, Trustee owner);
```
