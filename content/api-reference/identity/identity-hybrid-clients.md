---
uid: identityHybridClient

---

# Hybrid Clients
Hybrid clients are used in typical, thick MVC clients with the presence of a user. These clients are issued an unique identifier and secret upon creation, which are later used for authentication against OCS. More than one secret can be created for a client. Hybrid clients can be issued refresh tokens, if requested, alongside access tokens. Refresh tokens typically have a longer lifetime than access tokens, and are used to request a new access token on behalf of the user without them having to log in. It is highly suggested that both the client secret and the refresh token be stored in a secure location.

## `List All Hybrid Clients (v1 path)`

<a id="opIdHybridClients_List All Hybrid Clients (v1 path)"></a>

Returns a list of hybrid clients from a tenant. Optionally, returns a list of requested clients. Total number of clients in the tenant set in the Total-Count header

### Request
```text 
GET /api/v1/Tenants/{tenantId}/HybridClients
?id={id}&tag={tag}&query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>
`[optional] array id`
<br/>Unordered list of identifiers for all clients to get. Empty or whitespace identifiers will be ignored.<br/><br/><br/>`[optional] array tag`
<br/>Only return clients that have these tags.<br/><br/><br/>`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[HybridClient](#schemahybridclient)[]|List of all hybrid clients found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([HybridClient](#schemahybridclient)[])

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
    "AllowOfflineAccess": true,
    "AllowAccessTokensViaBrowser": true
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get Total Count of Hybrid Clients`

<a id="opIdHybridClients_Get Total Count of Hybrid Clients"></a>

Returns the total number of hybrid clients in a tenant. Optionally, checks based on a list of requested clients. The value will be set in the Total-Count header. This method is identical to the GET method but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/HybridClients
?id={id}&tag={tag}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>
`[optional] array id`
<br/>Unordered list of identifiers for all clients to get. Empty or whitespace identifiers will be ignored.<br/><br/><br/>`[optional] array tag`
<br/>Only return clients that have these tags.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Hybrid client secrets found|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Create Hybrid Client (v1 path)`

<a id="opIdHybridClients_Create Hybrid Client (v1 path)"></a>

Creates a hybrid client. A client unique identifier and client secret will be generated to perform authentication. Make sure to store the secret somewhere safe as we do not store the actual value after the creation step. If you do not have access to the secret value, we suggest deleting the secret and adding a new one for this client. Clients have unique identifiers in a tenant. Currently there is a limit of 50000 clients (of all types) per tenant.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/HybridClients
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Request Body

HybridClientCreate object<br/>

```json
{
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true,
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
  "SecretDescription": "string",
  "SecretExpirationDate": "2019-08-24T14:15:22Z"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[HybridClientCreateResponse](#schemahybridclientcreateresponse)|Information about created hybrid client|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs, or client limit exceeded|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|409|[ErrorResponse](#schemaerrorresponse)|Client identifier already exists|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 201 Response ([HybridClientCreateResponse](#schemahybridclientcreateresponse))

```json
{
  "Secret": "string",
  "Id": 0,
  "Description": "string",
  "ExpirationDate": "2019-08-24T14:15:22Z",
  "Client": {
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
    "AllowOfflineAccess": true,
    "AllowAccessTokensViaBrowser": true
  }
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Hybrid Client (v1 path)`

<a id="opIdHybridClients_Get Hybrid Client (v1 path)"></a>

Returns a hybrid client from a tenant.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/HybridClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[HybridClient](#schemahybridclient)|Information about specified hybrid client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([HybridClient](#schemahybridclient))

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
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get Header for Hybrid Client`

<a id="opIdHybridClients_Get Header for Hybrid Client"></a>

Validates that a hybrid client exists. This method is identical to the GET method but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/HybridClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified hybrid client|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Update Hybrid Client (v1 path)`

<a id="opIdHybridClients_Update Hybrid Client (v1 path)"></a>

Updates a hybrid client. It can take up to one hour for these values to manifest in the authentication process.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/HybridClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

HybridClient object. Properties that are not set or are null will not be changed.<br/>

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
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[HybridClient](#schemahybridclient)|Information about updated hybrid client|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([HybridClient](#schemahybridclient))

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
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Hybrid Client`

<a id="opIdHybridClients_Delete Hybrid Client"></a>

Deletes a hybrid client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued to this client will be valid until their expiration. Refresh tokens issued to this will be valid up to one hour after deletion.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/HybridClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 401 Response ([ErrorResponse](#schemaerrorresponse))

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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List All Hybrid Clients (v1-preview path)`

<a id="opIdHybridClients_List All Hybrid Clients (v1-preview path)"></a>

Returns all hybrid clients.

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/HybridClients
?tag={tag}&query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>
`[optional] array tag`
<br/>Only return clients that have these tags.<br/><br/><br/>`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[HybridClient2](#schemahybridclient2)[]|List of hybrid clients found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([HybridClient2](#schemahybridclient2)[])

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
    "ClientId": "string",
    "Id": "string",
    "Name": "string",
    "Enabled": true,
    "Tags": [
      "string"
    ],
    "AllowOfflineAccess": true,
    "AllowAccessTokensViaBrowser": true
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Create Hybrid Client (v1-preview path)`

<a id="opIdHybridClients_Create Hybrid Client (v1-preview path)"></a>

Creates a hybrid flow client.

### Request
```text 
POST /api/v1-preview/Tenants/{tenantId}/HybridClients
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Request Body

New HybridClientCreate object<br/>

```json
{
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true,
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "SecretDescription": "string",
  "SecretExpirationDate": "2019-08-24T14:15:22Z"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[HybridClientResponse](#schemahybridclientresponse)|Hybrid Client created|
|400|[ErrorResponse](#schemaerrorresponse)|Client limit exceeded|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|409|[ErrorResponse](#schemaerrorresponse)|Client identifier already exists|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 201 Response ([HybridClientResponse](#schemahybridclientresponse))

```json
{
  "SecretDescription": "string",
  "SecretExpirationDate": "2019-08-24T14:15:22Z",
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true,
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "ClientSecret": "string",
  "SecretId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Hybrid Client (v1-preview path)`

<a id="opIdHybridClients_Get Hybrid Client (v1-preview path)"></a>

Returns a hybrid client.

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[HybridClient2](#schemahybridclient2)|Hybrid client specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([HybridClient2](#schemahybridclient2))

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
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Hybrid Client (v1-preview path)`

<a id="opIdHybridClients_Update Hybrid Client (v1-preview path)"></a>

Updates a hybrid client.

### Request
```text 
PUT /api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

Updated Hybrid Client values<br/>

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
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[HybridClient2](#schemahybridclient2)|Updated hybrid client|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([HybridClient2](#schemahybridclient2))

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
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### HybridClientCreateResponse

<a id="schemahybridclientcreateresponse"></a>
<a id="schema_HybridClientCreateResponse"></a>
<a id="tocShybridclientcreateresponse"></a>
<a id="tocshybridclientcreateresponse"></a>

Secret information returned after a hybrid client is created

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Secret|string|false|true|Client secret|
|Id|int32|false|false|Secret identifier|
|Description|string|false|true|Description for the initial secret for the client|
|ExpirationDate|date-time|false|true|Expiration date for the initial secret for the client|
|Client|[HybridClient](#schemahybridclient)|false|true|Created hybrid client object|

```json
{
  "Secret": "string",
  "Id": 0,
  "Description": "string",
  "ExpirationDate": "2019-08-24T14:15:22Z",
  "Client": {
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
    "AllowOfflineAccess": true,
    "AllowAccessTokensViaBrowser": true
  }
}

```

---

### HybridClient

<a id="schemahybridclient"></a>
<a id="schema_HybridClient"></a>
<a id="tocShybridclient"></a>
<a id="tocshybridclient"></a>

Object used for hybrid clients

#### Properties

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
|AllowOfflineAccess|boolean|false|true|Whether this client can request refresh tokens, by providing the *offline_access* scope.|
|AllowAccessTokensViaBrowser|boolean|false|true|Whether this hybrid client is allowed to receive access tokens through the browser. This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).|

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
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}

```

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

### HybridClientCreate

<a id="schemahybridclientcreate"></a>
<a id="schema_HybridClientCreate"></a>
<a id="tocShybridclientcreate"></a>
<a id="tocshybridclientcreate"></a>

Object used during hybrid client creation

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AllowOfflineAccess|boolean|false|true|Whether this client can request refresh tokens, by providing the *offline_access* scope.|
|AllowAccessTokensViaBrowser|boolean|false|true|Whether this hybrid client is allowed to receive access tokens through the browser. This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).|
|RedirectUris|string[]|false|true|Note: Required when creating a client, but optional when updating a client. Allowed URIs to which return tokens or authorization codes can be returned. Wildcards are ignored. URIs must match exactly what you are redirecting to after login. If URIs do not match, the authentication process will fail with a bad_client error. Maximum 10 per client.|
|PostLogoutRedirectUris|string[]|false|true|Allowed URIs to redirect to after logout. Wildcards are ignored. URIs must match exactly what you are redirecting to after logout. Maximum 10 per client.|
|ClientUri|string|false|true|URI to a page with information about client (used on consent screen)|
|LogoUri|string|false|true|URI to client logo (used on consent screen)|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|AccessTokenLifetime|int32|false|true|Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|SecretDescription|string|false|true|Description for the initial secret for the client|
|SecretExpirationDate|date-time|false|true|Expiration date for the initial secret for the client. If set to null the secret will never expire. We advise against such practice.|

```json
{
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true,
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
  "SecretDescription": "string",
  "SecretExpirationDate": "2019-08-24T14:15:22Z"
}

```

---

### HybridClientResponse

<a id="schemahybridclientresponse"></a>
<a id="schema_HybridClientResponse"></a>
<a id="tocShybridclientresponse"></a>
<a id="tocshybridclientresponse"></a>

Object returned after a hybrid client is created

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SecretDescription|string|false|true|Description for the initial secret for the client|
|SecretExpirationDate|date-time|false|true|Expiration date for the initial secret for the client. If set to null the secret will never expire. We advise against such practice.|
|AllowOfflineAccess|boolean|false|true|Whether client can request refresh tokens, by providing the *offline_access* scopes.|
|AllowAccessTokensViaBrowser|boolean|false|true|Whether this hybrid client is allowed to receive access tokens through the browser. This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).|
|RedirectUris|string[]|false|true|Note: Required when creating a client, but optional when updating a client. Allowed URIs to which return tokens or authorization codes can be returned. Wildcards are ignored. URIs must match exactly what you are redirecting to after login. If URIs do not match, the authentication process will fail with a bad_client error. Maximum 10 per client.|
|PostLogoutRedirectUris|string[]|false|true|Allowed URIs to redirect to after logout. Wildcards are ignored. URIs must match exactly what you are redirecting to after logout. Maximum 10 per client.|
|ClientUri|string|false|true|URI to a page with information about client (used on consent screen)|
|LogoUri|string|false|true|URI to client logo (used on consent screen)|
|ClientId|string|false|true|Obsolete: Use identifier.|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|ClientSecret|string|false|true|Client secret. This is the only time the secret will be available. Please store this secret somewhere safe.|
|SecretId|string|false|true|Secret identifier|

```json
{
  "SecretDescription": "string",
  "SecretExpirationDate": "2019-08-24T14:15:22Z",
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true,
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "ClientSecret": "string",
  "SecretId": "string"
}

```

---

### HybridClientCreate2

<a id="schemahybridclientcreate2"></a>
<a id="schema_HybridClientCreate2"></a>
<a id="tocShybridclientcreate2"></a>
<a id="tocshybridclientcreate2"></a>

Object used during hybrid client creation

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AllowOfflineAccess|boolean|false|true|Whether client can request refresh tokens, by providing the *offline_access* scopes.|
|AllowAccessTokensViaBrowser|boolean|false|true|Whether this hybrid client is allowed to receive access tokens through the browser. This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).|
|RedirectUris|string[]|false|true|Note: Required when creating a client, but optional when updating a client. Allowed URIs to which return tokens or authorization codes can be returned. Wildcards are ignored. URIs must match exactly what you are redirecting to after login. If URIs do not match, the authentication process will fail with a bad_client error. Maximum 10 per client.|
|PostLogoutRedirectUris|string[]|false|true|Allowed URIs to redirect to after logout. Wildcards are ignored. URIs must match exactly what you are redirecting to after logout. Maximum 10 per client.|
|ClientUri|string|false|true|URI to a page with information about client (used on consent screen)|
|LogoUri|string|false|true|URI to client logo (used on consent screen)|
|ClientId|string|false|true|Obsolete: Use identifier.|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|SecretDescription|string|false|true|Description for the initial secret for the client|
|SecretExpirationDate|date-time|false|true|Expiration date for the initial secret for the client. If set to null the secret will never expire. We advise against such practice.|

```json
{
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true,
  "RedirectUris": [
    "string"
  ],
  "PostLogoutRedirectUris": [
    "string"
  ],
  "ClientUri": "string",
  "LogoUri": "string",
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "SecretDescription": "string",
  "SecretExpirationDate": "2019-08-24T14:15:22Z"
}

```

---

### HybridClient2

<a id="schemahybridclient2"></a>
<a id="schema_HybridClient2"></a>
<a id="tocShybridclient2"></a>
<a id="tocshybridclient2"></a>

Object used for hybrid clients

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|RedirectUris|string[]|false|true|Note: Required when creating a client, but optional when updating a client. Allowed URIs to which return tokens or authorization codes can be returned. Wildcards are ignored. URIs must match exactly what you are redirecting to after login. If URIs do not match, the authentication process will fail with a bad_client error. Maximum 10 per client.|
|PostLogoutRedirectUris|string[]|false|true|Allowed URIs to redirect to after logout. Wildcards are ignored. URIs must match exactly what you are redirecting to after logout. Maximum 10 per client.|
|ClientUri|string|false|true|URI to a page with information about client (used on consent screen)|
|LogoUri|string|false|true|URI to client logo (used on consent screen)|
|ClientId|string|false|true|Obsolete: Use identifier.|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|AllowOfflineAccess|boolean|false|true|Whether client can request refresh tokens, by providing the *offline_access* scopes.|
|AllowAccessTokensViaBrowser|boolean|false|true|Whether this hybrid client is allowed to receive access tokens through the browser. This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).|

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
  "ClientId": "string",
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "Tags": [
    "string"
  ],
  "AllowOfflineAccess": true,
  "AllowAccessTokensViaBrowser": true
}

```

---

