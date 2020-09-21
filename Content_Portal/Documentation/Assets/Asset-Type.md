---
uid: AssetTypeAPI
---

# AssetType API

The asset type API provides methods to create, read, update, and delete asset types. An asset type can be used to build many similar assets. Some of the key benefits of using an asset type as the base model for assets are:

- Multiple similar assets can be created more quickly and with less effort.
- Maintaining assets is simplified. 

***
## Get AssetType by ID
Returns the specified asset type

### Request 
```text 

GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

### Parameters
`string tenantID`   
The tenant identifier

`string namespaceId`   
The namespace identifier

`string assetTypeId`

The asset type identifier

### Authorization
Access to the resources/collection is controlled by ACL (Access Control List) and owner objects.
For more information, see [Role-based access control](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Access_Control.html).

### Response 
The response includes a status code and a response body.

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `AssetType` | The requested asset type. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset type. |
| 404 Not Found | error | The specified asset type with identifier is not found. |

#### Example response body
```json 
HTTP 200 OK
Content-Type: application/json
{
    "Id": "HeaterType",
    "Description": "This is the AssetType which represents a common heater device.",
    "Attributes": [
        {
            "Name": "ModelNumber",
            "Description": "This attribute indicates the model number of a given Asset.",
            "SdsTypeCode": 14,
        }
    ],
    "TypeReferences": [
        {
            "Name": "TemperatureData",
            "TypeId": "PI-Float32"
        }
    ]
}

```

***

## Get AssetTypes 

Returns a list of asset types

### Request 

```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes?skip={skip}&count={count}
```

### Parameters

`string tenantID`   
The tenant identifier

`string namespaceId`   
The namespace identifier

[Optional] `int skip`   
Maximum number of asset types to retrieve. If unspecified, the default (100) is used.

### Authorization

Access to the resources/collection is controlled by ACL (Access Control List) and owner objects.
For more information, see [Role-based access control](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Access_Control.html).

### Response 

The response includes a status code and a body.

| Status Code             | Response Type | Description                                                  |
| ----------------------- | ------------- | ------------------------------------------------------------ |
| 200 OK                  | `AssetType[]` | A page of asset types. A response header, `Total-Count`,  indicates the total size of the collection. |
| 204 No Content          | none          | No asset types found or the user does not have permissions to view  the asset types. |
| 400 Bad Request         | error         | The request is not valid. See the response body for additional details. |
| 503 Service Unavailable | error         | An error occurred while processing the request. See the response body for additional details.  |
***

## `Create AssetType` 

Create a new asset type with a specified ID.

### Request 

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

### Parameters

`string tenantID`   
The tenant identifier

`string namespaceId`   
The namespace identifier

`string assetTypeId`   
The asset type identifier

#### Request body 

An `AssetType` object

#### Example request body 

To create an asset type with a specific ID, use the API route with ID. If this is used, you must specify a  matching ID field for the `AssetType` object in the JSON object below.

```json 
 {
    "Id": "HeaterType",
    "Description": "This is the AssetType which represents a common heater device.",
    "Attributes": [
        {
            "Name": "ModelNumber",
            "Description": "This attribute indicates the model number of a given Asset.",
            "SdsTypeCode": 14,
        }
    ],
    "TypeReferences": [
        {
            "Name": "TemperatureData",
            "TypeId": "PI-Float32"
        }
    ]
}
```

### Authorization

Access to the resources/collection is controlled by ACL (Access Control List) and owner objects.
For more information, see [Role-based access control](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Access_Control.html).

### Response 

The response includes a status code and a body. 

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 200 OK          | `AssetType`   | The `AssetType` as persisted, including values for optional parameters that were omitted in the request. |
| 400 Bad Request | error         | The request is not valid. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to create an `AssetType` object.      |
| 409 Conflict    | error         | The `AssetType` update (?) or create has a conflict. See the response body for additional details. |

***

## `Create AssetTypes (Bulk create)`

Create a new `AssetTypes` object

### Request 

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes

```

### Parameters

`string tenantID`   
The tenant identifier

`string namespaceId`   
The namespace identifier

#### Request body 

A list of `AssetType` objects

### Authorization

Access to the resources/collection is controlled by ACL (Access Control List) and owner objects.
For more information, see [Role-based access control](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Access_Control.html).

### Response 

The response includes a status code and a body.

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 200 OK          | `AssetTypes`  | A list of `AssetType` objects, as persisted, including values for optional parameters that were omitted in the request. |
| 400 Bad Request | error         | The request is not valid. The response will include which `AssetTyp`s objects fail validation checks. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to create `AssetType` objects.        |
| 409 Conflict    | error         | The asset type update or create has a conflict. See the response body for additional details. |

***
## Create or Update AssetType

Create or update an asset type with a specified ID.

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId} 

```

### Parameters

`string tenantID`   
The tenant identifier

`string namespaceId`   
The namespace identifier

`string assetTypeId`   
The asset type identifier

#### Request body 

The newly created or updated `AssetType` object.

### Authorization

Access to the resources/collection is controlled by ACL (Access Control List) and owner objects.
For more information, see [Role-based access control](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Access_Control.html).

### Response 

The response includes a status code and a body. 

| Status Code   | Response Type | Description                                                  |
| ------------- | ------------- | ------------------------------------------------------------ |
| 200 OK        | `AssetType`   | The newly created or updated `AssetType` object, as persisted, including values for optional parameters that were omitted in the request. |
| 403 Forbidden | error         | You are not authorized to update this `AssetType`object.     |
| 404 Not Found | error         | The specified asset type with identifier is not found.       |
| 409 Conflict  | error         | The asset type update or create has a conflict. See the response body for additional details. |

***
## `Delete AssetType` 

Delete an asset type with a specified ID. Note: An `AssetType` object cannot be deleted if it is referenced by an asset. To delete an `AssetType` object, you must first delete all assets that are mapped to it. 

### Request 

```text 
DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

### Parameters   
The tenant identifier

`string namespaceId`   
The namespace identifier

`string assetTypeId`   
The asset type identifier

#### Request body 

None

### Authorization

Access to the resources/collection is controlled by ACL (Access Control List) and owner objects.
For more information, see [Role-based access control](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Access_Control.html).

### Response 

The response includes a status code and a body.

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 200 No Content  | none          | The `AssetType` object with the specified ID has been deleted. |
| 400 Bad Request | error         | The request is not valid. The response will include which items fail validation checks. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to delete this asset type.            |
| 404 Not Found   | error         | The specified asset type object with identifier is not found. |
