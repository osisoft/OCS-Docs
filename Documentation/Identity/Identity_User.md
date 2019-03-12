---
uid: identityUser
---

# User

APIs for creating, getting, updating, and deleting Users

## Properties

For HTTP requests and responses, the UserDto object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | ---
Id | Guid | Unique User ID.
GivenName | string | Given name of user.
Surname | string | Surname of user.
Name | string | Name of user.
Email | string | Email of user.
ContactEmail | string | Preferred contact email for user.
ContactGivenName | string | Preferred contact name for user.
ContactSurname | string | Preferred contact surname for user.
ExternalUserId | string | Provider id for user.
TenantId | Guid | Tenant Id the User belongs to.
IdentityProviderId | optional: Guid | Identity Provider Id used to authenticate user.

### Serialized Model

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

***

## `Get Users`

Returns a list of User objects for a given tenant

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of users to skip

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Max number of users to return

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success.

##### Type:

 `List[UserDto]`

```json
[
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  }
]
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Get Users By IDs`

Returns an ordered list of User objects based on userId for a given tenant or a MultiStatusResponseDto with a list of User objects and a list of errors

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/Ids`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[FromQuery]
[Required]
Guid[] userIds
```

Unordered list of ids for all users to get

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of users to skip

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Max number of users to return

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List[UserDto]`

```json
[
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  }
]
```

#### 207

Partial success.

##### Type:

 `MultiStatusResponseDto[List[UserDto]]`

```json
{
  "OperationId": "OperationId",
  "Error": "Error",
  "Reason": "Reason",
  "ChildErrors": [
    {
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution",
      "StatusCode": 0,
      "ModelId": {
        "String": "String"
      },
      "TenantId": "00000000-0000-0000-0000-000000000000"
    },
    {
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution",
      "StatusCode": 0,
      "ModelId": {
        "String": "String"
      },
      "TenantId": "00000000-0000-0000-0000-000000000000"
    }
  ],
  "Data": [
    {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "TenantId": "00000000-0000-0000-0000-000000000000",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
    },
    {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "TenantId": "00000000-0000-0000-0000-000000000000",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
    }
  ]
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Get Users' Status`

Get User status for multiple users, optionally restrict it to only Users of a specific status.

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/Status`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of users to skip

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Max number of users to return

```csharp
[FromQuery]
[Optional]
[Default = ""]
string status
```

Only return statuses that match this value

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List[UserStatusDto]`

```json
[
  {
    "InvitationStatus": 0,
    "User": {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "TenantId": "00000000-0000-0000-0000-000000000000",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
    }
  },
  {
    "InvitationStatus": 0,
    "User": {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "TenantId": "00000000-0000-0000-0000-000000000000",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
    }
  }
]
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 500

Internal server error

#### 404

Tenant not found
***

## `Get User`

Returns a User

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/{userId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of Tenant

```csharp
[Required]
Guid userId
```

Id of User

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success

##### Type:

 `UserDto`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 500

Internal server error
***

## `Get User's Status`

Returns user invitation status

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/{userId}/Status`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
Guid userId
```

Id of user

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success

##### Type:

 `UserStatusDto`

```json
{
  "InvitationStatus": 0,
  "User": {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  }
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 500

Internal server error
***

## `Get Users' Status By IDs`

Returns an ordered list of UserStatusDto objects for a given tenant or a MultiStatusDto response with a list of UserStatusDto objects and a list of errors

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/Status/Ids`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[FromQuery]
[Required]
Guid[] userIds
```

Unordered list of ids for all users

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of users to skip

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Max number of users to return

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List[UserStatusDto]`

```json
[
  {
    "InvitationStatus": 0,
    "User": {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "TenantId": "00000000-0000-0000-0000-000000000000",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
    }
  },
  {
    "InvitationStatus": 0,
    "User": {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "TenantId": "00000000-0000-0000-0000-000000000000",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
    }
  }
]
```

#### 207

Partial success.

##### Type:

 `MultiStatusResponseDto[List[UserStatusDto]]`

```json
{
  "OperationId": "OperationId",
  "Error": "Error",
  "Reason": "Reason",
  "ChildErrors": [
    {
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution",
      "StatusCode": 0,
      "ModelId": {
        "String": "String"
      },
      "TenantId": "00000000-0000-0000-0000-000000000000"
    },
    {
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution",
      "StatusCode": 0,
      "ModelId": {
        "String": "String"
      },
      "TenantId": "00000000-0000-0000-0000-000000000000"
    }
  ],
  "Data": [
    {
      "InvitationStatus": 0,
      "User": {
        "Id": "00000000-0000-0000-0000-000000000000",
        "GivenName": "Name",
        "Surname": "Surname",
        "Name": "Name",
        "Email": "user@company.com",
        "ContactEmail": "user@company.com",
        "ContactGivenName": "Name",
        "ContactSurname": "Surname",
        "ExternalUserId": "ExternalUserId",
        "TenantId": "00000000-0000-0000-0000-000000000000",
        "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
      }
    },
    {
      "InvitationStatus": 0,
      "User": {
        "Id": "00000000-0000-0000-0000-000000000000",
        "GivenName": "Name",
        "Surname": "Surname",
        "Name": "Name",
        "Email": "user@company.com",
        "ContactEmail": "user@company.com",
        "ContactGivenName": "Name",
        "ContactSurname": "Surname",
        "ExternalUserId": "ExternalUserId",
        "TenantId": "00000000-0000-0000-0000-000000000000",
        "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
      }
    }
  ]
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Get User's Preferences`

Returns a user's preferences

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/{userId}/Preferences`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of Tenant

```csharp
[Required]
Guid userId
```

Id of User

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success

##### Type:

 `Newtonsoft.Json.Linq.JObject`

```json
{}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 500

Internal server error
***

## `Update User's Preferences`

Put a user's preferences

### Request

`PUT api/v1-preview/Tenants/{tenantId}/User/{userId}/Preferences`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of Tenant

```csharp
[Required]
Guid userId
```

Id of User

```csharp
[FromBody]
[Required]
JObject preferences
```

JSON Preferences

```json
{}
```

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success

##### Type:

 `Newtonsoft.Json.Linq.JObject`

```json
{}
```

#### 400

Missing preferences

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 500

Internal server error
***

## `Create User`

Creates a User

### Request

`POST api/v1-preview/Tenants/{tenantId}/User/`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of Tenant

```csharp
[FromBody]
[Required]
UserCreateOrUpdateDto userCreateOrUpdateDto
```

User data transfer object

```json
{
  "UserId": "00000000-0000-0000-0000-000000000000",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ContactEmail": "user@company.com",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created

##### Type:

 `UserDto`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Update User`

Create or Update a User

### Request

`PUT api/v1-preview/Tenants/{tenantId}/User/{userId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
Guid userId
```

Id of user

```csharp
[FromBody]
[Required]
UserCreateOrUpdateDto userCreateOrUpdateDto
```

A UserStatusDto object

```json
{
  "UserId": "00000000-0000-0000-0000-000000000000",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ContactEmail": "user@company.com",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Updated

##### Type:

 `UserDto`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 500

Internal server error
***

## `Delete User`

Delete a user

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/User/{userId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
Guid userId
```

Id of user

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Deleted

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 500

Internal server error
***

## `Get User's Invitation`

Get the invitations for a user

### Request

`GET api/v1-preview/Tenants/{tenantId}/User/{userId}/Invitation`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
Guid userId
```

Id of user

```csharp
[FromQuery]
[Optional]
[Default = False]
bool includeExpiredInvitations
```

Specify to return expired invitations

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `InvitationDto`

```json
{
  "Id": "Id",
  "Issued": "2019-03-06T11:39:54.6750133-08:00",
  "Expires": "2019-03-06T11:39:54.6750186-08:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000"
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Invitation, User, or Tenant not found

#### 500

Internal server error
***

## `Create Invitation`

Create an invitation for a user

### Request

`POST api/v1-preview/Tenants/{tenantId}/User/{userId}/Invitation`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
Guid userId
```

Id of user

```csharp
[FromBody]
[Required]
InvitationCreateOrUpdateDto invitationCreateOrUpdateDto
```

InvitationCreateDto object

```json
{
  "ExpiresDateTime": "2019-03-06T11:39:54.6774696-08:00",
  "State": 0,
  "SendInvitation": false
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created

##### Type:

 `InvitationDto`

```json
{
  "Id": "Id",
  "Issued": "2019-03-06T11:39:54.6776252-08:00",
  "Expires": "2019-03-06T11:39:54.6776368-08:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000"
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

User or Tenant not found

#### 409

Invitation already exists

#### 500

Internal server error
***

