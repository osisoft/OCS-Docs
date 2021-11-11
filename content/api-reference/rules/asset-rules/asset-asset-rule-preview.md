---
uid: asset-asset-rule-preview

---

# Asset Rule Preview

## `Get Preview Results`

<a id="opIdAssetRulePreview_Get Preview Results"></a>

Returns a `AssetRulePreviewResult`.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/preview/assetrules
?token={token}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string token`
<br/>A `Guid` which corresponds to a preview that has been created using the `StartPreview` method.<br/><br/>`integer skip`
<br/>An `Int32` to determine the number of preview results to skip.<br/><br/>
`[optional] integer count`
<br/>An `Int32` to determine the number of preview results to return.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AssetRulePreviewResult](#schemaassetrulepreviewresult)|A `AssetRulePreviewResult` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified preview was not found.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Status": "status",
  "Assets": [
    {
      "AssetId": "assetId",
      "ChangeType": "changeType",
      "Asset": {
        "Id": "id",
        "AssetTypeId": "assetTypeId",
        "Name": "name",
        "Description": "description",
        "Metadata": [
          {
            "Id": "id",
            "Name": "name",
            "Description": "description",
            "SdsTypeCode": 18,
            "Value": "value",
            "Uom": "uom"
          }
        ],
        "StreamReferences": [
          {
            "Id": "id",
            "Name": "name",
            "Description": "description",
            "StreamId": "streamId"
          }
        ],
        "Status": {
          "Name": "name",
          "Description": "description",
          "StreamReferenceId": "streamReferenceId",
          "StreamPropertyId": "streamPropertyId",
          "ValueStatusMappings": [
            {
              "Value": "value",
              "Status": 1,
              "DisplayName": "displayName"
            }
          ]
        }
      }
    }
  ],
  "Statistics": {
    "Streams": 1,
    "TotalResults": 1
  }
}
```

> 400 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 403 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 404 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 500 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

---

## `Start Preview`

<a id="opIdAssetRulePreview_Start Preview"></a>

Creates a `RulePreviewResponse` of a `RuleModel` object.

<h3>Request</h3>

```text 
POST /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/preview/assetrules
?KeepOldMetadata={KeepOldMetadata}&Skip={Skip}&Count={Count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] boolean KeepOldMetadata`
<br/>A Boolean to determine whether or not existing metadata created by the rule should be preserved if the rule were deleted.
Defaults to false.<br/><br/>`[optional] integer Skip`
<br/>An Int32 to determine how many results to skip.<br/><br/>`[optional] integer Count`
<br/>An Int32 to determine how many results to return.<br/><br/>

<h4>Request Body</h4>

The RuleModel object to preview.<br/>

```json
{
  "Id": "ruleId",
  "Name": "name",
  "Description": "description",
  "ExampleStreamId": "exampleId",
  "AutomationId": "00000000-0000-0000-0000-000000000000",
  "State": "Started",
  "Expressions": [
    {
      "Field": "Id",
      "Specification": [
        {
          "Type": "Wildcard",
          "Name": "id"
        }
      ]
    }
  ],
  "Outputs": [
    {
      "Field": "Metadata",
      "Value": {
        "key": "{id}"
      }
    }
  ],
  "CreationTime": "0001-01-01T00:00:00",
  "ModifiedTime": "0001-01-01T00:00:00",
  "ErrorInfo": {
    "ErrorCount": 2
  }
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|202|[RulePreviewResponse](#schemarulepreviewresponse)|A `RulePreviewResponse` object.|
|204|[ResponseBody](#schemaresponsebody)|A `RulePreviewResponse` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|
|503|[ResponseBody](#schemaresponsebody)|Dependent service error.|

<h4>Example response body</h4>

> 202 Response

```json
{
  "PreviewLink": "/api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/preview/assetrules?Token=00000000-0000-0000-0000-000000000000",
  "Expires": 7200
}
```

> 204 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 400 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 403 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 500 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

> 503 Response

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

---

## `Cancel Preview`

<a id="opIdAssetRulePreview_Cancel Preview"></a>

Cancels a running preview.

<h3>Request</h3>

```text 
DELETE /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/preview/assetrules
?token={token}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string token`
<br/>A `Guid` which corresponds to a preview that has been created using the `StartPreview` method.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified preview was not found.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

---
## Definitions

### RulePreviewResponse

<a id="schemarulepreviewresponse"></a>
<a id="schema_RulePreviewResponse"></a>
<a id="tocSrulepreviewresponse"></a>
<a id="tocsrulepreviewresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PreviewLink|string|false|true|None|
|Expires|int32|false|false|None|

```json
{
  "PreviewLink": "string",
  "Expires": 0
}

