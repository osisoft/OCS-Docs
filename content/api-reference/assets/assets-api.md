---
uid: AssetsAPI
---

# Assets API

The Assets API allows you to create, read, update, and delete assets. 

The asset feature supports the HTTP entity tag (ETag) and If-Match for conditional requests. When a `GET` call is performed, the HTTP response header includes an Etag which indicates what version of the asset resource will be retrieved.

See [Asset and AssetType Access Control API](xref:AssetOrAssetTypeAccessControlAPI), [Asset Centric Data API](xref:AssetCentricDataAPI), and [Assets Search API](xref:AssetsSearchAPI) for additional API details.

#### Example Etag Response Header
This is version 7 of this particular asset.

```
Etag: "7"
```

To edit or delete the asset, specify `If-Match` in the HTTP request header when calling `DELETE` or `PUT`.

#### Example If-Match Response Header
Modify or delete only if the current asset matches version 7. Otherwise, do not perform this operation. If this condition fails, return a 412. 

```
If-Match : "7"
```

**Note:** `If-Match` is optional. If you want to delete or modify an asset regardless of the asset version, do not specify an `If-Match`.

***

## `Get Asset by Id` 
Returns the specified asset and the version Etag in the HTTP response header.

### Request 
``` 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}  
```

### Parameters  
`string tenantId`  
Tenant identifier

`string namespaceId`  
Namespace identifier

`string assetId`  
Asset identifier

### Response 

The response includes a status code and a response body. 

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | `Asset` | The requested asset. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset. |
| 404 Not Found | error | The asset with the specified identifier is not found. |

#### Example response body
```json 
HTTP 200 OK 
Content-Type: application/json
{
    "Id": "Heater_01_01_02",
    "Name": "HeaterOnFirstFloor",
    "Description": "This is Asset which represents a heater on the first floor.",
    "Metadata": [
        {
            "Id": "17020d80-1dc8-4690-932f-3421c9cff0d1",
            "Name": "ModelNumber",
            "Description": "This is attribute with double value representing the model number.",
            "SdsTypeCode": "Double",
            "Value": 1.3
        }
    ],
    "StreamReferences": [
        {
            "Id": "63c0ba1d-f2db-4b28-b650-7e45afca9ab4",
            "Name": "Data",
            "Description": "This is reference to a stream. The stream has data coming from a heater.",
            "StreamId": "PI_bifrostbigdaddy_1"
        }
    ]
}
```
***

## `Get Assets` 
Returns an array of assets and the total number of assets returned, specified as `Total-Count` in the HTTP response header. 

### Request 
```
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets?skip={skip}&count={count} 
```

### Parameters  
`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

[optional] `int skip`   
Optional parameter representing the zero-based offset of the first asset to retrieve. If not specified, a default value of 0 is used.

[optional] `int count`   
Optional parameter, between 1 and 1000 (inclusive), that represents the maximum number of retrieved assets. If not specified, the default is 100.

### Response 
The response includes a status code and a body. 

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | `Asset[]` | A page of assets. A response header, `Total-Count`, indicates the total size of the collection. |
| 204 No Content | none | No assets were found or you do not have permission to view assets. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 503 Service Unavailable | error | An error occurred while processing the request. See the response body for additional details. |

***

## `Create Asset` 
Creates a new asset with a specified `Id`. 

If the asset you are trying to create references an asset type (through the `AssetTypeId` property) and if the corresponding asset type has a metadata value with the same `Id`, then the name and SDS type code of the metadata value on the asset must be null. If the asset type does not have metadata value with a corresponding `Id`, the name and SDS type code on the asset cannot be null.

To support flexibility on creation and update, the following rules and behaviors are executed for metadata and stream references on a given asset when that asset is created from an asset type.
### Examples

| Asset values                                      | Metadata values on the asset type                            | How references are resolved                      |
| ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| `Id` = "Metadata Id"​ and `Name` = Not specified   | `Id` matches the asset type's `Metadata` `Id`                | Uses the matching asset type's `Metadata` `Name` |
|                                                   | `Id` does not match any asset type `Metadata` `Id`           | `Id` is used as `Name`                           |
| `Id` = Not specified​ and `Name` = "Metadata Name" | `Name` matches asset type `Metadata` `Name`                  | Use matching asset type `Metadata` `Id`          |
|                                                   | `Name` does not match any asset type `Metadata` `Name`       | GUID is generated for`Id`                        |
| `Id` = "Metadata Id"​ and `Name` = "Metadata Name" | Either `Id` or `Name`, but not both, match asset type `Metadata` `Id` or `Name` | Error.                                           |

### Request 
```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId} 
```

### Parameters  
`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetId`  
Asset identifier


#### Request body 
An `asset` object

#### Example request body 
**NOTE:** To create an asset with a specific `Id`, use the API route with `Id`. If this is used, you must specify a matching `Id` field for the asset object in the JSON object below.

```json 
{
    "Name": "HeaterOnFirstFloor",
    "Description": "This is Asset which represents a heater on the first floor.",
    "Metadata": [
        {
            "Id": "c0e29698-d157-4288-9dea-db290de1fb35",
            "Name": "ModelNumber",
            "Description": "This is attribute with double value representing the model number.",
            "SdsTypeCode": "Double",
            "Value": 1.3
        }
    ],
    "StreamReferences": [
        {
            "Id": "a1b1c2cc-0a1d-4d89-b53e-e7db746bb4d2",
            "Name": "Data",
            "Description": "This is reference to a stream. The stream has data coming from a heater.",
            "StreamId": "heaterData_1"
        }
    ]
}
```
### Response 

The response includes a status code, a body, and the Etag version in the HTTP response header.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `Asset`  | The asset as persisted, including values for optional parameters that were omitted in the request.                           |
| 302 Found | Redirect | The asset you attempted to create is identical to one that already exists |
| 400 Bad Request           | error     | The request is not valid. See the response body for additional details.      |
| 403 Forbidden            | error     | You are not authorized to create assets.           |
| 409 Conflict | error     | The asset you attempted to create has a conflict. See the response body for additional details. |

***

## `Create Assets (Bulk create)` 

Creates multiple assets in a single call.

### Request 

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/bulk/Assets 
```

