---
uid: identity-client-credential-clients-roles

---

# Client Credential Clients Roles
APIs for getting, updating, and deleting client credential client roles.

## `List Roles for Client Credential Client (Client Credential Clients path)`

<a id="opIdRoles_List Roles for Client Credential Client (Client Credential Clients path)"></a>

Returns a list of roles for the specified client credential client.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Roles
?query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)[]|List of client credential client roles|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([Role](#schemarole)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "RoleScope": 0,
    "TenantId": "string",
    "CommunityId": "string",
    "RoleTypeId": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---

## `Get Roles for Client Credential Client Header (Client Credential Clients path)`

<a id="opIdRoles_Get Roles for Client Credential Client Header (Client Credential Clients path)"></a>

Returns the roles for the client credential client header.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Roles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified client credential client roles|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---

## `Replace Client Credential Client's Roles (Client Credential Clients path)`

<a id="opIdRoles_Replace Client Credential Client's Roles (Client Credential Clients path)"></a>

Replaces existing client credential client roles.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Roles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

Updates roles list<br/>

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "RoleScope": 0,
    "TenantId": "string",
    "CommunityId": "string",
    "RoleTypeId": "string"
  }
]
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)[]|List of updated client credential client roles|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([Role](#schemarole)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "RoleScope": 0,
    "TenantId": "string",
    "CommunityId": "string",
    "RoleTypeId": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List Roles for Client Credential Client (Clients path)`

<a id="opIdRoles_List Roles for Client Credential Client (Clients path)"></a>

Returns a list of roles for the specified client credential client.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Clients/{clientId}/Roles
?query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)[]|List of client credential client roles|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([Role](#schemarole)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "RoleScope": 0,
    "TenantId": "string",
    "CommunityId": "string",
    "RoleTypeId": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---

## `Get Roles for Client Credential Client Header (Clients path)`

<a id="opIdRoles_Get Roles for Client Credential Client Header (Clients path)"></a>

Returns the roles for the client credential client header.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Clients/{clientId}/Roles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified client credential client roles|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---

## `Replace Client Credential Client's Roles (Clients path)`

<a id="opIdRoles_Replace Client Credential Client's Roles (Clients path)"></a>

Replaces existing client credential client roles.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Clients/{clientId}/Roles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

Updates roles list<br/>

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "RoleScope": 0,
    "TenantId": "string",
    "CommunityId": "string",
    "RoleTypeId": "string"
  }
]
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)[]|List of updated client credential client roles|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([Role](#schemarole)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "RoleScope": 0,
    "TenantId": "string",
    "CommunityId": "string",
    "RoleTypeId": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### Role

<a id="schemarole"></a>
<a id="schema_Role"></a>
<a id="tocSrole"></a>
<a id="tocsrole"></a>

Object for retrieving a role

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Role identifier. Generated by the server upon creation.|
|Name|string|false|true|Role name. This cannot be empty.|
|Description|string|false|true|Role description|
|RoleScope|[RoleScope](#schemarolescope)|false|true|Role scope|
|TenantId|string|false|true|Tenant identifier, if this is a Tenant Role. Otherwise, set to null.|
|CommunityId|string|false|true|Community identifier, if this is a Community Role. Otherwise set to null.|
|RoleTypeId|string|false|true|Role type identifier for built-in roles|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "RoleScope": 0,
  "TenantId": "string",
  "CommunityId": "string",
  "RoleTypeId": "string"
}

```

---

### RoleScope

<a id="schemarolescope"></a>
<a id="schema_RoleScope"></a>
<a id="tocSrolescope"></a>
<a id="tocsrolescope"></a>

The object that represents the scope of a given role

#### Enumerated Values

|Property|Value|
|---|---|
|None|0|
|Tenant|1|
|Community|2|
|Cluster|3|

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned when there is an error

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|OperationId of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution for the error|
|EventId|string|true|false|EventId for the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "EventId": "string",
  "property1": null,
  "property2": null
}

```

---

