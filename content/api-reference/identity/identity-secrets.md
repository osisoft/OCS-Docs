---
uid: identity-secrets

---

# Secrets
Secrets are used to authenticate both client credential clients and hybrid clients. A secret has an expiration date or can be created to never expire. We advise to avoid creating secrets that do not expire. After a secret expires, it can no longer be used to authenticate the client. While a secret is still valid, any access token issued will be active until the token itself expires. The same applies to refresh tokens, which are issued to hybrid clients. Safe storage of secrets is your responsibility. OCS does not store secret values, so once lost, there is no way to retrieve the value of a secret.

## `List Client Credential Client Secrets (v1 path)`

<a id="opIdSecrets_List Client Credential Client Secrets (v1 path)"></a>

Returns all secrets for a client credential client. Total number of secrets in the client set in the Total-Count header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)[]|List of secret information corresponding to the specified client credential client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientSecret](#schemaclientsecret)[])

```json
[
  {
    "Expiration": "2019-08-24T14:15:22Z",
    "Expires": true,
    "Description": "string",
    "Id": 0
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Total Count of Client Credential Client Secrets`

<a id="opIdSecrets_Get Total Count of Client Credential Client Secrets"></a>

Returns the total number of secrets in a client credential client. The value will be set in the Total-Count header. This method is identical to the GET method, but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Client credential client secret header information|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Client or tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add Client Credential Client Secret (v1 path)`

<a id="opIdSecrets_Add Client Credential Client Secret (v1 path)"></a>

Adds a new secret to a client credential client. A client can have a maximum of 10 secrets. We advise against creating secrets that do not expire.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h4>Request Body</h4>

ClientSecretCreateOrUpdate object.<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[ClientSecretResponse](#schemaclientsecretresponse)|Information about the created secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 201 Response ([ClientSecretResponse](#schemaclientsecretresponse))

```json
{
  "Id": 0,
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Secret": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Client Credential Client Secret (v1 path)`

<a id="opIdSecrets_Get Client Credential Client Secret (v1 path)"></a>

Returns a client credential client secret.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about the specified secret|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for Client Credential Client Secret`

<a id="opIdSecrets_Get Header for Client Credential Client Secret"></a>

Validates that a secret with a given unique identifier exists in the client. This method is identical to the GET method, but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified client secret|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Secret, client, or tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Client Credential Client Secret (v1 path)`

<a id="opIdSecrets_Update Client Credential Client Secret (v1 path)"></a>

Updates a client credential client secret. It can take up to one hour for the update to manifest in the authentication process.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h4>Request Body</h4>

ClientSecretCreateOrUpdate object. Properties that are not set or are null will not be changed.<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about the updated secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Client Credential Client Secret`

<a id="opIdSecrets_Delete Client Credential Client Secret"></a>

Deletes a secret from a client credential client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued using this secret will be valid until their expiration.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List Hybrid Client Secrets (v1 path)`

<a id="opIdSecrets_List Hybrid Client Secrets (v1 path)"></a>

Returns all secrets for a hybrid client. Total number of secrets in the client set in the Total-Count header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)[]|List of hybrid client secret information corresponding to the specified client credential client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientSecret](#schemaclientsecret)[])

```json
[
  {
    "Expiration": "2019-08-24T14:15:22Z",
    "Expires": true,
    "Description": "string",
    "Id": 0
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Total Count of Hybrid Client Secrets`

<a id="opIdSecrets_Get Total Count of Hybrid Client Secrets"></a>

Returns total number of secrets in a hybrid client. The value will be set in the Total-Count header. This method is identical to the GET method but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Headers for hybrid client secret|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Client or tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add Hybrid Client Secret (v1 path)`

<a id="opIdSecrets_Add Hybrid Client Secret (v1 path)"></a>

Adds a new secret to a hybrid client. A client can have a maximum of 10 secrets. We advise against creating secrets that do not expire.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>

<h4>Request Body</h4>

ClientSecretCreateOrUpdate object<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[ClientSecretResponse](#schemaclientsecretresponse)|Information about created hybrid client secret|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 201 Response ([ClientSecretResponse](#schemaclientsecretresponse))

```json
{
  "Id": 0,
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Secret": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Hybrid Client Secret (v1 path)`

<a id="opIdSecrets_Get Hybrid Client Secret (v1 path)"></a>

Returns a hybrid client secret.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about specified hybrid client secret|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for Hybrid Client Secret`

<a id="opIdSecrets_Get Header for Hybrid Client Secret"></a>

Validates that a secret unique identifier exists in the client. This method is identical to the GET method but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for hybrid client secret|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|Secret, client, or tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Hybrid Client Secret (v1 path)`

<a id="opIdSecrets_Update Hybrid Client Secret (v1 path)"></a>

Updates a hybrid client secret. It can take up to one hour for the update to manifest in the authentication process.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h4>Request Body</h4>

ClientSecretCreateOrUpdate object. Properties that are not set or are null will not be changed.<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about updated hybrid client secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Hybrid Client Secret`

<a id="opIdSecrets_Delete Hybrid Client Secret"></a>

Deletes a secret from a hybrid client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued using this secret will be valid until their expiration.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string clientId`
<br/>Client identifier.<br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## Definitions

### ClientSecret

<a id="schemaclientsecret"></a>
<a id="schema_ClientSecret"></a>
<a id="tocSclientsecret"></a>
<a id="tocsclientsecret"></a>

Client secret object

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Expiration|date-time|false|true|Expiration date for the client secret. Will be null if the secret does not expire.|
|Expires|boolean|false|true|Value indicating whether the secret expires. Defaults to true. If Expires is set to true (or null) and expiration is not null, expiration of this secret will be enforced. If Expires is set to true (or null) and expiration is null, a 400 error will be returned. If Expires is set to false and expiration is not null, a 400 error will be returned. If Expires is set to false and expiration is null, there will be no expiration of this secret.|
|Description|string|false|true|Description for the client secret. We suggest being as descriptive as possible. This field will make identifying secrets easier.|
|Id|int32|false|false|Identifier of this client secret|

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
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

### ClientSecretResponse

<a id="schemaclientsecretresponse"></a>
<a id="schema_ClientSecretResponse"></a>
<a id="tocSclientsecretresponse"></a>
<a id="tocsclientsecretresponse"></a>

Object returned after a client secret is created

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|int32|false|false|Identifier of this client secret|
|Expiration|date-time|false|true|Expiration date for the client secret. Will be null if the secret does not expire.|
|Expires|boolean|false|true|Value indicating whether the secret expires. Defaults to true. If Expires is set to true (or null) and expiration is not null, expiration of this secret will be enforced. If Expires is set to true (or null) and expiration is null, a 400 error will be returned. If Expires is set to false and expiration is not null, a 400 error will be returned. If Expires is set to false and expiration is null, there will be no expiration of this secret.|
|Description|string|false|true|Description for the client secret. We suggest being as descriptive as possible. This field will make identifying secrets easier.|
|Secret|string|false|true|Client secret|

```json
{
  "Id": 0,
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Secret": "string"
}

```

---

### ClientSecretCreateOrUpdate

<a id="schemaclientsecretcreateorupdate"></a>
<a id="schema_ClientSecretCreateOrUpdate"></a>
<a id="tocSclientsecretcreateorupdate"></a>
<a id="tocsclientsecretcreateorupdate"></a>

Object to write a client secret

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Expiration|date-time|false|true|Expiration date for the client secret. Will be null if the secret does not expire.|
|Expires|boolean|false|true|Value indicating whether the secret expires. Defaults to true. If Expires is set to true (or null) and expiration is not null, expiration of this secret will be enforced. If Expires is set to true (or null) and expiration is null, a 400 error will be returned. If Expires is set to false and expiration is not null, a 400 error will be returned. If Expires is set to false and expiration is null, there will be no expiration of this secret.|
|Description|string|false|true|Description for the client secret. We suggest being as descriptive as possible. This field will make identifying secrets easier.|

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}

```

---

### ClientSecret2

<a id="schemaclientsecret2"></a>
<a id="schema_ClientSecret2"></a>
<a id="tocSclientsecret2"></a>
<a id="tocsclientsecret2"></a>

Client secret object

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Expiration|date-time|false|true|Expiration date for the client secret. Will be null if the secret does not expire.|
|Expires|boolean|false|true|Value indicating whether the secret expires. Defaults to true. If Expires is set to true (or null) and expiration is not null, expiration of this secret will be enforced. If Expires is set to true (or null) and expiration is null, a 400 error will be returned. If Expires is set to false and expiration is not null, a 400 error will be returned. If Expires is set to false and expiration is null, there will be no expiration of this secret.|
|Description|string|false|true|Description for the client secret. We suggest being as descriptive as possible. This field will make identifying secrets easier.|
|SecretId|string|false|true|Obsolete: Use identifier|
|Id|string|false|true|Identifier for this secret|

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "SecretId": "string",
  "Id": "string"
}

```

---

### ClientSecretResponse2

<a id="schemaclientsecretresponse2"></a>
<a id="schema_ClientSecretResponse2"></a>
<a id="tocSclientsecretresponse2"></a>
<a id="tocsclientsecretresponse2"></a>

Object returned after a client secret is created

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SecretId|string|false|true|Obsolete: Use identifier|
|Id|string|false|true|Identifier for this secret|
|Expiration|date-time|false|true|Expiration date for the client secret. Will be null if the secret does not expire.|
|Expires|boolean|false|true|Value indicating whether the secret expires. Defaults to true. If Expires is set to true (or null) and expiration is not null, expiration of this secret will be enforced. If Expires is set to true (or null) and expiration is null, a 400 error will be returned. If Expires is set to false and expiration is not null, a 400 error will be returned. If Expires is set to false and expiration is null, there will be no expiration of this secret.|
|Description|string|false|true|Description for the client secret. We suggest being as descriptive as possible. This field will make identifying secrets easier.|
|ClientSecret|string|false|true|Obsolete: Use secret|
|Secret|string|false|true|Client secret|

```json
{
  "SecretId": "string",
  "Id": "string",
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "ClientSecret": "string",
  "Secret": "string"
}

```

---

