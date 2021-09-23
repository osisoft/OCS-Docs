---
uid: AssetTypesAPI
---

# Asset Types API

The asset type API provides methods to create, read, update, and delete asset types. An asset type can be used to build many similar assets. Some of the key benefits of using an asset type as the base model for assets are:

- Multiple similar assets can be created more quickly and with less effort.
- Maintaining assets is simplified. 

***
## `Get AssetType by Id`
Returns the specified asset type.

### Request 
```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

### Parameters
`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetTypeId`  
Asset type identifier

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
    "Name": "NameOfHeaterType",
    "Description": "This is the AssetType which represents a common heater device.",
    "Metadata": [
        {
            "Id": "MetadataId1",
            "Name": "ModelNumber",
            "Description": "This metadata indicates the model number of a given Asset.",
            "SdsTypeCode": "Double",
        }
    ],
    "TypeReferences": [
        {
            "StreamReferenceId": "TypeReferenceId1",
            "StreamReferenceName": "TemperatureData",
            "TypeId": "PI-Float32"
        }
    ]
}

```

***

## `Get AssetTypes` 

Returns a list of asset types and the total number of returned asset types, specified as `Total-Count` in the HTTP response header.

### Request 

```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes?skip={skip}&count={count}
```

### Parameters

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

[Optional] `int skip`   
Optional parameter representing the zero-based offset of the first asset type to retrieve. If not specified, a default value of 0 is used.

[Optional] `int count`  
Optional parameter, between 1 and 1000 (inclusive), that represents the maximum number of retrieved asset types. If not specified, the default is 100.

### Response 

The response includes a status code and a body.

| Status Code             | Response Type | Description                                                  |
| ----------------------- | ------------- | ------------------------------------------------------------ |
| 200 OK                  | `AssetType[]` | A page of asset types. A response header, `Total-Count`,  indicates the total size of the collection. |
| 204 No Content          | none          | No asset types found or the user does not have permissions to view  the asset types. |
| 400 Bad Request         | error         | The request is not valid. See the response body for additional details. |
| 503 Service Unavailable | error         | An error occurred while processing the request. See the response body for additional details. |
***

## `Create AssetType` 

Creates a new asset type with a specified identifier.

### Request 

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

### Parameters

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetTypeId`   
Asset type identifier

#### Request body 

An `AssetType` object

#### Example request body 

To create an asset type with a specific identifier, use the API route with identifier. If this is used, you must specify a matching `Id` field for the `AssetType` object in the JSON object below.

```json 
 {
    "Id": "HeaterType",
    "Name": "NameOfHeaterType",
    "Description": "This is the AssetType which represents a common heater device.",
    "Metadata": [
        {
            "Id": "MetadataId1",
            "Name": "ModelNumber",
            "Description": "This metadata indicates the model number of a given Asset.",
            "SdsTypeCode": "Double"
        }
    ],
    "TypeReferences": [
        {
            "Id": "TypeReferenceId1",
            "Name": "TemperatureData",
            "TypeId": "PI-Float32"
        }
    ]
}
```

### Response 

The response includes a status code and a body. 

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 200 OK          | `AssetType`   | The `AssetType` as persisted, including values for optional parameters that were omitted in the request. |
| 302 Found       | Redirect      | The `AssetType` you attempted to create is identical to one that already exists. |
| 400 Bad Request | error         | The request is not valid. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to create an `AssetType` object.      |
| 409 Conflict    | error         | The `AssetType` create has a conflict. See the response body for additional details. |

***

## `Create AssetTypes (Bulk create)`

Creates a new `AssetTypes` object.

### Request 

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/AssetTypes
```

### Parameters

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

#### Request body 

A list of `AssetType` objects

### Response 

The response includes a status code and a body.

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 200 OK          | `AssetTypes`  | A list of `AssetType` objects, as persisted, including values for optional parameters that were omitted in the request. |
| 400 Bad Request | error         | The request is not valid. The response includes which `AssetType` objects fail validation checks. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to create `AssetType` objects.        |
| 409 Conflict    | error         | The asset type update or create has a conflict. See the response body for additional details. |

***
## `Create or Update AssetType`

Creates or updates an asset type with a specified identifer.

When updating an asset type which is referenced by assets, the following behaviors may apply:
- Deleting a metadata value on the asset type removes the metadata value on the resolved asset of any referenced asset​s.
- Renaming a metadata value on the asset type renames the metadata value on the resolved asset of any referenced assets​.
- Renaming the stream reference name on the asset type renames the stream reference on the resolved asset of any referenced assets.

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId} 
```

### Parameters

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetTypeId`   
Asset type identifier

#### Request body 

The newly created or updated `AssetType` object.

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

Deletes an asset type with a specified identifier. An `AssetType` resource cannot be deleted if it is referenced by any assets unless the `deleteAssets` parameter is explicitly set to true. 

### Request 

```text 
DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}?deleteAssets={true|false}
```

### Parameters  

`string tenantId`     
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetTypeId`   
Asset type identifier

`[optional] bool deleteAssets`   
By default, this value is false and if there are assets based on this asset type, a 409 code is returned.  If this value is set to true, then any assets based on this asset type will be deleted along with the asset type in this one call. 

**Caution: This action is not reversible**.  

#### Request body 

None

### Response 

The response includes a status code and a body.

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 200 No Content  | none          | The `AssetType` object with the specified identifier has been deleted. |
| 400 Bad Request | error         | The request is not valid. The response will include which items fail validation checks. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to delete this asset type.            |
| 404 Not Found   | error         | The specified asset type object with identifier is not found. |
| 409 Conflict    | error         | See the response body for additional details. This error typically occurs because assets are mapped to this asset type. |
