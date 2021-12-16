---
uid: assets-asset-centric-data

---

# Asset Centric Data
The asset centric data API provides a quick way to retrieve data stored in an asset's referenced streams.

## `Get Last Data`

<a id="opIdResolvedAssetData_Get Last Data"></a>

Returns the last stored value for SDS streams in the resolved asset.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Last
?stream={stream}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>
`[optional] array stream`
<br/>Optional parameter consisting of a comma-separated list of stream reference names in form of `stream={streamReferenceName}` for each stream you are interested in. By default, all data calls return data for all stream references.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataResults](#schemadataresults)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Results": {
    "StreamReferenceWithEventsName": [
      {
        "Timestamp": "2019-01-02T01:00:00Z",
        "Temp": 155.5,
        "Pres": 1
      }
    ]
  },
  "Errors": null
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---

## `Get Sampled Data`

<a id="opIdResolvedAssetData_Get Sampled Data"></a>

Returns sampled data for referenced SDS streams.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Sampled
?startIndex={startIndex}&endIndex={endIndex}&intervals={intervals}&stream={stream}&boundaryType={boundaryType}&startBoundaryType={startBoundaryType}&endBoundaryType={endBoundaryType}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>`string startIndex`
<br/>The start index for the intervals.<br/><br/>`string endIndex`
<br/>The end index for the intervals.<br/><br/>`integer intervals`
<br/>Number of intervals requested.<br/><br/>
`[optional] array stream`
<br/>Optional parameter consisting of a comma-separated list of stream reference names in form of `stream={streamReferenceName}` for each stream you are interested in. By default, all data calls return data for all stream references.<br/><br/>`[optional] any boundaryType`
<br/>Optional SdsBoundaryType specifies the handling of events at or near the startIndex and endIndex.<br/><br/>`[optional] any startBoundaryType`
<br/>Optional SdsBoundaryType specifies the handling of events at or near the startIndex.<br/><br/>`[optional] any endBoundaryType`
<br/>Optional SdsBoundaryType specifies the handling of events at or near the endIndex.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataResults](#schemadataresults)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Results": {
    "StreamReferenceWithEventsName": [
      {
        "Timestamp": "2019-01-02T00:00:00Z",
        "Temp": 0.044,
        "Pres": 1
      },
      {
        "Timestamp": "2019-01-02T00:16:38Z",
        "Temp": 998.046,
        "Pres": 1
      },
      {
        "Timestamp": "2019-01-02T01:00:00Z",
        "Temp": 155.5,
        "Pres": 1
      }
    ]
  },
  "Errors": null
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---

## `Get Summary Data`

<a id="opIdResolvedAssetData_Get Summary Data"></a>

Returns summary data for referenced SDS streams.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Summaries
?startIndex={startIndex}&endIndex={endIndex}&stream={stream}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>`string startIndex`
<br/>The start index for the intervals.<br/><br/>`string endIndex`
<br/>The end index for the intervals.<br/><br/>
`[optional] array stream`
<br/>Optional parameter consisting of a comma-separated list of stream reference names in form of `stream={streamReferenceName}` for each stream you are interested in. By default, all data calls return data for all stream references.<br/><br/>`[optional] integer count`
<br/>The number of intervals requested.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataResults](#schemadataresults)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Results": {
    "StreamReferenceWithEventsName": [
      {
        "Start": {
          "Timestamp": "2019-01-01T08:00:00Z",
          "Temp": 0.044,
          "Pres": 1
        },
        "End": {
          "Timestamp": "2019-02-06T20:00:00Z",
          "Temp": 155.5,
          "Pres": 1
        },
        "Summaries": {
          "Count": {
            "Timestamp": 1000,
            "Temp": 1000,
            "Pres": 1000
          },
          "Minimum": {
            "Temp": 0.044,
            "Pres": 1
          },
          "Maximum": {
            "Temp": 998.046,
            "Pres": 1
          },
          "Range": {
            "Temp": 998.0020000000001,
            "Pres": 0
          },
          "Total": {
            "Temp": 498779.61199999356,
            "Pres": 1001
          },
          "Mean": {
            "Temp": 498.28133066933077,
            "Pres": 1
          },
          "StandardDeviation": {
            "Temp": 288.4561823749973,
            "Pres": 0
          },
          "PopulationStandardDeviation": {
            "Temp": 288.31206236481444,
            "Pres": 0
          },
          "WeightedMean": {
            "Temp": 153.11692828545156,
            "Pres": 1
          },
          "WeightedStandardDeviation": {
            "Temp": 25.424619899757136,
            "Pres": 0
          },
          "WeightedPopulationStandardDeviation": {
            "Temp": 25.411917116101474,
            "Pres": 0
          },
          "Skewness": {
            "Temp": 0.0011013861675857883,
            "Pres": "NaN"
          },
          "Kurtosis": {
            "Temp": -1.19976760290962,
            "Pres": "NaN"
          }
        }
      }
    ]
  },
  "Errors": null
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---