```

---

### ResponseBody

<a id="schemaresponsebody"></a>
<a id="schema_ResponseBody"></a>
<a id="tocSresponsebody"></a>
<a id="tocsresponsebody"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|Parameters|object|false|true|None|

```json
{
  "OperationId": "00000000-0000-0000-0000-000000000000",
  "Error": "Error message.",
  "Reason": "Reason that caused the error.",
  "Resolution": "Possible resolution for the error.",
  "Parameters": {
    "key1": "value1",
    "key2": "value2"
  }
}

```

---

### RuleModel

<a id="schemarulemodel"></a>
<a id="schema_RuleModel"></a>
<a id="tocSrulemodel"></a>
<a id="tocsrulemodel"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|ExampleStreamId|string|false|true|None|
|AutomationId|string|false|true|None|
|State|[RuleStateEnum](#schemarulestateenum)|false|false|None|
|Expressions|[[RuleExpression](#schemaruleexpression)]|false|true|None|
|Outputs|[[RuleOutput](#schemaruleoutput)]|false|true|None|
|CreationTime|date-time|false|false|None|
|ModifiedTime|date-time|false|false|None|

```json
{
  "Id": "ruleId",
  "Name": "name",
  "Description": "description",
  "ExampleStreamId": "exampleId",
  "AutomationId": "00000000-0000-0000-0000-000000000000",
  "State": "Started",
  "Expressions": [
    {
      "Field": "Id",
      "Specification": [
        {
          "Type": "Wildcard",
          "Name": "id"
        }
      ]
    }
  ],
  "Outputs": [
    {
      "Field": "Metadata",
      "Value": {
        "key": "{id}"
      }
    }
  ],
  "CreationTime": "0001-01-01T00:00:00",
  "ModifiedTime": "0001-01-01T00:00:00",
  "ErrorInfo": {
    "ErrorCount": 2
  }
}

```

---

### RuleStateEnum

<a id="schemarulestateenum"></a>
<a id="schema_RuleStateEnum"></a>
<a id="tocSrulestateenum"></a>
<a id="tocsrulestateenum"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Started|0||
|Stopped|1||

---

### RuleExpression

<a id="schemaruleexpression"></a>
<a id="schema_RuleExpression"></a>
<a id="tocSruleexpression"></a>
<a id="tocsruleexpression"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Field|string|false|true|None|
|Specifications|[[Specification](#schemaspecification)]|false|true|None|

```json
{
  "Field": "string",
  "Specifications": [
    {
      "Type": 0,
      "Value": "string",
      "Name": "string",
      "CharacterType": 0,
      "CharacterLength": 0,
      "StrictValueMappings": true,
      "RequiredDelimiters": [
        "string"
      ],
      "ValueMappings": {
        "property1": "string",
        "property2": "string"
      }
    }
  ]
}

```

---

### Specification

<a id="schemaspecification"></a>
<a id="schema_Specification"></a>
<a id="tocSspecification"></a>
<a id="tocsspecification"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Type|[SpecificationType](#schemaspecificationtype)|false|false|None|
|Value|string|false|true|None|
|Name|string|false|true|None|
|CharacterType|[CharacterType](#schemacharactertype)|false|false|None|
|CharacterLength|int32|false|true|Null represents the longest string length within the group.|
|StrictValueMappings|boolean|false|false|None|
|RequiredDelimiters|string[]|false|true|None|
|ValueMappings|object|false|true|None|

```json
{
  "Type": 0,
  "Value": "string",
  "Name": "string",
  "CharacterType": 0,
  "CharacterLength": 0,
  "StrictValueMappings": true,
  "RequiredDelimiters": [
    "string"
  ],
  "ValueMappings": {
    "property1": "string",
    "property2": "string"
  }
}

```

---

### SpecificationType

<a id="schemaspecificationtype"></a>
<a id="schema_SpecificationType"></a>
<a id="tocSspecificationtype"></a>
<a id="tocsspecificationtype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unspecified|0|
|Group|1|
|Wildcard|2|
|Literal|3|
|Delimiter|4|

---

### CharacterType

<a id="schemacharactertype"></a>
<a id="schema_CharacterType"></a>
<a id="tocScharactertype"></a>
<a id="tocscharactertype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Any|0|
|Letter|1|
|Digit|2|
|Alphanumeric|3|

---

### RuleOutput

<a id="schemaruleoutput"></a>
<a id="schema_RuleOutput"></a>
<a id="tocSruleoutput"></a>
<a id="tocsruleoutput"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Field|string|false|true|None|
|Value|any|false|true|None|

```json
{
  "Field": "string",
  "Value": null
}

