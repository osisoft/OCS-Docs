---
uid: identity-authorization-code-clients

---

# Authorization Code Clients
Authorization code clients are used in JavaScript/Browser (SPA) based applications or native mobile applications with the presence of a user. These clients are issued a unique identifier. You can read more about these clients [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md#authorization-code-flow-with-pkce). Authorization code clients are not issued secrets or refresh tokens. For some guidelines on use of secrets, refer to the [Credential management](xref:CredentialManagement) topic. For some recommendations on least privilege for users and clients, refer to the [Least privilege](xref:LeastPrivilege) topic.

## `List All Authorization Code Clients from Tenant`

<a id="opIdAuthorizationCodeClients_List All Authorization Code Clients from Tenant"></a>

Returns all authorization code clients from a tenant. Optionally, returns a list of requested clients. Total number of clients in the tenant is set in the Total-Count header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/AuthorizationCodeClients
?id={id}&tag={tag}&query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] array id`
<br/>Unordered list of identifiers for all clients to get. Empty or whitespace identifiers will be ignored.<br/><br/>`[optional] array tag`
<br/>Only return clients that have these tags.<br/><br/>`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AuthorizationCodeClient](#schemaauthorizationcodeclient)[]|Authorization code clients found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([AuthorizationCodeClient](#schemaauthorizationcodeclient)[])

```json
[
  {
    "RedirectUris": [
      "string"
    ],
    "PostLogoutRedirectUris": [
      "string"
    ],
    "ClientUri": "string",
    "LogoUri": "string",
    "Id": "string",
    "Name": "string",
    "Enabled": true,
    "AccessTokenLifetime": 0,
    "Tags": [
      "string"
    ],
    "AllowedCorsOrigins": [
      "string"
    ]
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get Total Count Authorization Code Clients from Tenant`

<a id="opIdAuthorizationCodeClients_Get Total Count Authorization Code Clients from Tenant"></a>

Returns the total number of authorization code clients in a tenant. Optionally, checks based on a list of requested clients. The value will be set in the Total-Count header. This method is identical to the GET method but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/AuthorizationCodeClients
?id={id}&tag={tag}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] array id`
<br/>Unordered list of identifiers for all clients to get. Empty or whitespace identifiers will be ignored.<br/><br/>`[optional] array tag`
<br/>Only return clients that have these tags.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Authorization code client headers|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Client or tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Create an Authorization Code Client`

<a id="opIdAuthorizationCodeClients_Create an Authorization Code Client"></a>

Creates an authorization code client. No secret will be generated for this client.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/AuthorizationCodeClients
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>

<h4>Request Body</h4>

New AuthorizationCodeClient object<br/>

```json
{
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "AllowedCorsOrigins": [
    "string"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[AuthorizationCodeClient](#schemaauthorizationcodeclient)|Authorization code client created|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs, or client limit exceeded|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|409|[ErrorResponse](#schemaerrorresponse)|Client identifier already exists|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 201 Response ([AuthorizationCodeClient](#schemaauthorizationcodeclient))

```json
{
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "AllowedCorsOrigins": [
    "string"
  ]
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get an Authorization Code Client from Tenant`

<a id="opIdAuthorizationCodeClients_Get an Authorization Code Client from Tenant"></a>

Returns an authorization code client from a tenant.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/AuthorizationCodeClients/{clientId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AuthorizationCodeClient](#schemaauthorizationcodeclient)|Authorization code client specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([AuthorizationCodeClient](#schemaauthorizationcodeclient))

```json
{
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "AllowedCorsOrigins": [
    "string"
  ]
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get Header for Authorization Code Client`

<a id="opIdAuthorizationCodeClients_Get Header for Authorization Code Client"></a>

Validates that an authorization code client exists in tenant.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/AuthorizationCodeClients/{clientId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientCredentialClient](#schemaclientcredentialclient)|Header for specified authorization code client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientCredentialClient](#schemaclientcredentialclient))

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Update an Authorization Code Client`

<a id="opIdAuthorizationCodeClients_Update an Authorization Code Client"></a>

Updates an authorization code client. It can take up to one hour for update to manifest in the authentication process.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/AuthorizationCodeClients/{clientId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h4>Request Body</h4>

Updated authorization code client values. Properties that are not set or are null will not be changed.<br/>

```json
{
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "AllowedCorsOrigins": [
    "string"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AuthorizationCodeClient](#schemaauthorizationcodeclient)|Authorization code client updated|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([AuthorizationCodeClient](#schemaauthorizationcodeclient))

```json
{
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "AllowedCorsOrigins": [
    "string"
  ]
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete an Authorization Code Client`

<a id="opIdAuthorizationCodeClients_Delete an Authorization Code Client"></a>

Deletes an authorization code client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued to this client will be valid until their expiration.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/AuthorizationCodeClients/{clientId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### AuthorizationCodeClient

<a id="schemaauthorizationcodeclient"></a>
<a id="schema_AuthorizationCodeClient"></a>
<a id="tocSauthorizationcodeclient"></a>
<a id="tocsauthorizationcodeclient"></a>

Object used during AuthorizationCodeClient creation

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|RedirectUris|string[]|false|true|Note: Required when creating a client, but optional when updating a client. Allowed URIs to which return tokens or authorization codes can be returned. Wildcards are ignored. URIs must match exactly what you are redirecting to after login. If URIs do not match, the authentication process will fail with a bad_client error. Maximum 10 per client.|
|PostLogoutRedirectUris|string[]|false|true|Allowed URIs to redirect to after logout. Wildcards are ignored. URIs must match exactly what you are redirecting to after logout. Maximum 10 per client.|
|ClientUri|string|false|true|URI to a page with information about client (used on consent screen)|
|LogoUri|string|false|true|URI to client logo (used on consent screen)|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|AccessTokenLifetime|int32|false|true|Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|AllowedCorsOrigins|string[]|false|true|Values used by the default CORS policy service implementations to build a CORS policy for JavaScript clients|

```json
{
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "AllowedCorsOrigins": [
    "string"
  ]
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

### ClientCredentialClient

<a id="schemaclientcredentialclient"></a>
<a id="schema_ClientCredentialClient"></a>
<a id="tocSclientcredentialclient"></a>
<a id="tocsclientcredentialclient"></a>

Object to return or update a ClientCredentialClient

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|AccessTokenLifetime|int32|false|true|Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|RoleIds|string[]|false|true|List of roles to be assigned to this client. Member role is always required. For security reasons, we advise against assigning administrator role to a client.|

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

