---
uid: operations-health

---

# Health
APIs related to querying service health states

## `Get Tenant Health`

<a id="opIdQuery_Get Tenant Health"></a>

Returns tenant health data. Data contains an aggregated health state and list of tenant related services.

### Request
```text 
GET /api/v1/tenants/{tenantId}/health
```

#### Parameters

`string tenantId`
<br/>Tenant identifer<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[TenantViewModel](#schematenantviewmodel)|Health data for the requested **tenant**|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "HealthState": 0,
  "Namespaces": [
    {
      "NamespaceId": "string",
      "Region": "string",
      "HealthState": 0,
      "Services": [
        {
          "Name": "string",
          "HealthState": null
        }
      ]
    }
  ],
  "Regions": [
    {
      "Region": "string",
      "Name": "string",
      "HealthState": 0
    }
  ]
}
```

---
## Definitions

### TenantViewModel

<a id="schematenantviewmodel"></a>
<a id="schema_TenantViewModel"></a>
<a id="tocStenantviewmodel"></a>
<a id="tocstenantviewmodel"></a>

This represents a view model of a TenantDbo

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|HealthState|[State](#schemastate)|false|false|Health state of the tenant|
|Namespaces|[[NamespaceViewModel](#schemanamespaceviewmodel)]|false|true|Namespaces scoped to this tenant|
|Regions|[[RegionDto](#schemaregiondto)]|false|true|Features scoped to this tenant|

```json
{
  "HealthState": 0,
  "Namespaces": [
    {
      "NamespaceId": "string",
      "Region": "string",
      "HealthState": 0,
      "Services": [
        {
          "Name": "string",
          "HealthState": null
        }
      ]
    }
  ],
  "Regions": [
    {
      "Region": "string",
      "Name": "string",
      "HealthState": 0
    }
  ]
}

```

---

### State

<a id="schemastate"></a>
<a id="schema_State"></a>
<a id="tocSstate"></a>
<a id="tocsstate"></a>

Represents the various health states a HealthEventViewModel can represent.

#### Enumerated Values

|Property|Value|
|---|---|
|Invalid|0|
|Ok|1|
|Warning|2|
|Error|3|
|Unknown|65535|

---

### NamespaceViewModel

<a id="schemanamespaceviewmodel"></a>
<a id="schema_NamespaceViewModel"></a>
<a id="tocSnamespaceviewmodel"></a>
<a id="tocsnamespaceviewmodel"></a>

Object for a namespace and underlying services

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|NamespaceId|string|false|true|Namespace identifier|
|Region|string|false|true|Namespace region|
|HealthState|[State](#schemastate)|false|false|Health state of the namespace|
|Services|[[ServiceForTenantViewModel](#schemaservicefortenantviewmodel)]|false|true|Services scoped to the namespace|

```json
{
  "NamespaceId": "string",
  "Region": "string",
  "HealthState": 0,
  "Services": [
    {
      "Name": "string",
      "HealthState": 0
    }
  ]
}

```

---

### ServiceForTenantViewModel

<a id="schemaservicefortenantviewmodel"></a>
<a id="schema_ServiceForTenantViewModel"></a>
<a id="tocSservicefortenantviewmodel"></a>
<a id="tocsservicefortenantviewmodel"></a>

This represents a view model of a ServiceForTenantDbo

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Name of the service|
|HealthState|[State](#schemastate)|false|false|Health state of the service|

```json
{
  "Name": "string",
  "HealthState": 0
}

```

---

### RegionDto

<a id="schemaregiondto"></a>
<a id="schema_RegionDto"></a>
<a id="tocSregiondto"></a>
<a id="tocsregiondto"></a>

The health for a suite of services representing a Data Hub capability within a region.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Region|string|false|true|Region in which the services are located.|
|Name|string|false|true|Name for the Data Hub capability facilitated by the region scoped services.|
|HealthState|[State](#schemastate)|false|false|Health state of the region scoped services.|

```json
{
  "Region": "string",
  "Name": "string",
  "HealthState": 0
}

```

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object used to represent error information

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation Id of the action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution for the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string"
}

```

---