```

---

### AssetRulePreviewResult

<a id="schemaassetrulepreviewresult"></a>
<a id="schema_AssetRulePreviewResult"></a>
<a id="tocSassetrulepreviewresult"></a>
<a id="tocsassetrulepreviewresult"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Status|string|false|true|None|
|Assets|[[AssetPreviewData](#schemaassetpreviewdata)]|false|true|None|
|Statistics|[AssetRulePreviewStatistics](#schemaassetrulepreviewstatistics)|false|true|None|
|Errors|[[RuleError](#schemaruleerror)]|false|true|None|

```json
{
  "Status": "status",
  "Assets": [
    {
      "AssetId": "assetId",
      "ChangeType": "changeType",
      "Asset": {
        "Id": "id",
        "AssetTypeId": "assetTypeId",
        "Name": "name",
        "Description": "description",
        "Metadata": [
          {
            "Id": "id",
            "Name": "name",
            "Description": "description",
            "SdsTypeCode": 18,
            "Value": "value",
            "Uom": "uom"
          }
        ],
        "StreamReferences": [
          {
            "Id": "id",
            "Name": "name",
            "Description": "description",
            "StreamId": "streamId"
          }
        ],
        "Status": {
          "Name": "name",
          "Description": "description",
          "StreamReferenceId": "streamReferenceId",
          "StreamPropertyId": "streamPropertyId",
          "ValueStatusMappings": [
            {
              "Value": "value",
              "Status": 1,
              "DisplayName": "displayName"
            }
          ]
        }
      }
    }
  ],
  "Statistics": {
    "Streams": 1,
    "TotalResults": 1
  }
}

```

---

### AssetPreviewData

<a id="schemaassetpreviewdata"></a>
<a id="schema_AssetPreviewData"></a>
<a id="tocSassetpreviewdata"></a>
<a id="tocsassetpreviewdata"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AssetId|string|false|true|None|
|Streams|[[SdsStream](#schemasdsstream)]|false|true|None|
|Asset|[Asset](#schemaasset)|false|true|None|

```json
{
  "AssetId": "string",
  "Streams": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "TypeId": "string",
      "Indexes": [
        {
          "SdsTypePropertyId": "string"
        }
      ],
      "InterpolationMode": 0,
      "ExtrapolationMode": 0,
      "PropertyOverrides": [
        {
          "SdsTypePropertyId": "string",
          "Uom": "string",
          "InterpolationMode": 0
        }
      ]
    }
  ],
  "Asset": {
    "Id": "string",
    "AssetTypeId": "string",
    "Name": "string",
    "Description": "string",
    "Metadata": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": 0,
        "Value": null,
        "Uom": "string"
      }
    ],
    "StreamReferences": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "StreamId": "string"
      }
    ],
    "Status": {
      "StreamReferenceId": "string",
      "StreamPropertyId": "string",
      "ValueStatusMappings": [
        {
          "Value": null,
          "Status": 0,
          "DisplayName": "string"
        }
      ]
    }
  }
}

```

---

### SdsStream

<a id="schemasdsstream"></a>
<a id="schema_SdsStream"></a>
<a id="tocSsdsstream"></a>
<a id="tocssdsstream"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|TypeId|string|false|true|None|
|Indexes|[[SdsStreamIndex](#schemasdsstreamindex)]|false|true|None|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|None|
|ExtrapolationMode|[SdsExtrapolationMode](#schemasdsextrapolationmode)|false|true|None|
|PropertyOverrides|[[SdsStreamPropertyOverride](#schemasdsstreampropertyoverride)]|false|true|None|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "Indexes": [
    {
      "SdsTypePropertyId": "string"
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "PropertyOverrides": [
    {
      "SdsTypePropertyId": "string",
      "Uom": "string",
      "InterpolationMode": 0
    }
  ]
}

```

---

### SdsStreamIndex

<a id="schemasdsstreamindex"></a>
<a id="schema_SdsStreamIndex"></a>
<a id="tocSsdsstreamindex"></a>
<a id="tocssdsstreamindex"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SdsTypePropertyId|string|false|true|None|

```json
{
  "SdsTypePropertyId": "string"
}

```