### Parameters  

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

#### Request body 

An array of `asset` objects

### Response 

The response includes a status code and a body. 

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `Asset[]`  | An array of assets as persisted, including values for optional parameters that were omitted in the request.                               |
| 207 Multi-Status          | partial success | Array of errors. Assets that did not encounter errors are created. |
| 400 Bad Request           | error     | The request is not valid. The response includes which asset failed validation checks. See the response body for additional details.     |
| 403 Forbidden             | error     | You are not authorized to create assets.           |
| 409 Conflict              | error      | The asset create has a conflict. See the response body for additional details.  |

***

## `Create or Update Asset` 

Creates or updates an asset with a specified `Id`. If the asset already exists, you can specify an `If-Match` property in the HTTP request header to ensure that the asset is modified only if its version matches.

To support flexibility, on creation and update, the following rules and behaviors are executed for metadata and stream references on a given asset when that asset is from an asset type.
### Examples
| Asset values                                      | Metadata values on the asset type                            | How references are resolved                                  |
| ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `Id` = "Metadata Id"​ and `Name` = Not specified   | `Id` matches the asset type's `Metadata` `Id`                | Uses the matching asset type `Metadata` `Name`               |
|                                                   | `Id` matches the existing asset type's `Metadata` `Id`       | Uses the existing matching `Metadata` `Name`                 |
|                                                   | `Id` does not match any asset type `Metadata` `Id`           | `Id` is used as `Name`                                       |
| `Id` = Not specified​ and `Name` = "Metadata Name" | `Name` matches the asset type's `Metadata` `Name`            | Uses the matching asset type `Metadata` `Id`                 |
|                                                   | `Name` matches the existing asset type's `Metadata` `Name`   | Uses the matching existing asset type `Metadata` `Id`        |
|                                                   | `Name` does not match any asset type `Metadata` `Name`       | GUID is generated for `Id`                                   |
| `Id` = "Metadata Id"​ and `Name` = "Metadata Name" | Only `Id` or `Name` (not both) matches asset type `Metadata`  `Id` or `Name` | Error.                                                       |
|                                                   | Only `Id` or `Name` (not both) matches existing asset type `Metadata`  `Id` or `Name` | The non-matching `Id` or `Name` of the existing `Metadata` is updated |

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId} 
```

### Parameters  

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetId`  
Asset identifier

#### Request body 

The newly created or updated `asset` object.

#### Asset Type Concordance

If an asset type `Id` is specified for an asset, then the following is true:
- The stream references name of an asset is set to null if the stream reference `Id` matches the stream reference `Id` of the asset type.
- If the asset and asset type have a metadata value with the same `Id`, then the `Name` property on the asset is set to null. 

### Response 

The response includes a status code, body, and Etag version in the HTTP response header. 

| Status Code              | Body Type | Description                                     |
| -------------------------| --------- | ----------------------------------------------- |
| 200 OK                   | `Asset`  | The newly created or updated asset as persisted, including values for optional parameters that were omitted in the request.                               |
| 400 Bad Request          | error     | The request is not valid. The response includes which asset failed validation checks. See the response body for additional details.    |
| 403 Forbidden            | error     | You are not authorized to update assets. |
| 404 Not Found            | error     | The asset, with the specified identifier, was not found.            |
| 409 Conflict             | error     | The asset update or create has a conflict. See the response body for additional details. |
| 412 Pre-Condition Failed | error     | The asset failed to update because the If-Match condition failed.  |

***

## `Delete Asset` 

Deletes an asset with a specified `Id`. You can include an `If-Match` property in the HTTP request header to specify the asset version. The asset is deleted only if the version matches.

### Request 

```text 
DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}   
```

### Parameters  

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string assetId`  
Asset identifier

#### Request body 

None

### Response 

The response includes a status code and a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 204 No Content            | none  | The asset with the specified `Id` is deleted.                              |
| 400 Bad Request           | error     | The request is not valid. The response includes which asset failed validation checks. See the response body for additional details.      |
| 403 Forbidden             | error     | You are not authorized to delete this asset.       |
| 404 Not Found             | error     | The asset with the specified `Id` could not be found.  |
| 412 Pre-Condition Failed  | error     | The asset failed to update because the `If-Match` condition failed. |

## `Delete Asset (bulk)`

Deletes all assets with the specified Ids. Use this API to delete up to a maximum of 1000 assets in one API call.

### Request 

```text 
DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/bulk/Assets?id={assetId_1}[&id={assetId_n}]
```

### Parameters  

`string tenantId`   
Tenant identifier

`string namespaceId`   
Namespace identifier

`string[] id`  
Parameter consisting of the asset Ids that you want to delete.

### Response 

The response includes a status code and a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 204 No Content            | none  | The assets with the specified `Id`s are deleted.                              |
| 207 Multi-Status | partial success | Array of errors. Assets that did not encounter errors are deleted. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
