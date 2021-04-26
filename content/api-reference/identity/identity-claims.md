---
title: identity/identity-claims v20210426.3
language_tabs: []
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: osisoft.widdershins v1.0.7

---

# Claims
An identity provider claim provides a mechanism to map a claim from an identity provider to one or more roles.

## `List all Identity Provider Claims`

<a id="opIdClaims_List all Identity Provider Claims"></a>

Gets all identity provider claims for an identity provider on a tenant.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims
?query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Number of identity providers to skip<br/><br/>`[optional] integer count`
<br/>Maximum number of identity providers to return<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderClaim](#schemaidentityproviderclaim)[]|List of identity provider claims found|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant or identity provider not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "string",
    "TypeName": "string",
    "Value": "string",
    "RoleIds": [
      "string"
    ]
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get all Identity Provider Claims Header`

<a id="opIdClaims_Get all Identity Provider Claims Header"></a>

Gets header for all identity provider claims for an identity provider on a tenant.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Identity provider claim header information|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant or identity provider not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Create New Identity Provider Claim`

<a id="opIdClaims_Create New Identity Provider Claim"></a>

Creates a new identity provider claim for an identity provider on a tenant.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>

### Request Body

Identity provider claim to create.<br/>

```json
{
  "Value": "string",
  "IdentityProviderClaimTypeNameId": "string",
  "RoleIds": [
    "string"
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[IdentityProviderClaim](#schemaidentityproviderclaim)|Identity provider claim created|
|302|None|Found|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, or roles not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|409|[ErrorResponse](#schemaerrorresponse)|Identity provider claim configuration already exists.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 201 Response

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Identity Provider Claim`

<a id="opIdClaims_Get Identity Provider Claim"></a>

Gets an identity provider claim from an identity provider on a tenant.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim unique identifier.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderClaim](#schemaidentityproviderclaim)|Identity provider claim specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, or identity provider claim not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Identity Provider Claim Header`

<a id="opIdClaims_Get Identity Provider Claim Header"></a>

Gets an identity provider claim header from an identity provider on a tenant.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim unique identifier.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Identity provider claim specified header|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant, identity provider, or identity provider claim not found.|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update an Existing Identity Provider Claim`

<a id="opIdClaims_Update an Existing Identity Provider Claim"></a>

Updates a new identity provider claim for an identity provider on a tenant.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim unique identifier.<br/><br/>

### Request Body

Updated identity provider claim values.<br/>

```json
{
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[IdentityProviderClaim](#schemaidentityproviderclaim)|Updated identity provider claim|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, identity provider claim, or roles not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|409|[ErrorResponse](#schemaerrorresponse)|Identity provider claim configuration already exists.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete an Existing Identity Provider Claim`

<a id="opIdClaims_Delete an Existing Identity Provider Claim"></a>

Deletes an identity provider claim for an identity provider on a tenant.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string identityProviderId`
<br/>Identity provider unique identifier<br/><br/>`string identityProviderClaimId`
<br/>Identity provider claim unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant, identity provider, or identity provider claim not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 401 Response

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
# Definitions

## IdentityProviderClaim

<a id="schemaidentityproviderclaim"></a>
<a id="schema_IdentityProviderClaim"></a>
<a id="tocSidentityproviderclaim"></a>
<a id="tocsidentityproviderclaim"></a>

Object representing a claim from an identity provider to map to a role

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Identity provider claim unique identifier.|
|TypeName|string|false|true|Type name for this identity provider claim.|
|Value|string|false|true|Value for this identity provider claim.|
|RoleIds|string[]|false|true|List of role Ids that this claim on this identity provider will map to.|

```json
{
  "Id": "string",
  "TypeName": "string",
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}

```

---

## ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned whenever there is an error TODO: Remove this internal model and re-adopt public model when moving to System.Text.Json in WI 202168.

### Properties

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

## IdentityProviderClaimCreate

<a id="schemaidentityproviderclaimcreate"></a>
<a id="schema_IdentityProviderClaimCreate"></a>
<a id="tocSidentityproviderclaimcreate"></a>
<a id="tocsidentityproviderclaimcreate"></a>

Identity provider claim to create

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|Value for this identity provider claim.|
|IdentityProviderClaimTypeNameId|guid|false|false|Identity provider claim type name unique identifier for this identity provider claim.|
|RoleIds|string[]|false|true|List of role Ids associated with this identity provider claim.|

```json
{
  "Value": "string",
  "IdentityProviderClaimTypeNameId": "string",
  "RoleIds": [
    "string"
  ]
}

```

---

## IdentityProviderClaimUpdate

<a id="schemaidentityproviderclaimupdate"></a>
<a id="schema_IdentityProviderClaimUpdate"></a>
<a id="tocSidentityproviderclaimupdate"></a>
<a id="tocsidentityproviderclaimupdate"></a>

Update information for an identity provider claim.

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|Value for this identity provider claim.|
|RoleIds|string[]|false|true|List of role Ids associated with this identity provider claim.|

```json
{
  "Value": "string",
  "RoleIds": [
    "string"
  ]
}

```

---

