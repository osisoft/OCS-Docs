---
uid: identity-device-code-clients

---

# Device Code Clients
Device code clients are used in browserless or input constrained devices. These clients are issued an identifier. Device code clients are not issued secrets.

## `List All Device Code Clients from Tenant`

<a id="opIdDeviceCodeClients_List All Device Code Clients from Tenant"></a>

Returns all device code clients from a tenant. Optionally, get a list of requested clients. Total number of clients in the tenant set in the Total-Count header.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/DeviceCodeClients
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
|200|[DeviceCodeClient](#schemadevicecodeclient)[]|Device Code Clients found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([DeviceCodeClient](#schemadevicecodeclient)[])

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
    "DeviceCodeLifetime": 0,
    "ClientUri": "string",
    "LogoUri": "string"
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

## `Get Total Count Device Code Clients from Tenant`

<a id="opIdDeviceCodeClients_Get Total Count Device Code Clients from Tenant"></a>

Return total number of device dode clients in a tenant. Optionally, checks based on a list of requested clients. The value will be set in the Total-Count header. This method is identical to the GET method but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/DeviceCodeClients
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
|200|None|Device code client headers|
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

## `Create a Device Code Client`

<a id="opIdDeviceCodeClients_Create a Device Code Client"></a>

Create an device code flow client. No secret will be generated for this client.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/DeviceCodeClients
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Request Body

New DeviceCodeClient object.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "DeviceCodeLifetime": 0,
  "ClientUri": "string",
  "LogoUri": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[DeviceCodeClient](#schemadevicecodeclient)|Device code client created|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs, or client limit exceeded|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|409|[ErrorResponse](#schemaerrorresponse)|Client identifier already exists|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 201 Response ([DeviceCodeClient](#schemadevicecodeclient))

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "DeviceCodeLifetime": 0,
  "ClientUri": "string",
  "LogoUri": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get a Device Code Client from Tenant`

<a id="opIdDeviceCodeClients_Get a Device Code Client from Tenant"></a>

Returns a device code client from a tenant.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/DeviceCodeClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[DeviceCodeClient](#schemadevicecodeclient)|Device code client specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([DeviceCodeClient](#schemadevicecodeclient))

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "DeviceCodeLifetime": 0,
  "ClientUri": "string",
  "LogoUri": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get Header for Device Code Client`

<a id="opIdDeviceCodeClients_Get Header for Device Code Client"></a>

Validates that a device code client exists in a tenant.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/DeviceCodeClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientCredentialClient](#schemaclientcredentialclient)|Header for specified device code client|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
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

### Authorization

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Update a Device Code Client`

<a id="opIdDeviceCodeClients_Update a Device Code Client"></a>

Updates a device code client. It can take up to one hour for update to manifest in the authentication process.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/DeviceCodeClients/{clientId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string clientId`
<br/>Client identifier.<br/><br/><br/>

### Request Body

Updated device code client values. Properties that are not set or are null will not be changed.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "DeviceCodeLifetime": 0,
  "ClientUri": "string",
  "LogoUri": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[DeviceCodeClient](#schemadevicecodeclient)|Device Code Client updated|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.<br/>|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.<br/>|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.<br/>|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.<br/>|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.<br/>|

#### Example response body
> 200 Response ([DeviceCodeClient](#schemadevicecodeclient))

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "DeviceCodeLifetime": 0,
  "ClientUri": "string",
  "LogoUri": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete a Device Code Client`

<a id="opIdDeviceCodeClients_Delete a Device Code Client"></a>

Deletes a device code client. It can take up to one hour for deletion to manifest in the authentication process. Access tokens issued to this client will be valid until their expiration.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/DeviceCodeClients/{clientId}
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
## Definitions

### DeviceCodeClient

<a id="schemadevicecodeclient"></a>
<a id="schema_DeviceCodeClient"></a>
<a id="tocSdevicecodeclient"></a>
<a id="tocsdevicecodeclient"></a>

Object used for device code clients

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Client identifier for this client. This identifier should be a GUID.|
|Name|string|false|true|Name of client|
|Enabled|boolean|false|true|Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.|
|AccessTokenLifetime|int32|false|true|Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.|
|Tags|string[]|false|true|Tags for OSIsoft internal use only|
|DeviceCodeLifetime|int32|false|true|Lifetime of device code, in seconds|
|ClientUri|string|false|true|URI to a page with information about client (used on consent screen)|
|LogoUri|string|false|true|URI to client logo (used on consent screen)|

```json
{
  "Id": "string",
  "Name": "string",
  "Enabled": true,
  "AccessTokenLifetime": 0,
  "Tags": [
    "string"
  ],
  "DeviceCodeLifetime": 0,
  "ClientUri": "string",
  "LogoUri": "string"
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

### ClientCredentialClient

<a id="schemaclientcredentialclient"></a>
<a id="schema_ClientCredentialClient"></a>
<a id="tocSclientcredentialclient"></a>
<a id="tocsclientcredentialclient"></a>

Object to return or update a ClientCredentialClient

#### Properties

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

