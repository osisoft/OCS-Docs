---
uid: AssetResolvedAsset
---

# Resolved Asset

The resolved asset describes the consumption-oriented aspects of an OCS resource rather than describing how the resource is configured. 

The resolved asset corresponds to its metadata and referenced stream which define how the data is interpreted (that is, SdsTypeCode, InterpolationMode, and UOM).

***

## `Get Resolved Asset`

Returns the resolved asset.

## Resolved Asset Metadata

The resolved asset metadata is the union of the metadata from the asset and asset type. 

When an asset references an asset type, `Metadata` with the matching identifier will only be evaluated. For these items, metadata name, SdsTypeCode, and UOM will be set to the value on the asset type. The metadata's value, if present, will be taken from the asset metadata. If the asset's metadata SdsTypeCode is different than that on the asset type metadata, the asset's metadata value will be coerced to the SdsTypeCode of the asset type.

The unresolved metadata field will always be an empty list and is reserved for future use.

## Resolved Asset Stream

The list of resolved streams comes from stream reference definitions on the asset that reference existing streams in the SDS (Sequential Data Store). The resolved streams can have a corresponding type reference, but the type reference is not required. The unresolved streams are identified by the stream id rather than the stream name.

An unresolved stream might correspond to a stream reference on the asset that references a stream in SDS that does not exist. An unresolved stream might also correspond to a type reference on an asset type that does not have a corresponding stream reference on the asset. See the reason field in the unresolved stream for the specific reason for the unresolved stream. The unresolved streams are identified by the stream id rather than the stream name.

## Resolved Asset Status

If a status is defined on the asset or asset type, this corresponds to the definition type of the status. Currently, the only supported definition type is "StreamPropertyMapping". If a status is not defined, this field will be null.

For a valid "StreamPropertyMapping" on the asset or asset type, the resolved status contains the stream id and stream property id used in the definition. If a status is not defined or if the status cannot be resolved, this field will be null.

### Request

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Resolved
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

| Status Code     | Body Type        | Description                                                  |
| --------------- | ---------------- | ------------------------------------------------------------ |
| 200 OK          | `Resolved Asset` | The resolved asset.                                          |
| 400 Bad Request | error            | The request is not valid. See the response body for additional details. |
| 403 Forbidden   | error            | You are not authorized to view the requested asset.          |
| 404 Not Found   | error            | The asset with the specified identifier is not found.        |

#### Example response body

```
HTTP 200 OK
Content-Type: application/json
{
  "Id": "Heater-8911ee90-467b-4a3f-bc7b-3b3512c23dfc",
  "Name": "Heater Asset",
  "Resolved": true,
  "Description": "Heater Asset on the first floor.",
  "AssetTypeId": "Heater_AssetType-6f53c911-f5de-4b7f-981f-d6f0ec139d9f",
  "AssetTypeName": "Heater_AssetType",
  "Metadata": [
    {
      "Name": "ModelNumber",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "Streams": [
    {
      "Name": "ResolvedReferenceName1",
      "Type": {
        "Id": "SdsType-ffdf2227-50e8-4196-b828-f1bd2b3689c8",
        "SdsTypeCode": "Object",
        "Properties": [
          {
            "Id": "Timestamp",
            "IsKey": true,
            "SdsType": {
              "Id": "0573b425-368a-369b-95d9-71c863df45a5",
              "SdsTypeCode": "DateTime"
            },
            "InterpolationMode": "Continuous"
          },
          {
            "Id": "Pressure",
            "SdsType": {
              "Id": "9144b7d6-3d5f-3b29-8131-ff0db551e17c",
              "SdsTypeCode": "Double"
            },
            "Uom": "bar",
            "InterpolationMode": "Continuous"
          }
        ]
      },
      "StreamReferenceName": "ResolvedReferenceName1",
      "StreamId": "Stream-b3c7a344-ce8a-4578-b4cd-1a6d78ca0610",
      "PropertyMaps": [
        {
          "Id": "Timestamp",
          "SourcePropertyId": "Timestamp"
        },
        {
          "Id": "Pressure",
          "SourcePropertyId": "Pressure"
        }
      ]
    }
  ],
  "UnresolvedStreams": [ 
        { 
            "Name": "OutputFlow",
            "Reason": "SDS Stream 'PI_Outflow' not found"
        }]
  "UnresolvedMetadata": [],
  "StatusDefinitionType": "StreamPropertyMapping",
  "Status": {
    "StreamId": "SdsStream_id_1",
    "SourcePropertyId": "Count"
  }
}
```

## `Get Resolved Asset (Bulk)`

Returns multiple resolved assets in one call.

### Request
```text
POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Assets/Resolved
```

### Parameters

`string tenantId`    
Tenant identifier

`string namespaceId`  
Namespace identifier

#### Request body 

A list of asset `Id`s.

#### Example request body 
Requesting resolved assets for assets with the following `Id`s: **Asset1**, **Asset2**, and **Asset3**.

```json
[
   "Asset1",
   "Asset2",
   "Asset3"
]
```

### Response

The response includes a list of resolved assets, a status code and a response body.

| Status Code     | Body Type        | Description                                                  |
| --------------- | ---------------- | ------------------------------------------------------------ |
| 200 OK          | `Resolved Asset` List | The resolved assets.                                          |
| 207 Multi-status| `Resolved Asset` List and Error List | The resolved assets and errors for assets which could not be resolved.  |
| 400 Bad Request | error            | The request is not valid. See the response body for additional details. |
