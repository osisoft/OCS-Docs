---
uid: community-client-credential-clients

---

# Client Credential Clients
APIs for getting, adding, or removing client credential clients from communities

## `List Client Credential Clients for a Community`

<a id="opIdClientCredentialClients_List Client Credential Clients for a Community"></a>

Gets clients associated with a specific tenant and community

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/ClientCredentialClients
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientCredentialClient](#schemaclientcredentialclient)[]|Set of clients ( `ClientCredentialClient`) associated with the tenant ( `tenantId`) and community ( `communityId`)|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

<h4>Example response body</h4>

> 200 Response ([ClientCredentialClient](#schemaclientcredentialclient)[])

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
</ul>

---

## `Get Count of Clients for a Community`

<a id="opIdClientCredentialClients_Get Count of Clients for a Community"></a>

Gets a count of client credential clients for a community

<h3>Request</h3>

```text 
HEAD /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/ClientCredentialClients
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
</ul>

---

## `Add Client Credential Client to a Community`

<a id="opIdClientCredentialClients_Add Client Credential Client to a Community"></a>

Adds a client credential client to a community, providing a list of community roles to be assigned to the client

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/ClientCredentialClients/{clientId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`string clientId`
<br/>Client credential client identifier<br/><br/>

<h4>Request Body</h4>

Community role identifiers to be assigned to the client<br/>

```json
[
  "string"
]
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientCredentialClient](#schemaclientcredentialclient)|Ok|
|201|[ClientCredentialClient](#schemaclientcredentialclient)|Created|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

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
<li>Community Administrator</li>
<li>Community Moderator</li>
</ul>

---

## `Remove Client Credential Client from a Community`

<a id="opIdClientCredentialClients_Remove Client Credential Client from a Community"></a>

Removes a client credential client from a community

<h3>Request</h3>

```text 
DELETE /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/ClientCredentialClients/{clientId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`string clientId`
<br/>Client credential client identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Removed|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
<li>Community Moderator</li>
</ul>

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