## `Get Interpolated Data`

<a id="opIdResolvedAssetData_Get Interpolated Data"></a>

Returns interpolated data for referenced SDS streams.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Interpolated
?startIndex={startIndex}&endIndex={endIndex}&count={count}&stream={stream}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>`string startIndex`
<br/>The index defining the beginning of the window.<br/><br/>`string endIndex`
<br/>The index defining the end of the window.<br/><br/>`integer count`
<br/>The number of events to return. Read characteristics of the stream determine how the events are constructed.<br/><br/>
`[optional] array stream`
<br/>Optional parameter consisting of a comma-separated list of stream reference names in form of `stream={streamReferenceName}` for each stream you are interested in. By default, all data calls return data for all stream references.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataResults](#schemadataresults)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Results": {
    "StreamReferenceWithEventsName": [
      {
        "Timestamp": "2019-01-02T00:00:05Z",
        "Temp": 5.045,
        "Pres": 1
      },
      {
        "Timestamp": "2020-04-12T08:00:00Z",
        "Temp": 3.045,
        "Pres": 11
      },
      {
        "Timestamp": "2020-06-29T05:20:00Z",
        "Temp": 54.045,
        "Pres": 11
      }
    ]
  },
  "Errors": null
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---

## `Get Window Data`

<a id="opIdResolvedAssetData_Get Window Data"></a>

Returns window data for referenced SDS streams.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data
?startIndex={startIndex}&endIndex={endIndex}&stream={stream}&boundaryType={boundaryType}&startBoundaryType={startBoundaryType}&endBoundaryType={endBoundaryType}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>`string startIndex`
<br/>Index bounding the beginning of the series of events to return.<br/><br/>`string endIndex`
<br/>Index bounding the end of the series of events to return.<br/><br/>
`[optional] array stream`
<br/>Optional parameter consisting of a comma-separated list of stream reference names in form of `stream={streamReferenceName}` for each stream you are interested in. By default, all data calls return data for all stream references.<br/><br/>`[optional] any boundaryType`
<br/>Optional SdsBoundaryType specifies handling of events at or near the start and end indexes.<br/><br/>`[optional] any startBoundaryType`
<br/>Optional SdsBoundaryType specifies the first value in the result in relation to the start index. If startBoundaryType is specified, endBoundaryType must be specified.<br/><br/>`[optional] any endBoundaryType`
<br/>Optional SdsBoundaryType specifies the last value in the result in relation to the end index. If startBoundaryType is specified, endBoundaryType must be specified.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataResults](#schemadataresults)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Results": {
    "StreamReferenceWithEventsName": [
      {
        "Timestamp": "2019-01-02T00:00:01Z",
        "Temp": 1.045,
        "Pres": 1
      },
      {
        "Timestamp": "2019-01-02T00:00:02Z",
        "Temp": 2.045,
        "Pres": 1
      },
      {
        "Timestamp": "2019-01-02T00:00:03Z",
        "Temp": 3.045,
        "Pres": 1
      }
    ]
  },
  "Errors": null
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---
## Definitions

### DataResults

<a id="schemadataresults"></a>
<a id="schema_DataResults"></a>
<a id="tocSdataresults"></a>
<a id="tocsdataresults"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Results|object|false|true|None|
|Errors|[DataErrors](#schemadataerrors)|false|true|None|

```json
{
  "Results": {
    "property1": [
      null
    ],
    "property2": [
      null
    ]
  },
  "Errors": {
    "OperationId": "string",
    "Error": "string",
    "Reason": "string",
    "ChildErrors": {
      "property1": null,
      "property2": null
    }
  }
}

```

---

### DataErrors

<a id="schemadataerrors"></a>
<a id="schema_DataErrors"></a>
<a id="tocSdataerrors"></a>
<a id="tocsdataerrors"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|ChildErrors|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}

```

---

### ErrorTemplate

<a id="schemaerrortemplate"></a>
<a id="schema_ErrorTemplate"></a>
<a id="tocSerrortemplate"></a>
<a id="tocserrortemplate"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation identifier|
|Error|string|false|true|Error string|
|Resolution|string|false|true|Resolution string|
|Reason|string|false|true|Error reason string|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}

```

---

### SdsBoundaryType

<a id="schemasdsboundarytype"></a>
<a id="schema_SdsBoundaryType"></a>
<a id="tocSsdsboundarytype"></a>
<a id="tocssdsboundarytype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Exact|0|
|Inside|1|
|Outside|2|
|ExactOrCalculated|3|

---

