


# Access Control API
The Access Control API is used to secure Assets by setting their ownership and permissions. For more information about OCS access control, see Role-based access control. 

***
## `Get Assets Access Control List ` 
Get the default `AccessControlList` for the Assets collection.
[QUESTION: Is Assets capitalized? Assets collection, not Asset collection]

### Request 
```text 

GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Assets 

```

### Parameters  
`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 

### Response

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | The default access control list of the Assets collection |
| 403 Forbidden | error | You are not authorized to view the requested Assets collection's access control list. |

#### Example response body
```json 
HTTP 200 OK
{
    "RoleTrusteeAccessControlEntries": [
        {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessRights": 3
        },
        {
            "Trustee": {
                "Type": 3,
                "ObjectId": "22222222-2222-2222-1111-111111111111"
            },
            "AccessRights": 1
        },
        {
            "Trustee": {
                "Type": 3,
                "ObjectId": "33333333-3333-3333-1111-111111111111"
            },
            "AccessRights": 15
        }
    ]
} 
```

***

## `Update Assets Access Control List` 

Update the default `AccessControlList` for the Assets collection 

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Assets  

```

### Parameters  

`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 


#### Request body 

An `AccessControlList`

### Response 

The response includes a status code and, in some instances, a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 204 No Content                    | (empty)  | Successfully updated the default access control list of the assets collection.                             |
| 400 Bad Request             | error     | The request is not valid. See the response body for details.       |
| 403 Forbidden             | error     | You are not authorized to update the asset collection's default access control list.         |

***

## `Get Asset Access Control List` 

Get the `AssetControlList` of the specified asset 

### Request 

```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/AcessControl 

```

### Parameters  

`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 

`string assetId`

The asset identifier

### Response 
| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `AccessControlList`  | The access control list of the requested asset.                            |
| 403 Forbidden             | error     | You are not authorized to view the access control list of the requested asset.     |
| 404 Not Found             | error     | The requested asset with the specified ID was not found.          |
| 500 Internal Server Error             | error     | An error occurred while processing the request. See the response body for details.       |

#### Example request body 

```json 
HTTP 200 OK
{
    "RoleTrusteeAccessControlEntries": [
        {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessRights": 3
        },
        {
            "Trustee": {
                "Type": 3,
                "ObjectId": "22222222-2222-2222-1111-111111111111"
            }
        }
    ]
}

```
***

## `Update Asset Access Control List` 

Update the `AccessControlList` of the specified asset.

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/AccessControl 

```

### Parameters  

`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 

`string assetId`

The asset identifier
#### Request body 

An `AccessControlList`

### Response 

The response includes a status code and, in some instances, a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 204 No Content                    | (empty)  | Successfully updated the access control list of the specified asset.                             |
| 400 Bad Request             | error     | The request is not valid. See the response body for details.       |
| 403 Forbidden             | error     | You are not authorized to update the access control list of the requested asset.         |
| 404 Not Found             | error     | The requested asset with the specified ID was not found.          |

***

## `Get Asset Access Rights` 

Get the calling user or client's access rights to the requested asset

### Request 

```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/AcessRights                                                                 

```

[QUESTION: iT'S **Assets**/{assetId}, not **Asset**/{assetId}, yes?]

### Parameters  

`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 

`string assetId`

The asset identifier

### Response 

Add API method response.  Enter a description and a type, mention body as well. Use a table to present responses.
Code example can follow. 

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | string[]  | A list of access rights to the requested asset.                              |
| 403 Forbidden             | error     | You are not authorized to request access rights to the specified asset.       |
| 404 Not Found             | error     | The requested asset with the specified ID was not found.          |


#### Example response body

```
HTTP 200 OK
[
    "Read",
    "Write",
    "Delete",
    "ManageAccessControl"
]

```
***

## `Get Asset Owner` 

Get the owner `Trustee` of the specified asset

### Request 

```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Owner

```

### Parameters  

`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 

`string assetId`

The asset identifier

### Response 

The response includes a status code and a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `Trustee`  | The owner of the requested asset.                              |
| 403 Forbidden             | error     | You are not authorized to view the owner of the requested asset.       |
| 404 Not Found             | error     | The requested asset with the specified ID was not found.           |

#### Example response body

```json 
HTTP 200 OK
Content-Type: application/json
{
    "Type": 1,
    "TenantId": "55555555-5555-5555-5555-555555555555",
    "ObjectId": "44444444-4444-4444-4444-444444444444"
}

```
***

## `Update Asset Owner` 

Update the owner `Trustee` of the specified asset.

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Owner

```

[QUESTION: iT's Assets/{assetId}, not AssetId/{assetId}, yes?]

###  Parameters  

`string tenantId` 

The tenant identifier 

`string namespaceId` 

The namespace identifier 

`string assetId`

The asset identifier

#### Request body 

A `Trustee`

#### Example request body 

```json 
{
    "Type": 2,
    "TenantId": "55555555-5555-5555-5555-555555555555",
    "ObjectId": "44444444-4444-4444-4444-444444444444"
}

```

### Response 

The response includes a status code and, in some instances, a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 204 No Content                    | (empty)  | Successfully updated. the asset owner                              |
| 400 Bad Request            | error     | The request is not valid. See the response body for details.      |
| 403 Forbidden             | error     | You are not authorized to update the owner for the requested asset.           |
| 404 Not Found | error     | The requested asset with the specified ID was not found. |
