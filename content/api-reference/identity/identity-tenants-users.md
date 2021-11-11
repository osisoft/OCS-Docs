---
uid: identity-tenants-users

---

# Tenants Users
Users consume resources in a tenant. They are invited by the administrator of the tenant and should already have a tenant in one of the configured identity providers for this tenant. A user is fully provisioned in OCS only after they have accepted the invitation and successfully logged in with an identity provider. OCS does not maintain user credentials, but it delegates authentication to the identity provider the user logged in with at first. Once logged in, the user cannot change the identity provider with which it signed up. A tenant can only have one user with a given email to an identity provider. If a user has multiple aliases in the same identity provider, they will not be able to create multiple corresponding OCS. Users have roles associated with them. These roles determine what a user is authorized to do in the tenant. Roles are assigned to a user upon creation and can be modified by an administrator. We allow the change of some user fields and the complete deletion of a user.

## `List Users from a Tenant`

<a id="opIdUsers_List Users from a Tenant"></a>

Returns a list of users from a tenant. Optionally, returns a list of requested users. Total number of users in the tenant set in the Total-Count header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Users
?id={id}&query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] array id`
<br/>Unordered list of identifiers of all users to return<br/><br/>`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[User](#schemauser)[]|List of users found|
|207|[UserMultiStatusResponse](#schemausermultistatusresponse)|List of users found|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([User](#schemauser)[])

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Total Count of Users`

<a id="opIdUsers_Get Total Count of Users"></a>

Returns the total number of users in a tenant. Optionally, check based on a list of requested users. The value will be set in the Total-Count header. This method is identical to the GET method, but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Users
?id={id}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] array id`
<br/>Unordered list of user identifiers<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|User header found|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|User not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create User (v1 path)`

<a id="opIdUsers_Create User (v1 path)"></a>

Creates a user in the tenant. This method does not create an invitation for the user. You will need to create an invitation with the respective method for this user, otherwise they will not be able to finish the sign-up process. Users have identifiers in a tenant. Currently there is a limit of 50000 users per tenant. For Windows Active Directory users, the external user identifier must be specified.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Users
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>

<h4>Request Body</h4>

UserCreateOrUpdate object<br/>

```json
{
  "Id": "string",
  "ExternalUserId": "string",
  "ContactGivenName": "string",
  "ContactSurname": "string",
  "ContactEmail": "user@example.com",
  "IdentityProviderId": "string",
  "IdentityProviderSpecificUserId": "string",
  "RoleIds": [
    "string"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[User](#schemauser)|User created|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs, or the user limit exceeded for tenant.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 201 Response ([User](#schemauser))

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List Users' Invitation Status`

<a id="opIdUsers_List Users' Invitation Status"></a>

Returns the status of the invitations for multiple users. Optionally, restrict it only to users of a specific invitation status. The user status can be: InvitationAccepted (0), NoInvitation (1), InvitationNotSent (2), InvitationSent (3), InvitationExpired (4).

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Users/Status
?id={id}&query={query}&skip={skip}&count={count}&status={status}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] array id`
<br/>Unordered list of identifiers of all users to return<br/><br/>`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] array status`
<br/>Only return statuses that match these values. Possible user statuses are: InvitationAccepted, NoInvitation, InvitationNotSent, InvitationSent, InvitationExpired.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[UserStatus](#schemauserstatus)[]|List of user statuses found|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([UserStatus](#schemauserstatus)[])

```json
[
  {
    "InvitationStatus": 0,
    "User": {
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
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get User from a Tenant`

<a id="opIdUsers_Get User from a Tenant"></a>

Returns a specific user from a tenant.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Users/{userId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[User](#schemauser)|User specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|User or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([User](#schemauser))

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get Header for User`

<a id="opIdUsers_Get Header for User"></a>

Validates that a user exists. This method is identical to the GET method, but it does not return an object in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Users/{userId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for user|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|User does not exist|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Update User in a Tenant`

<a id="opIdUsers_Update User in a Tenant"></a>

Updates a user in a tenant. The user identifier cannot be changed.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Users/{userId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h4>Request Body</h4>

UserCreateOrUpdate object. Properties that are not set or are null will not be changed.<br/>

```json
{
  "Id": "string",
  "ExternalUserId": "string",
  "ContactGivenName": "string",
  "ContactSurname": "string",
  "ContactEmail": "user@example.com",
  "IdentityProviderId": "string",
  "IdentityProviderSpecificUserId": "string",
  "RoleIds": [
    "string"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[User](#schemauser)|Updated user|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|User or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([User](#schemauser))

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete User in a Tenant`

<a id="opIdUsers_Delete User in a Tenant"></a>

Deletes a user. Users cannot delete themselves. Deleting a user does not invalidate any of the existing access tokens, but it prevents this user from being able to authenticate in the future. Existing access tokens for the user will be valid until their expiration date. Refresh tokens on behalf of the user will no longer be valid after the user has been deleted. Deleting a user with explicit and claim role mappings will only have their explicit roles deleted. Forcibly deleting a user will delete a user completely regardless of claim role mappings.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Users/{userId}
?force={force}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>
`[optional] boolean force`
<br/>Forcibly delete a user that can remain due to claim role mappings.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|string|No content|
|204|None|No content|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|User or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get User's Invitation Status`

<a id="opIdUsers_Get User's Invitation Status"></a>

Returns invitation status for a user. It can be: InvitationAccepted (0), NoInvitation (1), InvitationNotSent (2), InvitationSent (3), InvitationExpired (4).

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Users/{userId}/Status
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[UserStatus](#schemauserstatus)|User status for user specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|User or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([UserStatus](#schemauserstatus))

```json
{
  "InvitationStatus": 0,
  "User": {
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
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Member</li>
</ul>

---

## `Get User's Preferences`

<a id="opIdUsers_Get User's Preferences"></a>

Returns preferences from a user. User preferences can be any valid JSON object. A common use case is to store UI preferences for the user.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Users/{userId}/Preferences
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|User preferences for specified user|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|User or tenant not found|
|422|[ErrorResponse](#schemaerrorresponse)|Unprocessable entity|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for User's Preferences`

<a id="opIdUsers_Get Header for User's Preferences"></a>

Validates that there are preferences for a user. This method is identical to the GET method, but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Users/{userId}/Preferences
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified user's preferences|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|User or tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---

## `Update User's Preferences`

<a id="opIdUsers_Update User's Preferences"></a>

Updates preferences for a user.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Users/{userId}/Preferences
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string userId`
<br/>User identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Updated user preferences|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|User or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Self</li>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### User

<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>

Object for retrieving a user

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|User identifier|
|GivenName|string|false|true|Given name of the user|
|Surname|string|false|true|Surname of the user|
|Name|string|false|true|Name of the user|
|Email|string|false|true|Email of the user|
|ContactEmail|string|false|true|Contact email for the user. User will only be contacted through this email.|
|ContactGivenName|string|false|true|Preferred given name for the user|
|ContactSurname|string|false|true|Preferred contact surname for the user|
|ExternalUserId|string|false|true|Provider identifier for the user. This is the identifier we get from the identity provider.|
|IdentityProviderId|guid|false|true|Identity provider identifier used to authenticate the user. This cannot be set to null, and must be set when creating a new user.|
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

### UserMultiStatusResponse

<a id="schemausermultistatusresponse"></a>
<a id="schema_UserMultiStatusResponse"></a>
<a id="tocSusermultistatusresponse"></a>
<a id="tocsusermultistatusresponse"></a>

MultiStatusResponse objects returned in a 207 response

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Identifier of the operation that resulted in this error|
|Error|string|false|true|Message describing the error|
|Reason|string|false|true|Reason that caused the error|
|EventId|string|false|true|Event identifier of the error|
|ChildErrors|[[MultiStatusResponseChildError](#schemamultistatusresponsechilderror)]|false|true|List of child errors|
|Data|[[User](#schemauser)]|false|true|Data representing users|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "EventId": "string",
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Reason": "string",
      "Resolution": "string",
      "EventId": "string",
      "StatusCode": 0,
      "ModelId": "string",
      "property1": null,
      "property2": null
    }
  ],
  "Data": [
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
}

```

---

### MultiStatusResponseChildError

<a id="schemamultistatusresponsechilderror"></a>
<a id="schema_MultiStatusResponseChildError"></a>
<a id="tocSmultistatusresponsechilderror"></a>
<a id="tocsmultistatusresponsechilderror"></a>

ChildError objects returned in a 207 response

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|OperationId of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution for the error|
|EventId|string|true|false|EventId for the error|
|StatusCode|int32|false|false|Http status code|
|ModelId|string|false|true|Model identifier|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "EventId": "string",
  "StatusCode": 0,
  "ModelId": "string",
  "property1": null,
  "property2": null
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

### UserStatus

<a id="schemauserstatus"></a>
<a id="schema_UserStatus"></a>
<a id="tocSuserstatus"></a>
<a id="tocsuserstatus"></a>

Object used when returning user status

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|InvitationStatus|[UserInvitationStatus](#schemauserinvitationstatus)|false|false|Status of user invitation. Can be: InvitationAccepted (0), NoInvitation (1), InvitationNotSent (2), InvitationSent (3), InvitationExpired (4).|
|User|[User](#schemauser)|false|true|User information|

```json
{
  "InvitationStatus": 0,
  "User": {
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
}

```

---

### UserInvitationStatus

<a id="schemauserinvitationstatus"></a>
<a id="schema_UserInvitationStatus"></a>
<a id="tocSuserinvitationstatus"></a>
<a id="tocsuserinvitationstatus"></a>

User Invitation Status

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|InvitationAccepted|0|
|NoInvitation|1|
|InvitationNotSent|2|
|InvitationSent|3|
|InvitationExpired|4|

---

### UserCreateOrUpdate

<a id="schemausercreateorupdate"></a>
<a id="schema_UserCreateOrUpdate"></a>
<a id="tocSusercreateorupdate"></a>
<a id="tocsusercreateorupdate"></a>

Object when updating a user

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|true|User identifier. When creating a user, if user identifier is not specified, one will be generated.|
|ExternalUserId|string|false|true|User ExternalUserId for the user. Must be specified if the identity provider is Windows Active Directory.|
|ContactGivenName|string|false|true|Preferred name to be used when contacting user|
|ContactSurname|string|false|true|Preferred surname to be used when contacting user|
|ContactEmail|email|false|true|Preferred contact email to be used. This does not have to be the same as the user's identity provider email.|
|IdentityProviderId|guid|false|true|Identity provider this user will be required to use to log in. This value cannot be null when creating a new user. When updating, this value must match what is currently assigned to user. This cannot be updated via update user.|
|IdentityProviderSpecificUserId|string|false|true|Identity provider specific user identifier. For example, object Id for Active Directory and Azure Active Directory.|
|RoleIds|string[]|false|true|List of strings of role identifiers|

```json
{
  "Id": "string",
  "ExternalUserId": "string",
  "ContactGivenName": "string",
  "ContactSurname": "string",
  "ContactEmail": "user@example.com",
  "IdentityProviderId": "string",
  "IdentityProviderSpecificUserId": "string",
  "RoleIds": [
    "string"
  ]
}

```

---

### UserStatusMultiStatusResponse

<a id="schemauserstatusmultistatusresponse"></a>
<a id="schema_UserStatusMultiStatusResponse"></a>
<a id="tocSuserstatusmultistatusresponse"></a>
<a id="tocsuserstatusmultistatusresponse"></a>

MultiStatusResponse objects returned in a 207 response

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Identifier of the operation that resulted in this error|
|Error|string|false|true|Message describing the error|
|Reason|string|false|true|Reason that caused the error|
|EventId|string|false|true|Even identifier of the error|
|ChildErrors|[[MultiStatusResponseChildError](#schemamultistatusresponsechilderror)]|false|true|List of child errors|
|Data|[[UserStatus](#schemauserstatus)]|false|true|Data representing user statuses|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "EventId": "string",
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Reason": "string",
      "Resolution": "string",
      "EventId": "string",
      "StatusCode": 0,
      "ModelId": "string",
      "property1": null,
      "property2": null
    }
  ],
  "Data": [
    {
      "InvitationStatus": 0,
      "User": {
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
    }
  ]
}

```

---

### UserCreateOrUpdate2

<a id="schemausercreateorupdate2"></a>
<a id="schema_UserCreateOrUpdate2"></a>
<a id="tocSusercreateorupdate2"></a>
<a id="tocsusercreateorupdate2"></a>

Object when updating an user

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|UserId|guid|false|true|User identifier for the user. When creating a user, if user identifier is not specified, one will be generated.|
|ContactGivenName|string|false|true|Preferred name to be used when contacting user|
|ContactSurname|string|false|true|Preferred surname to be used when contacting user|
|ContactEmail|email|false|true|Preferred email to be used when contacting user|
|RoleIds|string[]|false|true|List of role identifiers|
|IdentityProviderId|guid|false|true|Identity Provider this user will be required to use to log in. This value cannot be null when creating a new user. When updating, this value must match what is currently assigned to user. This cannot be updated via update user.|

```json
{
  "UserId": "string",
  "ContactGivenName": "string",
  "ContactSurname": "string",
  "ContactEmail": "user@example.com",
  "RoleIds": [
    "string"
  ],
  "IdentityProviderId": "string"
}

```

---

