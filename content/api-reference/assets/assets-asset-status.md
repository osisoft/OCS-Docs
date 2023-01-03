---
uid: assets-asset-status

---

# Asset Status

## `Get Last Asset Status Data`

<a id="opIdAssetStatusData_Get Last Asset Status Data"></a>

Returns status of an asset. Status of an asset is determined by an exact match of the Sds stream property value to the value of the ValueStatusMapping. If there are no exact matches, the status is a 0 (Unknown).

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Status/Last
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[LastStatusData](#schemalaststatusdata)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|422|[ErrorTemplate](#schemaerrortemplate)|Cannot be processed. See the response body for additional details.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "AssetId": "AssetId-1",
  "Status": "Good",
  "Value": "85",
  "DisplayName": "AssetInGoodState",
  "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z",
  "Index": "2019-01-02T00:00:00Z"
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

## `Get Asset Status Range Summary Data`

<a id="opIdAssetStatusData_Get Asset Status Range Summary Data"></a>

Returns status summary of an asset. Statistics are computed using 'StepwiseContinuousLeading' for interpolation and ‘Forward’ for extrapolation with regard to the status stream property, without regard to the actual interpolation or extrapolation modes configured in SDS for that property.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Status/Summary
?startIndex={startIndex}&endIndex={endIndex}&intervals={intervals}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>`string startIndex`
<br/>Start index.<br/><br/>`string endIndex`
<br/>End index.<br/><br/>`integer intervals`
<br/>Number of intervals.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[StatusRangeSummary](#schemastatusrangesummary)|Last status of the specified asset.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|422|[ErrorTemplate](#schemaerrortemplate)|Cannot be processed. See the response body for additional details.|
|502|None|Bad gateway.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "RangeValues": [
    {
      "Index": "2019-01-02T00:00:00Z",
      "Status": "Warning",
      "Value": 2,
      "DisplayName": "AssetInWarning"
    },
    {
      "Index": "2019-01-02T00:30:00Z",
      "Status": "Bad",
      "Value": 4,
      "DisplayName": "AssetInBadState"
    }
  ],
  "Statistics": [
    {
      "Status": "Warning",
      "TotalInterval": "00:30:00",
      "Values": [
        {
          "Value": 2,
          "Interval": "00:30:00"
        }
      ]
    },
    {
      "Status": "Bad",
      "TotalInterval": "1246.06:30:00",
      "Values": [
        {
          "Value": 4,
          "Interval": "1246.06:30:00"
        }
      ]
    }
  ]
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

# Asset Status

## `Get Bulk Last Status Data For Assets`

<a id="opIdRequestManager_Get Bulk Last Status Data For Assets"></a>

Returns status of multiple assets.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Assets/Status/Last
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

Asset identifiers<br/>

```json
[
  "AssetId-1",
  "AssetId-2",
  "AssetId-3"
]
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[MultiStatusResultOfLastStatusDataAndChildErrorTemplate](#schemamultistatusresultoflaststatusdataandchilderrortemplate)|Last status of assets in the body.|
|207|[MultiStatusResultOfLastStatusDataAndChildErrorTemplate](#schemamultistatusresultoflaststatusdataandchilderrortemplate)|Partial success. Some assets encountered errors. See response body for additional details.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "AssetId": "AssetId-1",
    "Status": 1,
    "Value": "85",
    "DisplayName": "TemperatureSensorBuild1InF",
    "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z"
  },
  {
    "AssetId": "AssetId-2",
    "Status": 2,
    "Value": "185",
    "DisplayName": "DeviceMeasurement",
    "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z"
  }
]
```

> 207 Response ([MultiStatusResultOfLastStatusDataAndChildErrorTemplate](#schemamultistatusresultoflaststatusdataandchilderrortemplate))

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "AssetId": "AssetId-1",
      "Status": "Good",
      "Value": "85",
      "DisplayName": "AssetInGoodState",
      "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z",
      "Index": "2019-01-02T00:00:00Z"
    }
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Resolution": "string",
      "Reason": "string",
      "StatusCode": 0,
      "property1": null,
      "property2": null
    }
  ]
}
```

---
## Definitions

### LastStatusData

<a id="schemalaststatusdata"></a>
<a id="schema_LastStatusData"></a>
<a id="tocSlaststatusdata"></a>
<a id="tocslaststatusdata"></a>

Asset's last status

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Index|any|false|true|Index which the status was last updated|
|Status|[StatusEnum](#schemastatusenum)|false|false|Status enumeration. Valid values are: Unknown, Good, Warning and Bad.|
|Value|any|false|true|Value of the last data retrieved|
|DisplayName|string|false|true|Status display name|
|AssetId|string|false|true|Asset identifier|
|DataRetrievalTime|date-time|false|false|Date and time when the status was last updated.|

```json
{
  "AssetId": "AssetId-1",
  "Status": "Good",
  "Value": "85",
  "DisplayName": "AssetInGoodState",
  "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z",
  "Index": "2019-01-02T00:00:00Z"
}

