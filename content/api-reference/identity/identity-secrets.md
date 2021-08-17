---
uid: identity-secrets

---

# Secrets
Secrets are used to authenticate both client credential clients and hybrid clients. A secret has an expiration date or can be created to never expire. We advise to avoid creating secrets that do not expire. After a secret expires, it can no longer be used to authenticate the client. While a secret is still valid, any access token issued will be active until the token itself expires. The same applies to refresh tokens, which are issued to hybrid clients. Safe storage of secrets is your responsibility. OCS does not store secret values, so once lost, there is no way to retrieve the value of a secret.

## `List Client Credential Client Secrets (v1 path)`

<a id="opIdSecrets_List Client Credential Client Secrets (v1 path)"></a>

Returns all secrets for a client credential client. Total number of secrets in the client set in the Total-Count header.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
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
|200|[ClientSecret](#schemaclientsecret)[]|List of secret information corresponding to the specified client credential client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Total Count of Client Credential Client Secrets`

<a id="opIdSecrets_Get Total Count of Client Credential Client Secrets"></a>

Returns the total number of secrets in a client credential client. The value will be set in the Total-Count header. This method is identical to the GET method, but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Client credential client secret header information|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add Client Credential Client Secret (v1 path)`

<a id="opIdSecrets_Add Client Credential Client Secret (v1 path)"></a>

Adds a new secret to a client credential client. A client can have a maximum of 10 secrets. We advise against creating secrets that do not expire.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

ClientSecretCreateOrUpdate object.<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[ClientSecretResponse](#schemaclientsecretresponse)|Information about the created secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Client Credential Client Secret (v1 path)`

<a id="opIdSecrets_Get Client Credential Client Secret (v1 path)"></a>

Returns a client credential client secret.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about the specified secret|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for Client Credential Client Secret`

<a id="opIdSecrets_Get Header for Client Credential Client Secret"></a>

Validates that a secret with a given unique identifier exists in the client. This method is identical to the GET method, but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified client secret|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Secret, client, or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Client Credential Client Secret (v1 path)`

<a id="opIdSecrets_Update Client Credential Client Secret (v1 path)"></a>

Updates a client credential client secret. It can take up to one hour for the update to manifest in the authentication process.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Request Body

ClientSecretCreateOrUpdate object. Properties that are not set or are null will not be changed.<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about the updated secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Client Credential Client Secret`

<a id="opIdSecrets_Delete Client Credential Client Secret"></a>

Deletes a secret from a client credential client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued using this secret will be valid until their expiration.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
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
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
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

## `List Client Credential Client Secrets (v1-preview path)`

<a id="opIdSecrets_List Client Credential Client Secrets (v1-preview path)"></a>

Returns all secrets for a client credential client.

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
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
|200|[ClientSecret2](#schemaclientsecret2)[]|Client credential client secrets found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret2](#schemaclientsecret2)[])

```json
[
  {
    "Expiration": "2019-08-24T14:15:22Z",
    "Expires": true,
    "Description": "string",
    "SecretId": "string",
    "Id": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add Client Credential Client Secret (v1-preview path)`

<a id="opIdSecrets_Add Client Credential Client Secret (v1-preview path)"></a>

Adds a new secret for a client credential client.

### Request
```text 
POST /api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

Client secret to create<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[ClientSecretResponse2](#schemaclientsecretresponse2)|Client credential client secret created|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 201 Response ([ClientSecretResponse2](#schemaclientsecretresponse2))

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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Client Credential Client Secret (v1-preview path)`

<a id="opIdSecrets_Get Client Credential Client Secret (v1-preview path)"></a>

Returns a specific client credential client secret.

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret2](#schemaclientsecret2)|Client credential client secret specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret2](#schemaclientsecret2))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "SecretId": "string",
  "Id": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Client Credential Client Secret (v1-preview path)`

<a id="opIdSecrets_Update Client Credential Client Secret (v1-preview path)"></a>

Updates a client credential client secret. Only secret description and secret expiration date can be updated.

### Request
```text 
PUT /api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Request Body

Client secret details<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret2](#schemaclientsecret2)|Updated client credential client secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret2](#schemaclientsecret2))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "SecretId": "string",
  "Id": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List Hybrid Client Secrets (v1 path)`

<a id="opIdSecrets_List Hybrid Client Secrets (v1 path)"></a>

Returns all secrets for a hybrid client. Total number of secrets in the client set in the Total-Count header.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
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
|200|[ClientSecret](#schemaclientsecret)[]|List of hybrid client secret information corresponding to the specified client credential client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Total Count of Hybrid Client Secrets`

<a id="opIdSecrets_Get Total Count of Hybrid Client Secrets"></a>

Returns total number of secrets in a hybrid client. The value will be set in the Total-Count header. This method is identical to the GET method but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Headers for hybrid client secret|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add Hybrid Client Secret (v1 path)`

<a id="opIdSecrets_Add Hybrid Client Secret (v1 path)"></a>

Adds a new secret to a hybrid client. A client can have a maximum of 10 secrets. We advise against creating secrets that do not expire.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

ClientSecretCreateOrUpdate object<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[ClientSecretResponse](#schemaclientsecretresponse)|Information about created hybrid client secret|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Hybrid Client Secret (v1 path)`

<a id="opIdSecrets_Get Hybrid Client Secret (v1 path)"></a>

Returns a hybrid client secret.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about specified hybrid client secret|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for Hybrid Client Secret`

<a id="opIdSecrets_Get Header for Hybrid Client Secret"></a>

Validates that a secret unique identifier exists in the client. This method is identical to the GET method but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for hybrid client secret|
|401|None|Unauthorized.<br/>|
|403|None|Forbidden.<br/>|
|404|None|Secret, client, or tenant not found|
|500|None|Internal server error.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Hybrid Client Secret (v1 path)`

<a id="opIdSecrets_Update Hybrid Client Secret (v1 path)"></a>

Updates a hybrid client secret. It can take up to one hour for the update to manifest in the authentication process.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Request Body

ClientSecretCreateOrUpdate object. Properties that are not set or are null will not be changed.<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret](#schemaclientsecret)|Information about updated hybrid client secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret](#schemaclientsecret))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "Id": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Hybrid Client Secret`

<a id="opIdSecrets_Delete Hybrid Client Secret"></a>

Deletes a secret from a hybrid client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued using this secret will be valid until their expiration.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
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
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
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

## `List Hybrid Client Secrets (v1-preview path)`

<a id="opIdSecrets_List Hybrid Client Secrets (v1-preview path)"></a>

Returns all secrets for a hybrid client.

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
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
|200|[ClientSecret2](#schemaclientsecret2)[]|Hybrid client secrets found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret2](#schemaclientsecret2)[])

```json
[
  {
    "Expiration": "2019-08-24T14:15:22Z",
    "Expires": true,
    "Description": "string",
    "SecretId": "string",
    "Id": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add Hybrid Client Secret (v1-preview path)`

<a id="opIdSecrets_Add Hybrid Client Secret (v1-preview path)"></a>

Adds a new secret for a hybrid client.

### Request
```text 
POST /api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secrets
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

Client secret to create<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[ClientSecretResponse2](#schemaclientsecretresponse2)|Hybrid client secret created|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 201 Response ([ClientSecretResponse2](#schemaclientsecretresponse2))

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

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Hybrid Client Secret (v1-preview path)`

<a id="opIdSecrets_Get Hybrid Client Secret (v1-preview path)"></a>

Returns a specific hybrid client secret.

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret2](#schemaclientsecret2)|Hybrid client secret specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret2](#schemaclientsecret2))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "SecretId": "string",
  "Id": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Hybrid Client Secret (v1-preview path)`

<a id="opIdSecrets_Update Hybrid Client Secret (v1-preview path)"></a>

Updates a hybrid client secret. Only secret description and secret expiration date can be updated.

### Request
```text 
PUT /api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secrets/{secretId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>`integer secretId`
<br/>Secret identifier.<br/><br/><br/>

### Request Body

Client secret details<br/>

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSecret2](#schemaclientsecret2)|Updated hybrid client secret|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Secret, client, or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([ClientSecret2](#schemaclientsecret2))

```json
{
  "Expiration": "2019-08-24T14:15:22Z",
  "Expires": true,
  "Description": "string",
  "SecretId": "string",
  "Id": "string"
}
```

### Authorization

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

#### Properties

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

#### Properties

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

#### Properties

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

#### Properties

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

#### Properties

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

#### Properties

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

