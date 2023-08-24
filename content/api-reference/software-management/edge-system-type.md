---
uid: ""

---

# Edge System Type

## `List Types (Edge path)`

<a id="opIdEdgeSystemType_List Types (Edge path)"></a>

Returns a list of supported Edge System types.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of types in alphabetical order.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Types 1`

<a id="opIdEdgeSystemType_List Types 1"></a>

Returns a list of supported Edge System types.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of types in alphabetical order.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type (Edge path)`

<a id="opIdEdgeSystemType_List Type (Edge path)"></a>

Returns a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A supported Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type 1`

<a id="opIdEdgeSystemType_List Type 1"></a>

Returns a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A supported Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Versions (Edge path)`

<a id="opIdEdgeSystemType_List Type Versions (Edge path)"></a>

Returns a list of an Edge System's supported versions.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of versions of a supported Edge System.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Versions 1`

<a id="opIdEdgeSystemType_List Type Versions 1"></a>

Returns a list of an Edge System's supported versions.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of versions of a supported Edge System.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version (Edge path)`

<a id="opIdEdgeSystemType_List Type Version (Edge path)"></a>

Returns a supported Edge System version.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>EdgeSystem Type Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Version information of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version 1`

<a id="opIdEdgeSystemType_List Type Version 1"></a>

Returns a supported Edge System version.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>EdgeSystem Type Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Version information of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version Dynamic Properties (GET Method) (templateproperties path)`

<a id="opIdEdgeSystemType_List Type Version Dynamic Properties (GET Method) (templateproperties path)"></a>

Returns the template properties of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/templateproperties
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>=Edge System Type Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DynamicProperty](#schemadynamicproperty)[]|List of template properties of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([DynamicProperty](#schemadynamicproperty)[])

```json
[
  {
    "Name": "string",
    "Type": "Secret"
  }
]
```

---

## `List Type Version Dynamic Properties (GET Method) (dynamicproperties path)`

<a id="opIdEdgeSystemType_List Type Version Dynamic Properties (GET Method) (dynamicproperties path)"></a>

Returns the template properties of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/dynamicproperties
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>=Edge System Type Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DynamicProperty](#schemadynamicproperty)[]|List of template properties of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([DynamicProperty](#schemadynamicproperty)[])

```json
[
  {
    "Name": "string",
    "Type": "Secret"
  }
]
```

---

## `List Type Version Dynamic Properties 1`

<a id="opIdEdgeSystemType_List Type Version Dynamic Properties 1"></a>

Returns the template properties of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/templateproperties
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>=Edge System Type Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DynamicProperty](#schemadynamicproperty)[]|List of template properties of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([DynamicProperty](#schemadynamicproperty)[])

```json
[
  {
    "Name": "string",
    "Type": "Secret"
  }
]
```

---

## `List Type Version Dynamic Properties 2`

<a id="opIdEdgeSystemType_List Type Version Dynamic Properties 2"></a>

Returns the template properties of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/dynamicproperties
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>=Edge System Type Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DynamicProperty](#schemadynamicproperty)[]|List of template properties of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([DynamicProperty](#schemadynamicproperty)[])

```json
[
  {
    "Name": "string",
    "Type": "Secret"
  }
]
```

---

## `List Type Version Configuration Schema (Edge path)`

<a id="opIdEdgeSystemType_List Type Version Configuration Schema (Edge path)"></a>

Returns the configuration schema of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/configurationschema
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>Edge System Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Configuration schema of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version Configuration Schema 1`

<a id="opIdEdgeSystemType_List Type Version Configuration Schema 1"></a>

Returns the configuration schema of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/configurationschema
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>Edge System Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Configuration schema of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version Default Configuration (GET Method) (defaultconfig path)`

<a id="opIdEdgeSystemType_List Type Version Default Configuration (GET Method) (defaultconfig path)"></a>

Returns the default configuration of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/defaultconfig
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>Edge System Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Default configuration of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version Default Configuration (GET Method) (defaultconfiguration path)`

<a id="opIdEdgeSystemType_List Type Version Default Configuration (GET Method) (defaultconfiguration path)"></a>

Returns the default configuration of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/defaultconfiguration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>Edge System Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Default configuration of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version Default Configuration 1`

<a id="opIdEdgeSystemType_List Type Version Default Configuration 1"></a>

Returns the default configuration of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/defaultconfig
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>Edge System Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Default configuration of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Type Version Default Configuration 2`

<a id="opIdEdgeSystemType_List Type Version Default Configuration 2"></a>

Returns the default configuration of a supported version of a supported Edge System type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Types/{edgeSystemTypeId}/Versions/{edgeSystemTypeVersion}/defaultconfiguration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemTypeId`
<br/>Edge System Type identifier.<br/><br/>`string edgeSystemTypeVersion`
<br/>Edge System Version identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Default configuration of a specific version of an Edge System type.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---
## Definitions

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|None|
|Error|string|true|false|None|
|Reason|string|true|false|None|
|Resolution|string|true|false|None|
|DynamicProperties|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}

```

---

### DynamicProperty

<a id="schemadynamicproperty"></a>
<a id="schema_DynamicProperty"></a>
<a id="tocSdynamicproperty"></a>
<a id="tocsdynamicproperty"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|None|
|Type|[DynamicPropertyType](#schemadynamicpropertytype)|false|false|None|

```json
{
  "Name": "string",
  "Type": "Secret"
}

```

---

### DynamicPropertyType

<a id="schemadynamicpropertytype"></a>
<a id="schema_DynamicPropertyType"></a>
<a id="tocSdynamicpropertytype"></a>
<a id="tocsdynamicpropertytype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Secret|Secret|

---

