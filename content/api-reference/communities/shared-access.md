---
uid: shared-access-routes
---

***

## Shared Access

Routes Access to shared resources, such as streams.

When a resource is shared in a community, the users with the **Community Member** role of the community will be able to access metadata and data in the resource. This is limited to read-only access.

### Request

> [!IMPORTANT]
>
> All routes use standard SDS service. Please see [Streams](xref:sdsStreams) and [API calls for reading data](xref:sdsReadingDataApi) in the [Sequential Data Store](xref:sds) section for specific request and response information.

***

> [!NOTE]
>
> Any routes that modifies a shared resource will be unavailable.

#### Shared Stream Routes Available

```text

GET  api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}

```

```text

GET  api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/{*more} 

```

```text

POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/Transform/{*more} 

```

```text

POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/data/Join/{*more} 

```

```text

GET  api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/metadata

```

```text

POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/metadata/{key}

```

```text

POST api/v1-preview/communities/{communityId}/tenants/{tenantId}/namespaces/{namespaceId}/streams/{streamId}/tags

```

#### Parameters

`Guid communityId`
Community Unique Identifier - validated to be a `Guid`

`Guid tenantId`
Tenant Unique Identifier - validated to be a `Guid`

`string namespaceId`
Namespace Identifier

`string streamId`
Stream Identifier

[Optional] `string key`  
[Optional] The key specifying the metadata value of interest  

### Response

> [!IMPORTANT]
>
> All routes use standard SDS service. Please see [Streams](xref:sdsStreams) and [API calls for reading data](xref:sdsReadingDataApi) in the [Sequential Data Store](xref:sds) section for specific request and response information.

| Status Code               | Response Type | Description                                                                                                                                                         |
|---------------------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 200 OK                    | Multiple      | Please see [Sequential Data Store](xref:sds) for specific information.                                                                                              |
| 400 Bad Request           | error         | Missing or invalid inputs                                                                                                                                           |
| 401 Unauthorized          | error         | This message is from Shared Access: `You are currently not authorized to access this route. Note: it can take up to 20 mins for community access to become active.` |
| 403 Forbidden             | error         | You are not authorized for this operation                                                                                                                           |
| 404 Not Found             | error         | The data view or query does not exist                                                                                                                               |
| 500 Internal Server Error | error         | An error occurred while processing the request.                                                                                                                     |

### Authentication

Allowed for specific **Community Member** role for community where the stream is shared. Having **Community Member** role indicates you are a member of the community.

> [!IMPORTANT]
>
> Both the user's Tenant and the Tenant of the shared resource must be a part of the Community in the route.

All endpoints referenced in this documentation require authenticated access. You must set the Authorization header to the access token you retrieved from a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.

Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.

Read [OCS Authentication documentation](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) to learn how to authenticate against OCS with the various clients and receive an access token in response.
