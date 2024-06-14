---
uid: ""

---

# Configuration Template
APIs for configuration template management

## `List Templates`

<a id="opIdConfigurationTemplate_List Templates"></a>

Returns a list of templates.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates
?skip={skip}&count={count}&orderBy={orderBy}&query={query}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first template to retrieve. If unspecified, a default value of 0 is used. Value must be greater than or equal to 0.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used. Value cannot be less than 1 or greater than 1000.<br/><br/>`[optional] string orderBy`
<br/>Query parameter to specify sort order. Valid sort order properties are Name, Type, Version, Description. If unspecified, a default value of 'name asc' is used.<br/><br/>`[optional] string query`
<br/>Query parameter to specify filter. Valid filter properties are Name, Type, Version, Description.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ConfigurationTemplate](#schemaconfigurationtemplate)[]|List of templates.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total number of templates.|

<h4>Example response body</h4>

> 200 Response ([ConfigurationTemplate](#schemaconfigurationtemplate)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Type": "string",
    "Version": "string",
    "Description": "string",
    "CreatedDate": "2019-08-24T14:15:22Z",
    "CreatedBy": "string",
    "ModifiedDate": "2019-08-24T14:15:22Z",
    "ModifiedBy": "string"
  }
]
```

---

## `Create Template`

<a id="opIdConfigurationTemplate_Create Template"></a>

Creates a template.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

Template data to store.<br/>

```json
{
  "Name": "string",
  "Type": "string",
  "Version": "string",
  "Description": "string",
  "Configuration": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|Inline|Configuration created.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|409|[ErrorResponse](#schemaerrorresponse)|Conflict.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Get Template`

<a id="opIdConfigurationTemplate_Get Template"></a>

Returns a configuration template.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates/{templateId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string templateId`
<br/>Configuration template identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Template|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Template not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Update Template`

<a id="opIdConfigurationTemplate_Update Template"></a>

Updates a template.

<h3>Request</h3>

```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates/{templateId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string templateId`
<br/>Template identifier.<br/><br/>

<h4>Request Body</h4>

Template.<br/>

```json
{
  "Name": "string",
  "Type": "string",
  "Version": "string",
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Delete Template`

<a id="opIdConfigurationTemplate_Delete Template"></a>

Deletes a template.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates/{templateId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string templateId`
<br/>Template identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Template not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Get Template Configuration`

<a id="opIdConfigurationTemplate_Get Template Configuration"></a>

Returns a template's configuration.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates/{templateId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string templateId`
<br/>Configuration template identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Configuration for the specified template.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Configuration not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Update Template Configuration`

<a id="opIdConfigurationTemplate_Update Template Configuration"></a>

Updates a template configuration.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Templates/{templateId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string templateId`
<br/>Template identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---
## Definitions

### ConfigurationTemplate

<a id="schemaconfigurationtemplate"></a>
<a id="schema_ConfigurationTemplate"></a>
<a id="tocSconfigurationtemplate"></a>
<a id="tocsconfigurationtemplate"></a>

Configuration template response model

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Gets or sets ID|
|Name|string|false|true|Gets or sets name|
|Type|string|false|true|Gets or sets type|
|Version|string|false|true|Gets or sets version|
|Description|string|false|true|Gets or sets description|
|CreatedDate|date-time|false|false|Gets or sets created date|
|CreatedBy|string|false|true|Gets or sets created by|
|ModifiedDate|date-time|false|true|Gets or sets modified date|
|ModifiedBy|string|false|true|Gets or sets modified by|

```json
{
  "Id": "string",
  "Name": "string",
  "Type": "string",
  "Version": "string",
  "Description": "string",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "CreatedBy": "string",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "ModifiedBy": "string"
}

```

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned whenever there is an error.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|Gets or sets operationId of action that caused the Error.|
|Error|string|true|false|Gets or sets error description.|
|Reason|string|true|false|Gets or sets reason for the Error.|
|Resolution|string|true|false|Gets or sets what can be done to resolve the Error.|
|DynamicProperties|object|false|true|Gets additional properties.|

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

### CreateTemplate

<a id="schemacreatetemplate"></a>
<a id="schema_CreateTemplate"></a>
<a id="tocScreatetemplate"></a>
<a id="tocscreatetemplate"></a>

Create template request model

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|true|false|Gets or sets template name|
|Type|string|true|false|Gets or sets template type|
|Version|string|true|false|Gets or sets template version|
|Description|string|false|true|Gets or sets template description|
|Configuration|string|false|true|Gets or sets template configuration|

```json
{
  "Name": "string",
  "Type": "string",
  "Version": "string",
  "Description": "string",
  "Configuration": "string"
}

```

---

### UpdateTemplate

<a id="schemaupdatetemplate"></a>
<a id="schema_UpdateTemplate"></a>
<a id="tocSupdatetemplate"></a>
<a id="tocsupdatetemplate"></a>

Update template request model

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Gets or sets the name|
|Type|string|false|true|Gets or sets the type|
|Version|string|false|true|Gets or sets the version|
|Description|string|false|true|Gets or sets the description|

```json
{
  "Name": "string",
  "Type": "string",
  "Version": "string",
  "Description": "string"
}

```

---

