---
uid: metadata-metadata-rule-preview

---

# Metadata Rule Preview

## `Get Preview Results`

<a id="opIdMetadataRulePreview_Get Preview Results"></a>

Returns a `RulePreviewResult`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/metadatarules
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
|200|[RulePreviewResult](#schemarulepreviewresult)|A `RulePreviewResult` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified preview was not found.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Status": "complete",
  "Results": [
    {
      "Name": "name",
      "Id": "id",
      "Description": "description",
      "NewMetadata": {
        "key": "value"
      },
      "UpdatedMetadata": {
        "key": "value"
      },
      "RemovedMetadata": {
        "key": "value"
      }
    }
  ],
  "Statistics": {
    "StreamsAffected": 1,
    "NewMetadataKeys": 1,
    "NewMetadataValues": 1,
    "UpdatedMetadataValues": 1,
    "RemovedMetadataKeys": 1,
    "TotalResults": 1,
    "PageCount": 1
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

<a id="opIdMetadataRulePreview_Start Preview"></a>

Creates a `RulePreviewResponse` of a `RuleModel` object.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/metadatarules
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
  "PreviewLink": "/api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/metadatarules?Token=00000000-0000-0000-0000-000000000000",
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

<a id="opIdMetadataRulePreview_Cancel Preview"></a>

Cancels a running preview.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/metadatarules
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

### RulePreviewResult

<a id="schemarulepreviewresult"></a>
<a id="schema_RulePreviewResult"></a>
<a id="tocSrulepreviewresult"></a>
<a id="tocsrulepreviewresult"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Status|string|false|true|None|
|Results|[[StreamPreviewData](#schemastreampreviewdata)]|false|true|None|
|Statistics|[RulePreviewStatistics](#schemarulepreviewstatistics)|false|true|None|

```json
{
  "Status": "complete",
  "Results": [
    {
      "Name": "name",
      "Id": "id",
      "Description": "description",
      "NewMetadata": {
        "key": "value"
      },
      "UpdatedMetadata": {
        "key": "value"
      },
      "RemovedMetadata": {
        "key": "value"
      }
    }
  ],
  "Statistics": {
    "StreamsAffected": 1,
    "NewMetadataKeys": 1,
    "NewMetadataValues": 1,
    "UpdatedMetadataValues": 1,
    "RemovedMetadataKeys": 1,
    "TotalResults": 1,
    "PageCount": 1
  }
}

```

---

### StreamPreviewData

<a id="schemastreampreviewdata"></a>
<a id="schema_StreamPreviewData"></a>
<a id="tocSstreampreviewdata"></a>
<a id="tocsstreampreviewdata"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|None|
|Id|string|false|true|None|
|Description|string|false|true|None|
|NewMetadata|object|false|true|None|
|UpdatedMetadata|object|false|true|None|
|UnchangedMetadata|object|false|true|None|
|RemovedMetadata|object|false|true|None|

```json
{
  "Name": "string",
  "Id": "string",
  "Description": "string",
  "NewMetadata": {
    "property1": "string",
    "property2": "string"
  },
  "UpdatedMetadata": {
    "property1": "string",
    "property2": "string"
  },
  "UnchangedMetadata": {
    "property1": "string",
    "property2": "string"
  },
  "RemovedMetadata": {
    "property1": "string",
    "property2": "string"
  }
}

```

---

### RulePreviewStatistics

<a id="schemarulepreviewstatistics"></a>
<a id="schema_RulePreviewStatistics"></a>
<a id="tocSrulepreviewstatistics"></a>
<a id="tocsrulepreviewstatistics"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamsAffected|int32|false|false|None|
|NewMetadataKeys|int32|false|false|None|
|NewMetadataValues|int32|false|false|None|
|UpdatedMetadataValues|int32|false|false|None|
|UnchangedMetadataValues|int32|false|false|None|
|RemovedMetadataKeys|int32|false|false|None|
|TotalResults|int32|false|false|None|
|PageCount|int32|false|false|None|

```json
{
  "StreamsAffected": 0,
  "NewMetadataKeys": 0,
  "NewMetadataValues": 0,
  "UpdatedMetadataValues": 0,
  "UnchangedMetadataValues": 0,
  "RemovedMetadataKeys": 0,
  "TotalResults": 0,
  "PageCount": 0
}

```

---