```

---

### StatusEnum

<a id="schemastatusenum"></a>
<a id="schema_StatusEnum"></a>
<a id="tocSstatusenum"></a>
<a id="tocsstatusenum"></a>

Pre-defined asset status values.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Unknown|0|Pre-defined asset status values.|
|Good|1|Pre-defined asset status values.|
|Warning|2|Pre-defined asset status values.|
|Bad|3|Pre-defined asset status values.|

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

### StatusRangeSummary

<a id="schemastatusrangesummary"></a>
<a id="schema_StatusRangeSummary"></a>
<a id="tocSstatusrangesummary"></a>
<a id="tocsstatusrangesummary"></a>

Returns the status summary of an asset.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|RangeValues|[[StatusData](#schemastatusdata)]|false|true|Status values|
|Statistics|[[StatusValueStatistics](#schemastatusvaluestatistics)]|false|true|Status data statistics|

```json
{
  "RangeValues": [
    {
      "Index": "2019-01-02T00:00:00Z",
      "Status": "Warning",
      "Value": 2,
      "DisplayName": "AssetInWarning"
    },
    {
      "Index": "2019-01-02T00:30:00Z",
      "Status": "Bad",
      "Value": 4,
      "DisplayName": "AssetInBadState"
    }
  ],
  "Statistics": [
    {
      "Status": "Warning",
      "TotalInterval": "00:30:00",
      "Values": [
        {
          "Value": 2,
          "Interval": "00:30:00"
        }
      ]
    },
    {
      "Status": "Bad",
      "TotalInterval": "1246.06:30:00",
      "Values": [
        {
          "Value": 4,
          "Interval": "1246.06:30:00"
        }
      ]
    }
  ]
}

```

---

### StatusData

<a id="schemastatusdata"></a>
<a id="schema_StatusData"></a>
<a id="tocSstatusdata"></a>
<a id="tocsstatusdata"></a>

Status data that is assocated with asset.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Index|any|false|true|Index which the status was last updated|
|Status|[StatusEnum](#schemastatusenum)|false|false|Status enumeration. Valid values are: Unknown, Good, Warning and Bad.|
|Value|any|false|true|Value of the last data retrieved|
|DisplayName|string|false|true|Status display name|

```json
{
  "Index": "2019-01-02T00:00:00Z",
  "Status": "Warning",
  "Value": 2,
  "DisplayName": "AssetInWarning"
}

```

---

### StatusValueStatistics

<a id="schemastatusvaluestatistics"></a>
<a id="schema_StatusValueStatistics"></a>
<a id="tocSstatusvaluestatistics"></a>
<a id="tocsstatusvaluestatistics"></a>

Status value statistics returns asset status statistics

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Status|[StatusEnum](#schemastatusenum)|false|false|Asset status|
|TotalInterval|any|false|true|Total interval|
|Values|[[UnderlyingValueStatistics](#schemaunderlyingvaluestatistics)]|false|true|Asset status statistics per interval|

```json
{
  "Status": 0,
  "TotalInterval": null,
  "Values": [
    {
      "Value": null,
      "Interval": null,
      "DisplayName": "string"
    }
  ]
}

```

---

### UnderlyingValueStatistics

<a id="schemaunderlyingvaluestatistics"></a>
<a id="schema_UnderlyingValueStatistics"></a>
<a id="tocSunderlyingvaluestatistics"></a>
<a id="tocsunderlyingvaluestatistics"></a>

Underlying value statistics represents statistics for a single interval

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|any|false|true|Value of the status mapping.|
|Interval|any|false|true|Summary interval|
|DisplayName|string|false|true|User-friendly display name for that status mapping|

```json
{
  "Value": null,
  "Interval": null,
  "DisplayName": "string"
}

```

---

### MultiStatusResultOfLastStatusDataAndChildErrorTemplate

<a id="schemamultistatusresultoflaststatusdataandchilderrortemplate"></a>
<a id="schema_MultiStatusResultOfLastStatusDataAndChildErrorTemplate"></a>
<a id="tocSmultistatusresultoflaststatusdataandchilderrortemplate"></a>
<a id="tocsmultistatusresultoflaststatusdataandchilderrortemplate"></a>

A multi status result is returned to indicate a partial success.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Reason|string|false|true|Failure reason.|
|Error|string|false|true|Error string|
|OperationId|string|false|true|Operational identifier of the call. Used for support.|
|Data|[[LastStatusData](#schemalaststatusdata)]|false|true|Requested information from call.|
|ChildErrors|[[ChildErrorTemplate](#schemachilderrortemplate)]|false|true|Child error pertaining to specific resources.|

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "AssetId": "AssetId-1",
      "Status": "Good",
      "Value": "85",
      "DisplayName": "AssetInGoodState",
      "DataRetrievalTime": "2020-05-04T16:55:26.3732693Z",
      "Index": "2019-01-02T00:00:00Z"
    }
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Resolution": "string",
      "Reason": "string",
      "StatusCode": 0,
      "property1": null,
      "property2": null
    }
  ]
}

```

---

### ChildErrorTemplate

<a id="schemachilderrortemplate"></a>
<a id="schema_ChildErrorTemplate"></a>
<a id="tocSchilderrortemplate"></a>
<a id="tocschilderrortemplate"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation identifier|
|Error|string|false|true|Error string|
|Resolution|string|false|true|Resolution string|
|Reason|string|false|true|Error reason string|
|StatusCode|int32|false|false|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "StatusCode": 0,
  "property1": null,
  "property2": null
}

```

---

