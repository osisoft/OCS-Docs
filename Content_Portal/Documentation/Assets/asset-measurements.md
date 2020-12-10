---
uid: AssetMeasurementMappings
---

# Asset Measurement Mappings 

Measurement mappings is a child resource of an asset or asset type and is used to define specific measurements of interest. 

Measurement mappings contain a list of items with named references to one or more stream properties and shaped for easy consumption by client applications. A minimum of one index property (iskey=true) and one non-index property (iskey=false) is required. Within the stream property list, it is important to note that the first property must be an index. In the following example, "Time" as the index property of both streams.

In those instances where an asset references an existing asset type (through the AssetTypeId property), the measurement mappings on the asset are ignored if the asset type has a corresponding type reference. In these instances, the measurement mappings must be configured on the asset type.

## Example

```text 
{  
  "MeasurementMappings": [{ 
      "Name": "Input Power", 
      "StreamReferenceId": "Reference1", 
      "StreamPropertyIds": ["Time", "Value"] 
    }, 
    { 
      "Name": "Voltage", 
      "StreamReferenceId": "Reference2", 
      "StreamPropertyIds": ["Time", "Value"] 
    }] 
} 
```

An asset or asset type uses the mapping by assigning the `StreamReferenceId` in the mapping to the asset or asset type's stream reference. In the example below, `Reference1` and `Reference2`  map to the `MeasurementMappings` object above.

```
{ 
  "Id": "ChargingStation1", 
  "Name": " ChargingStation1", 
  "Description": "Charging Station", 
  "AssetTypeId": null, 
  "Metadata": [{ 
      "Id": "a6641797-bbae-4a2b-ad5b-6159d233d565",  
      "Name": "Location",  
      "Value": "Houston", 
      "SdsTypeCode": 18, 
      "Uom": null 
    }], 
    "StreamReferences": [{ 
      "Id": "Reference1", 
      "Name": "InputPowerStream1", 
      "StreamId": "pi2ocs_stream1_inputpower", 
    }, 
    { 
     "Id": "Reference2", 
      "Name": "InputPowerStream2", 
      "StreamId": "pi2ocs_stream2_voltage", 
   }] 
} 
```

For stream `pi2ocs_stream1_inputpower`, we are only interested in the Value and Time stream properties as defined by the mapping. 

***

## `Get MeasurementMappings` 
Returns the measurement mappings of an asset or asset type. 

### Request 

Asset

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/MeasurementMappings
```
Asset Type

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/MeasurementMappings
```

### Parameters
`string tenantId`  
The tenant identifier 

`string namespaceId`  
The namespace identifier

`string assetId`  
The asset identifier

`string assetTypeId`  
The asset type identifier

### Response 
Add API method response.  Enter a description and a type, mention body as well. Use a table to present responses.
Code example can follow. 

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `MeasurementMappings` | The requested measurement mappings of a given asset or asset type. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset or asset type. |
| 404 Not Found | error | The specified asset or asset type with identifier is not found. |

#### Example response body

```json 
HTTP 200 OK
Content-Type: application/json
{
  "MeasurementMappings": [{ 
      "Name": "Input Power", 
      "StreamReferenceId": "Reference1", 
      "StreamPropertyIds": ["Value", "Time"] 
    }, 
    { 
      "Name": "Voltage", 
      "StreamReferenceId": "Reference2", 
      "StreamPropertyIds": ["Value", "Time"]
    }] 
} 
```

***


## `Update MeasurementMappings` 

Updates the measurement mappings for a given asset or asset type. 

For an asset measurement mappings, you can specify an If-Match property in the HTTP request header to specify that the asset is modified only if the asset version matches. The If-Match property is not available for asset types.

### Request 

Asset

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/MeasurementMappings
```

Asset Type

```text
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/MeasurementMappings
```

### Parameters

`string tenantId`   
The tenant identifier 

`string namespaceId`   
The namespace identifier

`string assetId`  
The asset identifier

`string assetId`  
The asset type identifier

### Response 

The response includes a status code and a response body. 

| Status Code     | Response Type | Description                                                  |
| --------------- | ------------- | ------------------------------------------------------------ |
| 204 OK          | no content    | On successful POST, HTTP Response 204 (no content) is returned. |
| 400 Bad Request | error         | The request is not valid. See the response body for additional details. |
| 403 Forbidden   | error         | You are not authorized to view the requested asset or asset type. |
| 404 Not Found   | error         | The specified asset or asset type is not found.          |
| 412 Pre-Condition Failed | error | The asset failed to update because the If-Match condition failed. |
