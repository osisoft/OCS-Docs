---
uid: metadata-metadata-rules

---

# Metadata Rules

## `List Rules`

<a id="opIdMetadataRule_List Rules"></a>

Returns all `RuleModel` objects from the `IRuleStore` to which the requesting `Identity` has access.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules
?Skip={Skip}&Count={Count}&KeepOldMetadata={KeepOldMetadata}&KeepOldAssets={KeepOldAssets}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer Skip`
<br/>An Int32 to determine how many results to skip. Defaults to DefaultSkip<br/><br/>`[optional] integer Count`
<br/>An Int32 to determine how many results to return. Defaults to DefaultCount<br/><br/>`[optional] boolean KeepOldMetadata`
<br/>A Boolean to determine whether or not existing metadata created by the rule should be preserved if the rule were deleted. Only valid for metadata rule delete requests.
Defaults to false.<br/><br/>`[optional] boolean KeepOldAssets`
<br/>A Boolean to determine whether or not existing assets created by the rule should be kept. Only valid for asset rule delete requests.
Defaults to false.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[RuleModel](#schemarulemodel)[]|The `RuleModel` objects.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 200 Response

```json
[
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
  },
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
]
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

---

## `Create Rule With Server Generated Id`

<a id="opIdMetadataRule_Create Rule With Server Generated Id"></a>

Creates a `RuleModel` object with a server generated `Id` in the `IRuleStore`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The RuleModel object to create.<br/>

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
|201|[RuleModel](#schemarulemodel)|A link to the `RuleModel` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|409|[ResponseBody](#schemaresponsebody)|A non-equivalent rule with the same identifier already exists.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 201 Response

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

> 409 Response

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

## `Get Rule`

<a id="opIdMetadataRule_Get Rule"></a>

Gets the specified rule.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules/{ruleId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string ruleId`
<br/>Rule identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[RuleModel](#schemarulemodel)|The specified rule.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified rule was not found.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 200 Response

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

## `Create Rule`

<a id="opIdMetadataRule_Create Rule"></a>

Returns or creates a `RuleModel` object with the specified id in the `IRuleStore`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules/{ruleId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string ruleId`
<br/>Rule identifier.<br/><br/>

<h4>Request Body</h4>

The RuleModel object.<br/>

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
|201|[RuleModel](#schemarulemodel)|A link to the `RuleModel` object.|
|302|None|An equivalent rule with the same identifier and definition already exists.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|409|[ResponseBody](#schemaresponsebody)|A non-equivalent rule with the specified identifier already exists.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 201 Response

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

> 409 Response

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

## `Create Or Update Rule`

<a id="opIdMetadataRule_Create Or Update Rule"></a>

Creates or updates the specified rule in the `IRuleStore`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules/{ruleId}
?Skip={Skip}&Count={Count}&KeepOldMetadata={KeepOldMetadata}&KeepOldAssets={KeepOldAssets}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string ruleId`
<br/>Rule identifier.<br/><br/>
`[optional] integer Skip`
<br/>An Int32 to determine how many results to skip. Defaults to DefaultSkip<br/><br/>`[optional] integer Count`
<br/>An Int32 to determine how many results to return. Defaults to DefaultCount<br/><br/>`[optional] boolean KeepOldMetadata`
<br/>A Boolean to determine whether or not existing metadata created by the rule should be preserved if the rule were deleted. Only valid for metadata rule delete requests.
Defaults to false.<br/><br/>`[optional] boolean KeepOldAssets`
<br/>A Boolean to determine whether or not existing assets created by the rule should be kept. Only valid for asset rule delete requests.
Defaults to false.<br/><br/>

<h4>Request Body</h4>

The RuleModel object to create or update.<br/>

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
|200|[RuleModel](#schemarulemodel)|The updated `RuleModel` object or a link to the new `RuleModel` object.|
|201|[RuleModel](#schemarulemodel)|The updated `RuleModel` object or a link to the new `RuleModel` object.|
|400|[ResponseBody](#schemaresponsebody)|Missing or invalid inputs.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

<h4>Example response body</h4>

> 200 Response

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

> 201 Response

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

---

## `Delete Rule`

<a id="opIdMetadataRule_Delete Rule"></a>

Deletes the specified rule from the `IRuleStore`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules/{ruleId}
?Skip={Skip}&Count={Count}&KeepOldMetadata={KeepOldMetadata}&KeepOldAssets={KeepOldAssets}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string ruleId`
<br/>Rule identifier.<br/><br/>
`[optional] integer Skip`
<br/>An Int32 to determine how many results to skip. Defaults to DefaultSkip<br/><br/>`[optional] integer Count`
<br/>An Int32 to determine how many results to return. Defaults to DefaultCount<br/><br/>`[optional] boolean KeepOldMetadata`
<br/>A Boolean to determine whether or not existing metadata created by the rule should be preserved if the rule were deleted. Only valid for metadata rule delete requests.
Defaults to false.<br/><br/>`[optional] boolean KeepOldAssets`
<br/>A Boolean to determine whether or not existing assets created by the rule should be kept. Only valid for asset rule delete requests.
Defaults to false.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified rule was not found.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

---

## `Execute Rule`

<a id="opIdMetadataRule_Execute Rule"></a>

Executes the specified rule.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metadatarules/{ruleId}/execute
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string ruleId`
<br/>Rule identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|403|[ResponseBody](#schemaresponsebody)|Forbidden.|
|404|[ResponseBody](#schemaresponsebody)|The specified rule was not found.|
|409|[ResponseBody](#schemaresponsebody)|The automation identifier was invalid.|
|500|[ResponseBody](#schemaresponsebody)|Internal server error.|

---
## Definitions

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

|Property|Value|
|---|---|
|Started|0|
|Stopped|1|

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

