---
uid: AssetStatus
---

# Asset and Asset Type Status

Status is a property of an asset or asset type that defines the simple status of an asset or asset type. There is one status property for each asset or asset type.

If an asset references an existing asset type and the asset type has a corresponding type reference, then the status mapping on the asset is ignored.

Create, read, update, and delete of an asset status mapping is done through the asset or asset type itself.

## Status mapping properties table

The following table lists the most common fields in a status mapping.

| Property            | Type                     | Required? | Searchable? | Description                                                  |
| ------------------- | ------------------------ | --------- | ----------- | ------------------------------------------------------------ |
| Name                | String                   | Optional  | No          | `Name` and `Id` for this status mapping.                     |
| StreamReferenceId   | String                   | Required  | No          | `Id` for the asset's StreamReference property. The stream reference must exist before the status mapping can be created. |
| StreamPropertyId    | String                   | Required  | No          | SDS stream property that status uses for calculations. It must be present on the StreamId property on the asset StreamReference.  The SDS stream property must be a numeric enumeration, character, or string type. |
| ValueStatusMappings | List<ValueStatusMapping> | Required  | No          | The value status mapping maps values to a given status. See [Value status mapping properties table](xref:AssetStatusMapping#value-status-mapping-properties-table) |
<!-- Look at StreamPropertyID again. -->

## Value status mapping properties table

The following table lists the most common fields in a value status mapping. A single value status mapping corresponds to a single status. If you want additional statuses in your asset status mapping, add additional elements in the ValueStatusMapping list.

| Property    | Type               | Required? | Searchable? | Description                                                  |
| ----------- | ------------------ | --------- | ----------- | ------------------------------------------------------------ |
| Value       | Object             | Required  | No          | Value of the value status mapping. The values in a status mapping should be unique. |
| Status      | Status Enumeration | Required  | No          | Description of the value status mapping.                     |
| DisplayName | String             | Optional  | No          | Display name for this value status mapping.                  |

## Status enumerations

The following are valid status enumerations: 

- Unknown = 0
- Good = 1
- Warning = 2
- Bad = 3

## Example status mapping

The following is an example of a status property which is on the asset or asset type.

```
"Status": {
    "Name": "ChargingStationStatus",
    "StreamReferenceId": "Reference1",
    "StreamPropertyId": "Value",
    "ValueStatusMappings": [
        {
            "Value": 0,
            "Status": 0,
            "DisplayName": "Bad"
        }
        {
            "Value": 1,
            "Status": 1,
            "DisplayName": "Good"
        }
    ]
}
```
The asset or asset type's 'StreamReferences' field has an 'Id' property. To assign a status mapping to an asset or asset type, the value assigned to the Id property must match the StreamReferenceId of the status mapping object. Using the status mapping example above, AssetStreamReferenceId1 is assigned to the asset in the following example. 
```
{
  "Id": "ChargingStationAsset", 
   "AssetTypeId": null,
  "Metadata": [{ 
      "Name": "Location",  "Value": "Houston", "SdsTypeCode": 18, "Uom": null​ 
    }], 
    "StreamReferences": [{ 
      "Id": "AssetStreamReferenceId1", 
      "StreamId": "pi2ocs_stream1_inputpower", 
    }] 
} 
```

## `Get Asset Status`

View the status of an asset. 

The status of an asset is determined by an exact match of the Sds stream property value to the value of the ValueStatusMapping. If there are no exact matches, the status is a 0 (Unknown).

### Request

```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/status/last

```

### Parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string assetId`  
The asset identifier

### Response

The response includes a status code and a response body.
| Status Code       | Body Type    | Description                                                  |
| ----------------- | ------------ | ------------------------------------------------------------ |
| 200 OK            | Asset status | On successful GET, asset status is returned.                 |
| 400 Bad Request   | error        | The request is not valid. See the response body for additional details. |
| 403 Forbidden     | error        | You are not authorized to view the requested asset.          |
| 404 Not Found     | error        | The specified asset with identifier is not found.            |
| 422 Invalid State | error        | See the response body for details.                           |

#### Example response body

```
HTTP 200 OK
Content-Type: application/json
{
   "AssetId": "TemperatureSensorAsset",
   "Status": 1, 
   "Value": "85",
   "DisplayName": "TemperatureSensorBuild1InF",
   "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z"
}
```

***

## `Bulk Asset Status`

View the status of multiple assets.

### Request

```text 
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/bulk/assets/status/last

```

### Parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string assetId`  
The asset identifier

#### Example POST body

Lists the asset `Id`s whose status you are interested in.

```
Content-Type: application/json
[
   "AssetId-1",
   "AssetId-2",
   "AssetId-3"
]
```

### Response

The response includes a status code and a response body.

| Status Code      | Body Type         | Description                                                  |
| ---------------- | ----------------- | ------------------------------------------------------------ |
| 200 OK           | Asset status list | On successful POST, returns the status of multiple assets.   |
| 207 Multi Status | Multi Status      | On POST, returns the status of multiple assets. For error responses, check the multi-status response for the error and cause. |

#### Example response body

```
HTTP 200 OK
Content-Type: application/json
{
   [
      {
         "AssetId": "AssetId-1",
         "Status": 1, 
         "Value": "85",
         "DisplayName": "TemperatureSensorBuild1InF",
         "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z"
      },
      {
         "AssetId": "AssetId-2",
         "Status": 2, 
         "Value": "185",
         "DisplayName": "DeviceMeasurement",
         "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z"
      },
      {
         "AssetId": "AssetId-3",
         "Status": 1, 
         "Value": "75",
         "DisplayName": "TemperatureSensorBuild5450InF",
         "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z"
      }
   ]
}
```
