

# Assets API

The Assets API allows you to create, read, update, and delete assets. 
See Access Control API, Asset Centric API, and Assets Search API for additional API methods.
[QUESTION: is "methods" the correct term? I'll add links to the topics later.]

***

## `Get Asset by Id` 
Returns the specified asset

### Request 
``` 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}  

```

### Parameters  
`string tenantId` 

The tenant identifier

`string namespaceId` 

The namespace identifier

`string assetID`

The asset identifier

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
    "Attributes": [
        {
            "Name": "ModelNumber",
            "Description": "This is attribute with double value representing the model number.",
            "SdsTypeCode": 14,
            "Value": 1.3
        }
    ],
    "References": [
        {
            "Name": "Data",
            "Description": "This is reference to a stream. The stream has data coming from a heater.",
            "ReferenceType": "StreamReference",
            "Value": {
                "StreamId": "PI_bifrostbigdaddy_1",
                "TypeId": "PI-Float32"
            }
        }
    ]
}
```
***

## `Get Assets` 
Returns an array of assets 

### Request 
```

GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets?skip={skip}&count={count} 

```

### Parameters  
`string tenantId` 

The tenant identifier

`string namespaceId` 

The namespace identifier

`[optional] int skip` 

An optional parameter representing the zero-based offset of the first retrieved asset. If not specified, a default value of 0 is used.

`[optional] int count` 

An optional parameter representing the maximum number of retrieved assets. If not specified, a default value of 100 is used. 

### Response 
Add API method response.  Enter a description and a type, mention body as well. Use a table to present responses.
Code example can follow. 

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | `Asset[]` | A page of assets. A response header, `Total-Count`, indicates the total size of the collection. |
| 204 No Content | none | No assets were found or the user does not have permission to view assets. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 503 Service Unavailable | error | An error occurred while processing the request. See the response body for additional details. |

***

## `Create Asset` 
Create a new asset with a specified ID. 

### Request 
```text 

POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId} 

```

### Parameters  
`string tenantId` 

The tenant identifier

`string namespaceId` 

The namespace identifier

`string assetID`

The asset identifier


#### Request body 
An `asset` object.

#### Example request body 
NOTE: To create an asset with a specific ID, use the API route with id. If this is used, you must specify a matching ID field for the asset object in the JSON object below. [Can you explain this?]
[QUESTION: Can you creat an asset without specifying an ID? Why would you want to specify an ID?] 
```json 
{
    "Name": "HeaterOnFirstFloor",
    "Description": "This is Asset which represents a heater on the first floor.",
    "Attributes": [
        {
            "Name": "ModelNumber",
            "Description": "This is attribute with double value representing the model number.",
            "SdsTypeCode": 14,
            "Value": 1.3
        }
    ],
    "References": [
        {
            "Name": "Data",
            "Description": "This is reference to a stream. The stream has data coming from a heater.",
            "ReferenceType": "StreamReference",
            "Value": {
                "StreamId": "heaterData_1",
            }
        },
        {
            "Name": "StreamView",
            "Description": "This is reference to a stream view, the user is only interested in sds stream properties specified in the sds stream view.",
            "ReferenceType": "StreamReference",
            "Value": {
                "StreamViewId": "ViewShowOnlyPressure",
                "StreamId": "ComplexSdsStream"
            }
        }
    ]
}
```
### Response 

The response includes a status code and a body. 

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `Asset`  | An array of assets as persisted, including values for optional parameters that were omitted in the request.                               |
| 400 Bad Request             | error     | The request is not valid. The response will include which asset failed validation checks. See the response body for additional details.      |
| 403 Forbidden            | error     | The user is not authorized to create assets.           |
| 409 Conflict | error     | The asset update (?) or create has a conflict. See the response body for additional details. |

***

## `Create Assets (Bulk create)` 

Create multiple assets.  

### Request 

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets   

```

### Parameters  

`string tenantId` 

The tenant identifier

`string namespaceId` 

The namespace identifier

#### Request body 

An array of `asset` objects.

### Response 

The response includes a status code and a body. 

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `Asset`  | An array of assets as persisted, including values for optional parameters that were omitted in the request.                               |
| 400 Bad Request             | error     | The request is not valid. The response will include which asset failed validation checks. See the response body for additional details.      |
| 403 Forbidden            | error     | The user is not authorized to create assets.           |
| 409 Conflict | error     | The asset update (?) or create has a conflict. See the response body for additional details. |

***

## `Create or Update Asset` 

Create or update an asset with a specified ID. 
[QUESTION: How is this different from Create Asset]

### Request 

```text 
PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId} 

```

### Parameters  

.`string tenantId` 

The tenant identifier

`string namespaceId` 

The namespace identifier

`string assetID`

The asset identifier

#### Request body 

The newly created (?) or updated `asset` object.

### Response 

The response includes a status code and body. 

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 200 OK                    | `Asset`  | The newly created or updated asset as persisted, including values for optional parameters that were omitted in the request.                               |
| 400 Bad Request             | error     | The request is not valid. The response will include which asset failed validation checks. See the response body for additional details.      |
| 403 Forbidden            | error     | The user is not authorized to create assets.           |
| 404 Not Found            | error     | The asset, with the specified identifier, was not found.            |
| 409 Conflict | error     | The asset update or create (?) has a conflict. See the response body for additional details. |

***

## `Delete Asset` 

Delete an asset with a specified ID.

### Request 

```text 
DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}   

```

### Parameters  

`string tenantId` 

The tenant identifier

`string namespaceId` 

The namespace identifier

`string assetID`

The asset identifier

#### Request body 

None

### Response 

The response includes a status code and a body.

| Status Code               | Body Type | Description                                     |
| ------------------------- | --------- | ----------------------------------------------- |
| 204 No Content                    | none  | The asset with the specified ID is deleted.                              |
| 400 Bad Request             | error     | The request is not valid. The response will include which asset failed validation checks. See the response body for additional details.       |
| 403 Forbidden             | error     | The user is not authorized to delete this asset.       |
| 404 Not Found             | error     | The asset with the specified ID could not be found. 
