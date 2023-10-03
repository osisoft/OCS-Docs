---
uid: ""

---

# Community Groups
APIs for getting, updating, and deleting groups for a Community.

## `Get all groups for a given community`

<a id="opIdCommunityGroups_Get all groups for a given community"></a>

List Groups for a Community.

<h3>Request</h3>

```text 
GET /api/v1-preview/Communities/{communityId}/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Groups
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string communityId`
<br/>Community identifier.<br/><br/>`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderResultsOfIdentityProviderGroup](#schemaidentityproviderresultsofidentityprovidergroup)|Success.|
|207|[IdentityProviderGroupsMultiStatusResponse](#schemaidentityprovidergroupsmultistatusresponse)|None|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant or identity provider not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([IdentityProviderResultsOfIdentityProviderGroup](#schemaidentityproviderresultsofidentityprovidergroup))

```json
{
  "Results": [
    {
      "Id": "string",
      "Name": "string",
      "Email": "user@example.com",
      "IsClusterManagementAllowed": true
    }
  ],
  "SkipToken": "string"
}
```

---

## `Get Count of Groups for a Community`

<a id="opIdCommunityGroups_Get Count of Groups for a Community"></a>

Gets Count of Groups for a Community.

<h3>Request</h3>

```text 
HEAD /api/v1-preview/Communities/{communityId}/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Groups
```

<h4>Parameters</h4>

`string communityId`
<br/>Community identifier<br/><br/>`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Community not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

---

## `Add Group to a Community`

<a id="opIdCommunityGroups_Add Group to a Community"></a>

Adds Group to a Community.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Communities/{communityId}/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Groups/{groupId}
```

<h4>Parameters</h4>

`string communityId`
<br/>Community identifier.<br/><br/>`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>`string groupId`
<br/>Group identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderGroup](#schemaidentityprovidergroup)|None|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant or Community not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

<h4>Example response body</h4>

> 200 Response ([IdentityProviderGroup](#schemaidentityprovidergroup))

```json
{
  "Id": "string",
  "Name": "string",
  "Email": "user@example.com",
  "IsClusterManagementAllowed": true
}
```

---

## `Remove Group from a Community`

<a id="opIdCommunityGroups_Remove Group from a Community"></a>

Remove Group from a Community.

<h3>Request</h3>

```text 
DELETE /api/v1-preview/Communities/{communityId}/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Groups/{groupId}
```

<h4>Parameters</h4>

`string communityId`
<br/>Community identifier.<br/><br/>`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>`string groupId`
<br/>Group identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Created|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

---
## Definitions

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned whenever there is an error

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|Operation identifier of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution to resolve the error|
|DynamicProperties|object|false|true|Additional properties|

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

### IdentityProviderResultsOfIdentityProviderGroup

<a id="schemaidentityproviderresultsofidentityprovidergroup"></a>
<a id="schema_IdentityProviderResultsOfIdentityProviderGroup"></a>
<a id="tocSidentityproviderresultsofidentityprovidergroup"></a>
<a id="tocsidentityproviderresultsofidentityprovidergroup"></a>

Result object for Identity Provider access users/groups

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Results|[[IdentityProviderGroup](#schemaidentityprovidergroup)]|false|false|List of users/groups|
|SkipToken|string|false|true|Skip token for paging|

```json
{
  "Results": [
    {
      "Id": "string",
      "Name": "string",
      "Email": "user@example.com",
      "IsClusterManagementAllowed": true
    }
  ],
  "SkipToken": "string"
}

```

---

### IdentityProviderGroup

<a id="schemaidentityprovidergroup"></a>
<a id="schema_IdentityProviderGroup"></a>
<a id="tocSidentityprovidergroup"></a>
<a id="tocsidentityprovidergroup"></a>

Base class for identity provider access group

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|false|Object identifier of the IdentityProviderGroup|
|Name|string|false|true|Group name of the IdentityProviderGroup|
|Email|email|false|true|Email address of the IdentityProviderGroup|
|IsClusterManagementAllowed|boolean|false|true|Whether group can manage cluster roles|

```json
{
  "Id": "string",
  "Name": "string",
  "Email": "user@example.com",
  "IsClusterManagementAllowed": true
}

```

---

### IdentityProviderGroupsMultiStatusResponse

<a id="schemaidentityprovidergroupsmultistatusresponse"></a>
<a id="schema_IdentityProviderGroupsMultiStatusResponse"></a>
<a id="tocSidentityprovidergroupsmultistatusresponse"></a>
<a id="tocsidentityprovidergroupsmultistatusresponse"></a>

MultiStatusResponse objects returned in a 207 response

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Identifier of the operation that resulted in this error.|
|Error|string|false|true|Message describing the error.|
|Reason|string|false|true|Reason that caused the error.|
|ChildErrors|[[MultiStatusResponseChildError](#schemamultistatusresponsechilderror)]|false|true|List of child errors.|
|Data|[[IdentityProviderGroup](#schemaidentityprovidergroup)]|false|true|Data representing groups.|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Reason": "string",
      "Resolution": "string",
      "EventId": "string",
      "StatusCode": 0,
      "ModelId": "string",
      "property1": null,
      "property2": null
    }
  ],
  "Data": [
    {
      "Id": "string",
      "Name": "string",
      "Email": "user@example.com",
      "IsClusterManagementAllowed": true
    }
  ]
}

```

---

### MultiStatusResponseChildError

<a id="schemamultistatusresponsechilderror"></a>
<a id="schema_MultiStatusResponseChildError"></a>
<a id="tocSmultistatusresponsechilderror"></a>
<a id="tocsmultistatusresponsechilderror"></a>

ChildError objects returned in a 207 response

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|OperationId of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution for the error|
|EventId|string|true|false|EventId for the error|
|StatusCode|int32|false|false|Http status code|
|ModelId|string|false|true|Model identifier|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "EventId": "string",
  "StatusCode": 0,
  "ModelId": "string",
  "property1": null,
  "property2": null
}

```

---

