

# Roles
APIs for creating, getting, updating, and deleting roles on a tenant.

## `List Roles`

<a id="opIdRoles_List Roles"></a>

Gets all roles for a tenant including roles for any communities that the tenant belongs to.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Roles
?query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Number of providers to skip<br/><br/>`[optional] integer count`
<br/>Max number of providers to return<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)[]|List of roles found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

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
<li>Tenant Member</li>
</ul>

---

## `Get Header for Roles`

<a id="opIdRoles_Get Header for Roles"></a>

Gets header for roles to get the total number of roles for a given tenant including community roles for any community the tenant is joined to.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Roles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Headers for roles found|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create Role on Tenant`

<a id="opIdRoles_Create Role on Tenant"></a>

Creates a new tenant `Role`.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Roles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>

### Request Body

Role to create<br/>

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

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[Role](#schemarole)|Role created|
|302|None|A role with the same unique identifier or name already exists in the tenant.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant or role not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|409|[ErrorResponse](#schemaerrorresponse)|A role with some matching values already exists in tenant.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 201 Response

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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Role`

<a id="opIdRoles_Get Role"></a>

Returns the specified role.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Roles/{roleId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)|Role specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Role or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Header for a Given Role`

<a id="opIdRoles_Get Header for a Given Role"></a>

Gets the header for a role on a given tenant.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Roles/{roleId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Provider unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for role specified|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Identity provider or tenant not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Update Role on Tenant`

<a id="opIdRoles_Update Role on Tenant"></a>

Updates a `Role` for a tenant.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Roles/{roleId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Request Body

Role to update<br/>

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

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Role](#schemarole)|Updated role|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant or role not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Tenant Role`

<a id="opIdRoles_Delete Tenant Role"></a>

Deletes any tenant-scoped, non built-in `Role` by its role unique identifier.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Roles/{roleId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Identity provider or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "property1": null,
  "property2": null
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List All Clients for a Given Role`

<a id="opIdRoles_List All Clients for a Given Role"></a>

Gets all the clients for a given role.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Roles/{roleId}/clientcredentialclients
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientCredentialClient](#schemaclientcredentialclient)[]|Clients for a given role|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant or role not found|
|500|None|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Enabled": true,
    "AccessTokenLifetime": 0,
    "Tags": [
      "string"
    ],
    "RoleIds": [
      "string"
    ]
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Count of Clients for a Given Role`

<a id="opIdRoles_Get Count of Clients for a Given Role"></a>

Gets the total number of clients for a given role.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Roles/{roleId}/clientcredentialclients
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Headers for the total number of clients for a given role|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant or role not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `List Users for a Given Role`

<a id="opIdRoles_List Users for a Given Role"></a>

Gets all users for a given role.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Roles/{roleId}/users
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[User](#schemauser)[]|Users for a given role|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant or role not found|
|500|None|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "string",
    "GivenName": "string",
    "Surname": "string",
    "Name": "string",
    "Email": "string",
    "ContactEmail": "string",
    "ContactGivenName": "string",
    "ContactSurname": "string",
    "ExternalUserId": "string",
    "IdentityProviderId": "string",
    "RoleIds": [
      "string"
    ]
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Total Count of Users for a Given Role`

<a id="opIdRoles_Get Total Count of Users for a Given Role"></a>

Gets total number of users for a given role.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Roles/{roleId}/users
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string roleId`
<br/>Role unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Headers for roles found|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant or role not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---
## Definitions

### Role

<a id="schemarole"></a>
<a id="schema_Role"></a>
<a id="tocSrole"></a>
<a id="tocsrole"></a>

The object for retrieving a role

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Role unique identifier. Generated by the server upon creation.|
|Name|string|false|true|Role name. This cannot be empty.|
|Description|string|false|true|Role description.|
|RoleScope|[RoleScope](#schemarolescope)|false|true|Role scope.|
|TenantId|string|false|true|Tenant unique identifier, if this is a Tenant Role. Otherwise set to null.|
|CommunityId|string|false|true|Community unique identifier, if this is a Community Role. Otherwise set to null.|
|RoleTypeId|string|false|true|Role type identifier for built-in roles.|

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

Object returned whenever there is an error TODO: Remove this internal model and re-adopt public model when moving to System.Text.Json in WI 202168.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|Gets or sets operationId of action that caused the Error.|
|Error|string|true|false|Gets or sets error description.|
|Reason|string|true|false|Gets or sets reason for the Error.|
|Resolution|string|true|false|Gets or sets what can be done to resolve the Error.|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "property1": null,
  "property2": null
}

```

---

### User

<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>

Object for retrieving a user

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|User unique identifier|
|GivenName|string|false|true|Given name of the user|
|Surname|string|false|true|Surname of the user|
|Name|string|false|true|Name of the user|
|Email|string|false|true|Email of the user|
|ContactEmail|string|false|true|Contact email for the user. User will only be contacted through this email.|
|ContactGivenName|string|false|true|Preferred given name for the user|
|ContactSurname|string|false|true|Preferred contact surname for the user|
|ExternalUserId|string|false|true|Provider unique identifier for the user. This is the unique identifier we get from the identity provider.|
|IdentityProviderId|guid|false|true|Identity provider unique identifier used to authenticate the user. Will be set once the user accepts an invitation. If not specified when sending the invitation to the user, it can be any of the identity provider Ids configured for this tenant.|
|RoleIds|string[]|false|true|List of roles to be assigned to this client. Member role is always required. For security reasons we advise against assigning administrator role to a client.|

```json
{
  "Id": "string",
  "GivenName": "string",
  "Surname": "string",
  "Name": "string",
  "Email": "string",
  "ContactEmail": "string",
  "ContactGivenName": "string",
  "ContactSurname": "string",
  "ExternalUserId": "string",
  "IdentityProviderId": "string",
  "RoleIds": [
    "string"
  ]
}

```

---

### ClientCredentialClient

<a id="schemaclientcredentialclient"></a>
<a id="schema_ClientCredentialClient"></a>
<a id="tocSclientcredentialclient"></a>
<a id="tocsclientcredentialclient"></a>

Object to get or update a ClientCredentialClient

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Client unique identifier for this client. This unique identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|AccessTokenLifetime|int32|false|true|Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|RoleIds|string[]|false|true|List of roles to be assigned to this client. Member role is always required. For security reasons we advise against assigning administrator role to a client.|

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "RoleIds": [
    "string"
  ]
}

```

---