---

### SdsInterpolationMode

<a id="schemasdsinterpolationmode"></a>
<a id="schema_SdsInterpolationMode"></a>
<a id="tocSsdsinterpolationmode"></a>
<a id="tocssdsinterpolationmode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Default|0|
|Continuous|0|
|StepwiseContinuousLeading|1|
|StepwiseContinuousTrailing|2|
|Discrete|3|
|ContinuousNullableLeading|4|
|ContinuousNullableTrailing|5|

---

### SdsExtrapolationMode

<a id="schemasdsextrapolationmode"></a>
<a id="schema_SdsExtrapolationMode"></a>
<a id="tocSsdsextrapolationmode"></a>
<a id="tocssdsextrapolationmode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|All|0|
|None|1|
|Forward|2|
|Backward|3|

---

### SdsStreamPropertyOverride

<a id="schemasdsstreampropertyoverride"></a>
<a id="schema_SdsStreamPropertyOverride"></a>
<a id="tocSsdsstreampropertyoverride"></a>
<a id="tocssdsstreampropertyoverride"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SdsTypePropertyId|string|false|true|None|
|Uom|string|false|true|None|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|None|

```json
{
  "SdsTypePropertyId": "string",
  "Uom": "string",
  "InterpolationMode": 0
}

```

---

### Asset

