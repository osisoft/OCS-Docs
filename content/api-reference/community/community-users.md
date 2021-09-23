---
uid: community-users
---

# Users
APIs for getting, updating, and deleting users from communities

## `List Users of a Tenant in a Community`

<a id="opIdUsers_List Users of a Tenant in a Community"></a>

Gets users that are associated with a specific tenant and community

### Request
```text 
GET /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/Users
?query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[User](#schemauser)[]|Set of users (type `User`) associated with the tenant ( `tenantId`) and community ( `communityId`)|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Community roles not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

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
<li>Community Member</li>
</ul>

---

## `Get Count of Users of a Tenant in a Community`

<a id="opIdUsers_Get Count of Users of a Tenant in a Community"></a>

Gets the count of users of the tenant in a community. This method is identical to the `Int32)` endpoint except it does not return a body.

### Request
```text 
HEAD /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/Users
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>


### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Community roles not found|
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
<li>Community Member</li>
</ul>

---

## `Add User to a Community`

<a id="opIdUsers_Add User to a Community"></a>

Adds a user to a community and provides a list of community role identifiers to be assigned to the user

### Request
```text 
PUT /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/Users/{userId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`string userId`
<br/>User identifier<br/><br/>

### Request Body

List of community roles Ids to assign to the user<br/>

```json
[
  "string"
]
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[User](#schemauser)|Ok|
|201|[User](#schemauser)|Created|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

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

### Authorization

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
<li>Community Moderator</li>
</ul>

---

## `Remove User from a Community`

<a id="opIdUsers_Remove User from a Community"></a>

Removes a user from a community

### Request
```text 
DELETE /api/v1-preview/Tenants/{tenantId}/Communities/{communityId}/Users/{userId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`string userId`
<br/>User identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Removed|
|400|[ErrorResponse](#schemaerrorresponse)|Bad request|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
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
<li>Community Administrator</li>
<li>Community Moderator</li>
</ul>

---
## Definitions

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
|IdentityProviderId|guid|false|true|Identity provider unique identifier used to authenticate the user. This cannot be set to null and must be set when creating a new User.|
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

