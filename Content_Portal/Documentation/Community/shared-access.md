---
uid: shared-access-routes
---

# Shared Access Routes

API routes related to accessing OCS shared resources.

***

## Authentication

All endpoints referenced in this documentation require authenticated access. You must set the Authorization header to the access token you retrieved from a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.

Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.

Read [OCS Authentication documentation](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) to learn how to authenticate against OCS with the various clients and receive an access token in response.

## Error handling

All responses will have an error message in the body. The exceptions are 200 responses and the 401 Unauthorized response. The error message will appear as follows:

```json
{
    "OperationId": "1b2af18e-8b27-4f86-93e0-6caa3e59b90c", 
    "Error": "Error message.", 
    "Reason": "Reason that caused error.", 
    "Resolution": "Possible solution for the error." 
}
```

If and when contacting OSIsoft support about this error, please provide the OperationId.

## Shared Streams

When a stream is shared, the members of the community it is shared to will be limited to read-only access.

> [!NOTE]
>
> For information on how to get data from a Stream, please see [API calls for reading data](xref:sdsReadingDataApi) in the **Sequential Data Store** section.

### Available API routes

```bash
GET  api/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/{*more} 
POST api/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/Transform/{*more} 
POST api/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/Join/{*more} 
```

### Parameters

```csharp
[Required]
Guid communityId
```

Community Unique Identifier - validated to be a `Guid`

```csharp
[Required]
Guid tenantId
```

Tenant Unique Identifier - validated to be a `Guid`

```csharp
[Required]
string namespaceId
```

Namespace Identifier

```csharp
[Required]
string streamId
```

Stream Identifier

### Security

Allowed for specific `Community Member` role for community where the stream is shared. Having this role indicates you are at least a member of the community.

> [!IMPORTANT]
>
> Both the user's Tenant and the Tenant of the shared resource must be a part of the Community in the route.

### Returns

#### 200

Success

##### Type

Please see [SDS](xref:sds) for specific type information.

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 500

Internal server error

***
