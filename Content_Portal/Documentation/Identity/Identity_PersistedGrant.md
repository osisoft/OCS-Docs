---
uid: identityPersistedGrant
---

# Persisted Grant

Persisted grants, such as refresh tokens or authorization codes, are used by OSIsoft Cloud Services to maintain some state about User authentication with regards to a client. For instance, refresh tokens, which are issued to hybrid clients, make it possible to determine when the client can be issued a new access token on behalf of the user without the users themselves being present.


***

## Authentication

All endpoints referenced in this documentation require authenticated access. Authorization header must be set to the access token you retrieve after a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) on how to authenticate against OCS with the various clients and receive an access token in response.

## Error handling

All responses will have an error message in the body. The exceptions are 200 responses and the 401 Unauthorized response. The error message will look as follows:

```json
{
    "OperationId": "1b2af18e-8b27-4f86-93e0-6caa3e59b90c", 
    "Error": "Error message.", 
    "Reason": "Reason that caused error.", 
    "Resolution": "Possible solution for the error." 
}
```

If and when contacting OSIsoft support about this error, please provide the OperationId.

## `Get Client Ids of Persisted Grants for User`

Get enumerable of client IDs that have been issued an
            authorization code (not the same as the client type)
            on behalf of a user.

### Request

`GET api/v1/Tenants/{tenantId}/Users/{userId}/PersistedGrants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  "String",
  "String"
]
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User not found.

#### 500

Internal server error.
***

## `Get Total Count of Persisted Grants for a User`

Validate whether there are any authorization code persisted grants for user.

### Request

`HEAD api/v1/Tenants/{tenantId}/Users/{userId}/PersistedGrants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Void`

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User not found.

#### 500

Internal server error.
***

## `Remove Persisted Grants`

Remove authorization code persisted grants 
            for the user with the specified User Id in the tenant.

### Request

`DELETE api/v1/Tenants/{tenantId}/Users/{userId}/PersistedGrants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 204

Removed.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

