---
uid: identity-claims

---

# Claims
An identity provider claim provides a mechanism to map a claim from an identity provider to one or more roles.

## `List all Identity Provider Claims`

<a id="opIdClaims_List all Identity Provider Claims"></a>

Returns all identity provider claims for an identity provider on a tenant.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderClaim](#schemaidentityproviderclaim)[]|List of identity provider claims found|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant or identity provider not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([IdentityProviderClaim](#schemaidentityproviderclaim)[])

```json
[
  {
    "Id": "string",
    "TypeName": "string",
    "Value": "string",
    "RoleIds": [
      "string"
    ],
    "IsBuiltIn": true
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get all Identity Provider Claims Header`

<a id="opIdClaims_Get all Identity Provider Claims Header"></a>

Returns the header information for all identity provider claims for an identity provider on a tenant.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Identity provider claim header information|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Tenant or identity provider not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Create New Identity Provider Claim`

<a id="opIdClaims_Create New Identity Provider Claim"></a>

Creates a new identity provider claim for an identity provider on a tenant.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>

<h4>Request Body</h4>

Identity provider claim to create<br/>

```json
{
  "Value": "string",
  "IdentityProviderClaimTypeNameId": "string",
  "RoleIds": [
    "string"
  ],
  "IsBuiltIn": true
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[IdentityProviderClaim](#schemaidentityproviderclaim)|Identity provider claim created|
|302|None|Found|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, or roles not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|409|[ErrorResponse](#schemaerrorresponse)|Identity provider claim configuration already exists|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 201 Response ([IdentityProviderClaim](#schemaidentityproviderclaim))

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ],
  "IsBuiltIn": true
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Identity Provider Claim`

<a id="opIdClaims_Get Identity Provider Claim"></a>

Returns an identity provider claim from an identity provider on a tenant.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderClaim](#schemaidentityproviderclaim)|Identity provider claim specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, or identity provider claim not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([IdentityProviderClaim](#schemaidentityproviderclaim))

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ],
  "IsBuiltIn": true
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Identity Provider Claim Header`

<a id="opIdClaims_Get Identity Provider Claim Header"></a>

Returns an identity provider claim header from an identity provider on a tenant.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Identity provider claim specified header|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Tenant, identity provider, or identity provider claim not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update an Existing Identity Provider Claim`

<a id="opIdClaims_Update an Existing Identity Provider Claim"></a>

Updates a new identity provider claim for an identity provider on a tenant.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim identifier.<br/><br/>

<h4>Request Body</h4>

Updated identity provider claim values<br/>

```json
{
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderClaim](#schemaidentityproviderclaim)|Updated identity provider claim|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, identity provider claim, or roles not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|409|[ErrorResponse](#schemaerrorresponse)|Identity provider claim configuration already exists|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([IdentityProviderClaim](#schemaidentityproviderclaim))

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ],
  "IsBuiltIn": true
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete an Existing Identity Provider Claim`

<a id="opIdClaims_Delete an Existing Identity Provider Claim"></a>

Deletes an identity provider claim for an identity provider on a tenant.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string identityProviderId`
<br/>Identity provider identifier.<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, or identity provider claim not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### IdentityProviderClaim

<a id="schemaidentityproviderclaim"></a>
<a id="schema_IdentityProviderClaim"></a>
<a id="tocSidentityproviderclaim"></a>
<a id="tocsidentityproviderclaim"></a>

Object representing a claim from an identity provider to map to a role

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Identity provider claim identifier|
|TypeName|string|false|true|Type name for this identity provider claim|
|Value|string|false|true|Value for this identity provider claim|
|RoleIds|string[]|false|true|List of role identifiers that this claim on this identity provider will map|
|IsBuiltIn|boolean|false|false|Indicates if this claim entry is built-in. When this value is true, callers cannot modify or delete the claim.|

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ],
  "IsBuiltIn": true
}

```

---

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

### IdentityProviderClaimCreate

<a id="schemaidentityproviderclaimcreate"></a>
<a id="schema_IdentityProviderClaimCreate"></a>
<a id="tocSidentityproviderclaimcreate"></a>
<a id="tocsidentityproviderclaimcreate"></a>

Identity provider claim to create

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|Value for this identity provider claim|
|IdentityProviderClaimTypeNameId|guid|false|false|Identity provider claim type name identifier for this identity provider claim|
|RoleIds|string[]|false|true|List of role identifiers associated with this identity provider claim|
|IsBuiltIn|boolean|false|false|Indicates if this claim entry is built-in. This value must be set to false or not specified.|

```json
{
  "Value": "string",
  "IdentityProviderClaimTypeNameId": "string",
  "RoleIds": [
    "string"
  ],
  "IsBuiltIn": true
}

```

---

### IdentityProviderClaimUpdate

<a id="schemaidentityproviderclaimupdate"></a>
<a id="schema_IdentityProviderClaimUpdate"></a>
<a id="tocSidentityproviderclaimupdate"></a>
<a id="tocsidentityproviderclaimupdate"></a>

Update information for an identity provider claim

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|Value for this identity provider claim|
|RoleIds|string[]|false|true|List of role identifiers associated with this identity provider claim|

```json
{
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}

```

---

