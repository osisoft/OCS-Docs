---
uid: asset-asset-rule-suggestion

---

# Asset Rule Suggestion

## `Get Suggestion Results`

<a id="opIdAssetRuleSuggestion_Get Suggestion Results"></a>

Returns a `SuggestionResult`.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/suggestion/assetrules
?token={token}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string token`
<br/>A `Guid` which corresponds to a SuggestionResponse that has been created using the `StartSuggestion` method.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SuggestionResult](#schemasuggestionresult)|A `SuggestionResult` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified suggestion was not found.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Status": "complete",
  "Result": {
    "key1": [
      "value1",
      "value2"
    ],
    "key2": [
      "value1",
      "value2"
    ]
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

## `Start Suggestion`

<a id="opIdAssetRuleSuggestion_Start Suggestion"></a>

Creates a `SuggestionResponse` for a `RuleModel` object.

<h3>Request</h3>

```text 
POST /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/suggestion/assetrules
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The RuleModel object to create a suggestion for.<br/>

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
|202|[SuggestionResponse](#schemasuggestionresponse)|A `SuggestionResponse` object.|
|204|[ResponseBody](#schemaresponsebody)|A `SuggestionResponse` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|
|503|[ResponseBody](#schemaresponsebody)|Dependent service error.|

<h4>Example response body</h4>

> 202 Response

```json
{
  "SuggestionLink": "/api/v1/tenants/{tenantId}/namespaces/{namespaceId}/suggestion/metadatarules?Token=00000000-0000-0000-0000-000000000000",
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

## `Cancel Suggestion`

<a id="opIdAssetRuleSuggestion_Cancel Suggestion"></a>

Cancels a running suggestion query.

<h3>Request</h3>

```text 
DELETE /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/suggestion/assetrules
?token={token}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string token`
<br/>A `Guid` which corresponds to a SuggestionResponse that has been created using the `StartSuggestion` method.<br/><br/>

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

### SuggestionResponse

<a id="schemasuggestionresponse"></a>
<a id="schema_SuggestionResponse"></a>
<a id="tocSsuggestionresponse"></a>
<a id="tocssuggestionresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SuggestionLink|string|false|true|None|
|Expires|int32|false|false|None|

```json
{
  "SuggestionLink": "/api/v1/tenants/{tenantId}/namespaces/{namespaceId}/suggestion/metadatarules?Token=00000000-0000-0000-0000-000000000000",
  "Expires": 7200
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

### SuggestionResult

<a id="schemasuggestionresult"></a>
<a id="schema_SuggestionResult"></a>
<a id="tocSsuggestionresult"></a>
<a id="tocssuggestionresult"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Status|string|false|true|None|
|Result|object|false|true|None|

```json
{
  "Status": "complete",
  "Result": {
    "key1": [
      "value1",
      "value2"
    ],
    "key2": [
      "value1",
      "value2"
    ]
  }
}

```

---

