---
uid: shared-access-routes
---

# Shared Access API Routes

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

If and when contacting OSIsoft support about this error, please provide the **OperationId**.

## Shared Streams

When a stream is shared in a community, the users with the **Community Member** role of the community will be able to access metadata and data in the stream. This is limited to read-only access.

### Available SDS API routes

The following routes are available when a stream is shared in a community. Any routes that modify a stream will be unavailable.

> [!NOTE]
>
> For information on how to get information about and data from a Stream, please see [Streams](xref:sdsStreams) and [API calls for reading data](xref:sdsReadingDataApi) in the [Sequential Data Store](xref:sds) section for specific type information..

```bash
GET  api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}
```

```bash
GET  api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/{*more} 
```

```bash
POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/Transform/{*more} 
```

```bash
POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/Join/{*more} 
```

```bash
GET  api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/metadata
```

```bash
POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/metadata/{key}
```

```bash
POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/tags
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

```csharp
string key
```  

The key specifying the metadata value of interest  

### Security

Allowed for specific **Community Member** role for community where the stream is shared. Having **Community Member** role indicates you are a member of the community.

> [!IMPORTANT]
>
> Both the user's Tenant and the Tenant of the shared resource must be a part of the Community in the route.

### Returns

#### 200

Success

##### Type

The type will match standard SDS route.

> [!NOTE]
>
> For information on how to get information about and data from a Stream, please see [Streams](xref:sdsStreams) and [API calls for reading data](xref:sdsReadingDataApi) in the [Sequential Data Store](xref:sds) section for specific type information..

#### 400

Missing or invalid inputs

#### 401

Unauthorized

> [!WARNING]
>
> You will receive a message similar to this if shared access determines the request is unauthorized:
> > You are currently not authorized to access this route. Note: it can take up to 20 mins for community access to become active.

#### 403

Forbidden

#### 500

Internal server error

***
