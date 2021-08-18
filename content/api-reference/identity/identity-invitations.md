---
uid: identity-invitations

---

# Invitations
Invitations are issued after the creation of a user object in OCS, to begin the provisioning process for a user with one of the identity providers in a tenant. There can only be one invitation for a user at a time. An invitation can expire, at which time the administrator can either delete it, or extend it. When creating an invitation a tenant administrator has the option to resend the invitation email to the contact email configured for the user the invitation is attached to. The email can be re-sent by updating the invitation. When an invitation expires the user cannot accept it. If the expiration date is extended the user can accept an invitation. Invitations that are past of their expiration date by more than two weeks will be deleted. The only way to provision a user after this, is to send a new invitation.

## `List Invitations`

<a id="opIdInvitations_List Invitations"></a>

Gets all non-expired invitations from a tenant. Optionally include expired invitations.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Invitations
?query={query}&skip={skip}&count={count}&includeExpiredInvitations={includeExpiredInvitations}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Number of invitations to skip<br/><br/>`[optional] integer count`
<br/>Maximum number of invitations to return<br/><br/>`[optional] boolean includeExpiredInvitations`
<br/>Specify whether to return expired invitations<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Invitation](#schemainvitation)[]|Invitations found|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "string",
    "Issued": "2019-08-24T14:15:22Z",
    "Expires": "2019-08-24T14:15:22Z",
    "Accepted": "2019-08-24T14:15:22Z",
    "State": 0,
    "TenantId": "string",
    "UserId": "string"
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for Invitations`

<a id="opIdInvitations_Get Header for Invitations"></a>

Returns the total number of non-expired invitations in a tenant. Optionally include expired invitations. The value will be set in the Total-Count header. This endpoint is identical to the GET one but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Invitations
?includeExpiredInvitations={includeExpiredInvitations}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>
`[optional] boolean includeExpiredInvitations`
<br/>Specify to return expired invitations<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for invitations found|
|400|None|Missing or invalid inputs|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Invitation`

<a id="opIdInvitations_Get Invitation"></a>

Gets an invitation from tenant.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Invitations/{invitationId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string invitationId`
<br/>Invitation unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Invitation](#schemainvitation)|Invitation specified|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Invitation or tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": 0,
  "TenantId": "string",
  "UserId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get header for an Invitation`

<a id="opIdInvitations_Get header for an Invitation"></a>

Validates that an invitation exists. This endpoint is identical to the GET one, but it does not return an object in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Invitations/{invitationId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string invitationId`
<br/>Invitation unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for invitation specified|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Invitation or tenant not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Update Invitation`

<a id="opIdInvitations_Update Invitation"></a>

Updates an invitation. Expired invitations will not be extended. automatically upon updates.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Invitations/{invitationId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string invitationId`
<br/>Invitation unique identifier<br/><br/>

### Request Body

New InvitationCreateOrUpdate object. Properties that are not set or are null will not be changed.<br/>

```json
{
  "ExpiresDateTime": "2019-08-24T14:15:22Z",
  "State": 0,
  "SendInvitation": true,
  "IdentityProviderId": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Invitation](#schemainvitation)|Updated invitation|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Invitation or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": 0,
  "TenantId": "string",
  "UserId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Invitation`

<a id="opIdInvitations_Delete Invitation"></a>

Deletes an invitation. Users who already have an invitation email will not be able to sign up once the invitation is deleted.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Invitations/{invitationId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string invitationId`
<br/>Invitation unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Invitation or tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 400 Response

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

# Invitations
Invitations are issued after the creation of a user object in OCS, to begin the provisioning process for a user with one of the identity providers in a tenant. There can only be one invitation for a user at a time. An invitation can expire, at which time the administrator can either delete it, or extend it. When creating an invitation a tenant administrator has the option to resend the invitation email to the contact email configured for the user the invitation is attached to. The email can be re-sent by updating the invitation. When an invitation expires the user cannot accept it. If the expiration date is extended the user can accept an invitation. Invitations that are past of their expiration date by more than two weeks will be deleted. The only way to provision a user after this, is to send a new invitation.

## `Get User's Invitation`

<a id="opIdInvitation_Get User's Invitation"></a>

Gets an invitation for a user.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Users/{userId}/Invitation
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string userId`
<br/>User unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Invitation](#schemainvitation)|Invitation for the specified user|
|401|[ErrorResponse2](#schemaerrorresponse2)|Unauthorized|
|403|[ErrorResponse2](#schemaerrorresponse2)|Forbidden|
|404|[ErrorResponse2](#schemaerrorresponse2)|Invitation, user, or tenant not found|
|500|[ErrorResponse2](#schemaerrorresponse2)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": 0,
  "TenantId": "string",
  "UserId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Header for User's Invitation`

<a id="opIdInvitation_Get Header for User's Invitation"></a>

Validate that invitation exist for a user. This endpoint is identical to the GET one but it does not return any objects in the body.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}/Users/{userId}/Invitation
?includeExpiredInvitations={includeExpiredInvitations}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string userId`
<br/>User unique identifier<br/><br/>
`[optional] boolean includeExpiredInvitations`
<br/>Specify whether to include expired invitations.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for invitation for the specified user|
|400|None|Missing or invalid inputs|
|401|None|Unauthorized|
|403|None|Forbidden|
|404|None|Tenant not found|
|500|None|Internal server error|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Create Invitation`

<a id="opIdInvitation_Create Invitation"></a>

Creates an invitation for a user. Should use when no other invitation exists for the user.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Users/{userId}/Invitation
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string userId`
<br/>User unique identifier<br/><br/>

### Request Body

InvitationCreateOrUpdate object<br/>

```json
{
  "ExpiresDateTime": "2019-08-24T14:15:22Z",
  "State": 0,
  "SendInvitation": true,
  "IdentityProviderId": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[Invitation](#schemainvitation)|Invitation created|
|202|None|Invitation created|
|400|[ErrorResponse2](#schemaerrorresponse2)|Missing or invalid inputs|
|401|[ErrorResponse2](#schemaerrorresponse2)|Unauthorized|
|403|[ErrorResponse2](#schemaerrorresponse2)|Forbidden|
|404|[ErrorResponse2](#schemaerrorresponse2)|User or tenant not found|
|408|[ErrorResponse2](#schemaerrorresponse2)|Operation timed out|
|409|[ErrorResponse2](#schemaerrorresponse2)|Invitation already exists|
|500|[ErrorResponse2](#schemaerrorresponse2)|Internal server error|

#### Example response body
> 201 Response

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": 0,
  "TenantId": "string",
  "UserId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Create or Update Invitation`

<a id="opIdInvitation_Create or Update Invitation"></a>

Creates or updates an invitation for a user.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Users/{userId}/Invitation
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string userId`
<br/>User unique identifier<br/><br/>

### Request Body

InvitationCreateOrUpdate object<br/>

```json
{
  "ExpiresDateTime": "2019-08-24T14:15:22Z",
  "State": 0,
  "SendInvitation": true,
  "IdentityProviderId": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Invitation](#schemainvitation)|Invitation created or updated|
|201|[Invitation](#schemainvitation)|Invitation created or updated|
|400|[ErrorResponse2](#schemaerrorresponse2)|Missing or invalid inputs|
|401|[ErrorResponse2](#schemaerrorresponse2)|Unauthorized|
|403|[ErrorResponse2](#schemaerrorresponse2)|Forbidden|
|404|[ErrorResponse2](#schemaerrorresponse2)|User or tenant not found|
|408|[ErrorResponse2](#schemaerrorresponse2)|Operation timed out|
|409|[ErrorResponse2](#schemaerrorresponse2)|Invitation already exists.|
|500|[ErrorResponse2](#schemaerrorresponse2)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": 0,
  "TenantId": "string",
  "UserId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Invitation`

<a id="opIdInvitation_Delete Invitation"></a>

Deletes an invitation for a user.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Users/{userId}/Invitation
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string userId`
<br/>User unique identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|401|[ErrorResponse2](#schemaerrorresponse2)|Unauthorized|
|403|[ErrorResponse2](#schemaerrorresponse2)|Forbidden|
|404|[ErrorResponse2](#schemaerrorresponse2)|Invitation or tenant not found|
|408|[ErrorResponse2](#schemaerrorresponse2)|Operation timed out|
|500|[ErrorResponse2](#schemaerrorresponse2)|Internal server error|

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
## Definitions

### Invitation

<a id="schemainvitation"></a>
<a id="schema_Invitation"></a>
<a id="tocSinvitation"></a>
<a id="tocsinvitation"></a>

Object for an invitation.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Invitation unique identifier.|
|Issued|date-time|false|false|Invitation issuing timestamp.|
|Expires|date-time|false|false|Invitation expiration timestamp.|
|Accepted|date-time|false|true|Invitation accepted timestamp.|
|State|[InvitationStates](#schemainvitationstates)|false|false|Invitation state. Can be None (0), InvitationEmailSent (1), InvitationAccepted (2).|
|TenantId|guid|false|false|Unique identifier of the tenant the invitation belongs to.|
|UserId|guid|false|false|Unique identifier of the user to whom the invitation was issued.|

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": 0,
  "TenantId": "string",
  "UserId": "string"
}

```

---

### InvitationStates

<a id="schemainvitationstates"></a>
<a id="schema_InvitationStates"></a>
<a id="tocSinvitationstates"></a>
<a id="tocsinvitationstates"></a>

Invitation states.

#### Enumerated Values

|Property|Value|
|---|---|
|None|0|
|InvitationEmailSent|1|
|InvitationAccepted|2|

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
|OperationId|string|true|false|Operation unique identifier of action that caused the error.|
|Error|string|true|false|Error description.|
|Reason|string|true|false|Reason for the error.|
|Resolution|string|true|false|Resolution to resolve the error.|
|DynamicProperties|object|false|true|Additional properties.|

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

### InvitationCreateOrUpdate

<a id="schemainvitationcreateorupdate"></a>
<a id="schema_InvitationCreateOrUpdate"></a>
<a id="tocSinvitationcreateorupdate"></a>
<a id="tocsinvitationcreateorupdate"></a>

Object used to create or update an invitation.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|ExpiresDateTime|date-time|false|true|Invitation expiration date. Must be in the future. Maximum allowed is two months in the future. Defaults to 21 days on creation. It should be in [ISO 8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) and either include a *Z* at the end to represent UTC time zone or include the offset in hours. If neither is present time will be treated in the local time zone of the server.|
|State|[InvitationStates](#schemainvitationstates)|false|true|State of invitation. For OSIsoft internal use only.|
|SendInvitation|boolean|false|true|Send an invitation email. Invitation will be sent to the contact email for the user this invitation is attached to. Default is true.|
|IdentityProviderId|guid|false|true|Identity provider to use for accepting this invitation. Required when creating an invitation.|

```json
{
  "ExpiresDateTime": "2019-08-24T14:15:22Z",
  "State": 0,
  "SendInvitation": true,
  "IdentityProviderId": "string"
}

```

---

### ErrorResponse2

<a id="schemaerrorresponse2"></a>
<a id="schema_ErrorResponse2"></a>
<a id="tocSerrorresponse2"></a>
<a id="tocserrorresponse2"></a>

Object returned whenever there is an error TODO: Remove this internal model and re-adopt public model when moving to System.Text.Json in WI 202168.

#### Properties

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