<a id="schemaasset"></a>
<a id="schema_Asset"></a>
<a id="tocSasset"></a>
<a id="tocsasset"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|AssetTypeId|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|Metadata|[[MetadataItem](#schemametadataitem)]|false|true|None|
|StreamReferences|[[StreamReference](#schemastreamreference)]|false|true|None|
|Status|[StatusMapping](#schemastatusmapping)|false|true|None|

```json
{
  "Id": "string",
  "AssetTypeId": "string",
  "Name": "string",
  "Description": "string",
  "Metadata": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "Value": null,
      "Uom": "string"
    }
  ],
  "StreamReferences": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "StreamId": "string"
    }
  ],
  "Status": {
    "StreamReferenceId": "string",
    "StreamPropertyId": "string",
    "ValueStatusMappings": [
      {
        "Value": null,
        "Status": 0,
        "DisplayName": "string"
      }
    ]
  }
}

```

---

### MetadataItem

<a id="schemametadataitem"></a>
<a id="schema_MetadataItem"></a>
<a id="tocSmetadataitem"></a>
<a id="tocsmetadataitem"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|SdsTypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|None|
|Value|any|false|true|None|
|Uom|string|false|true|None|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": 0,
  "Value": null,
  "Uom": "string"
}

```

---

### SdsTypeCode

<a id="schemasdstypecode"></a>
<a id="schema_SdsTypeCode"></a>
<a id="tocSsdstypecode"></a>
<a id="tocssdstypecode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Empty|0|
|Object|1|
|Boolean|3|
|Char|4|
|SByte|5|
|Byte|6|
|Int16|7|
|UInt16|8|
|Int32|9|
|UInt32|10|
|Int64|11|
|UInt64|12|
|Single|13|
|Double|14|
|Decimal|15|
|DateTime|16|
|String|18|
|Guid|19|
|DateTimeOffset|20|
|TimeSpan|21|
|Version|22|
|NullableBoolean|103|
|NullableChar|104|
|NullableSByte|105|
|NullableByte|106|
|NullableInt16|107|
|NullableUInt16|108|
|NullableInt32|109|
|NullableUInt32|110|
|NullableInt64|111|
|NullableUInt64|112|
|NullableSingle|113|
|NullableDouble|114|
|NullableDecimal|115|
|NullableDateTime|116|
|NullableGuid|119|
|NullableDateTimeOffset|120|
|NullableTimeSpan|121|
|BooleanArray|203|
|CharArray|204|
|SByteArray|205|
|ByteArray|206|
|Int16Array|207|
|UInt16Array|208|
|Int32Array|209|
|UInt32Array|210|
|Int64Array|211|
|UInt64Array|212|
|SingleArray|213|
|DoubleArray|214|
|DecimalArray|215|
|DateTimeArray|216|
|StringArray|218|
|GuidArray|219|
|DateTimeOffsetArray|220|
|TimeSpanArray|221|
|VersionArray|222|
|Array|400|
|IList|401|
|IDictionary|402|
|IEnumerable|403|
|SdsType|501|
|SdsTypeProperty|502|
|SdsStreamView|503|
|SdsStreamViewProperty|504|
|SdsStreamViewMap|505|
|SdsStreamViewMapProperty|506|
|SdsStream|507|
|SdsStreamIndex|508|
|SdsTable|509|
|SdsColumn|510|
|SdsValues|511|
|SdsObject|512|
|SByteEnum|605|
|ByteEnum|606|
|Int16Enum|607|
|UInt16Enum|608|
|Int32Enum|609|
|UInt32Enum|610|
|Int64Enum|611|
|UInt64Enum|612|
|NullableSByteEnum|705|
|NullableByteEnum|706|
|NullableInt16Enum|707|
|NullableUInt16Enum|708|
|NullableInt32Enum|709|
|NullableUInt32Enum|710|
|NullableInt64Enum|711|
|NullableUInt64Enum|712|

---

### StreamReference

<a id="schemastreamreference"></a>
<a id="schema_StreamReference"></a>
<a id="tocSstreamreference"></a>
<a id="tocsstreamreference"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|StreamId|string|false|true|None|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "StreamId": "string"
}

```

---

### StatusMapping

<a id="schemastatusmapping"></a>
<a id="schema_StatusMapping"></a>
<a id="tocSstatusmapping"></a>
<a id="tocsstatusmapping"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamReferenceId|string|false|true|None|
|StreamPropertyId|string|false|true|None|
|ValueStatusMappings|[[ValueStatusMapping](#schemavaluestatusmapping)]|false|true|None|

```json
{
  "StreamReferenceId": "string",
  "StreamPropertyId": "string",
  "ValueStatusMappings": [
    {
      "Value": null,
      "Status": 0,
      "DisplayName": "string"
    }
  ]
}

```

---

### ValueStatusMapping

<a id="schemavaluestatusmapping"></a>
<a id="schema_ValueStatusMapping"></a>
<a id="tocSvaluestatusmapping"></a>
<a id="tocsvaluestatusmapping"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|any|false|true|None|
|Status|[StatusEnum](#schemastatusenum)|false|false|None|
|DisplayName|string|false|true|None|

```json
{
  "Value": null,
  "Status": 0,
  "DisplayName": "string"
}

```

---

### StatusEnum

<a id="schemastatusenum"></a>
<a id="schema_StatusEnum"></a>
<a id="tocSstatusenum"></a>
<a id="tocsstatusenum"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unknown|0|
|Good|1|
|Warning|2|
|Bad|3|

---

### AssetRulePreviewStatistics

<a id="schemaassetrulepreviewstatistics"></a>
<a id="schema_AssetRulePreviewStatistics"></a>
<a id="tocSassetrulepreviewstatistics"></a>
<a id="tocsassetrulepreviewstatistics"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamsProcessed|int32|false|false|Streams used in the preview.|
|TotalResults|int32|false|false|Total number of asset results.|
|ExecutionErrors|int32|false|false|Number of errors generted during execution|
|StreamsMatched|int32|false|false|The streams that the rule applied to.|
|StreamReferences|int32|false|false|The total number of stream references that assets have.|
|Metadatas|int32|false|false|The total number of metadatas contained within the assets.|
|PercentDone|float|false|false|Percent of streams that have been processed from 0.0 to 1.0.|

```json
{
  "StreamsProcessed": 0,
  "TotalResults": 0,
  "ExecutionErrors": 0,
  "StreamsMatched": 0,
  "StreamReferences": 0,
  "Metadatas": 0,
  "PercentDone": 0
}

```

---

### RuleError

<a id="schemaruleerror"></a>
<a id="schema_RuleError"></a>
<a id="tocSruleerror"></a>
<a id="tocsruleerror"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|RuleId|string|false|true|None|
|TimeGenerated|date-time|false|false|None|
|ErrorDetails|string|false|true|None|
|ErrorMessageType|[ErrorMessageType](#schemaerrormessagetype)|false|false|None|

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "RuleId": "ruleId",
  "TimeGenerated": "0001-01-01T00:00:00",
  "ErrorDetails": "Error details.",
  "ErrorMessageType": 1
}

```

---

### ErrorMessageType

<a id="schemaerrormessagetype"></a>
<a id="schema_ErrorMessageType"></a>
<a id="tocSerrormessagetype"></a>
<a id="tocserrormessagetype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|ConflictBetweenRules|0|
|CreateOrUpdate|1|
|Generic|2|
|AutomationId|3|
|ConflictBetweenStreams|4|
|MissingMappings|5|
|ConflictBetweenRuleAndUser|6|

---

