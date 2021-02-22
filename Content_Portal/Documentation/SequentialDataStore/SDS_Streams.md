---
uid: sdsStreams
---

# Streams

Streams are a container for sequential data of some type of sequentially occurring values indexed by a single property, typically time series data. You define streams to organize incoming data from another system into the OCS.
To define a stream, you must first define a type, which defines the structure of the data you want to stream into a selected namespace.

SDS stores collections of events and provides convenient ways to find and associate events.
Events of consistent structure are stored in streams. Streams are referenced by their identifier or `Id` field.
Stream identifiers must be unique within a namespace.

A stream must include a `TypeId` that references the identifier of an existing type.
Stream management using the .NET SDS client libraries is performed through `ISdsMetadataService`.
Create the `ISdsMetadataService`, using one of the ``SdsService.GetMetadataService()`` factory methods.

The following table shows the required and optional stream fields. Fields not listed are reserved
for internal SDS use.

<a name="streampropertiestable"></a>
| Property          | Type                             | Optionality | Searchable | Details |
|-------------------|----------------------------------|-------------|------------|---------|
| Id                | String                           | Required    | Yes		  | An identifier for referencing the stream |
| TypeId            | String                           | Required    | Yes		  | The SdsType identifier of the type to be used for this stream |
| Name              | String                           | Optional    | Yes		  | Friendly name |
| Description       | String                           | Optional    | Yes		  | Description text |
| Indexes           | IList\<SdsStreamIndex\>            | Optional    | No		  | Used to define secondary indexes for stream |
| InterpolationMode | SdsInterpolationMode             | Optional    | No		  | Interpolation setting of the stream. Default is null. |
| ExtrapolationMode | SdsExtrapolationMode             | Optional    | No		  | Extrapolation setting of the stream. Default is null. |
| PropertyOverrides | IList\<SdsStreamPropertyOverride\> | Optional    | No		  | Used to define unit of measure and interpolation mode overrides for a stream. |
| [Tags](xref:sdsStreamExtra)*		| IList\<String\>					| Optional    | Yes		  | A list of tags denoting special attributes or categories.|
| [Metadata](xref:sdsStreamExtra)*	| IDictionary\<String, String\>	| Optional    | Yes		  | A dictionary of string keys and associated string values.  |

**\* Notes on stream metadata and tags:** Stream metadata and tags are accessed via the Metadata and Tags API respectively.
However, they are associated with SdsStream objects and can be used as search criteria.

**Rules for the stream identifier (SdsStream.Id)**
1. Is not case sensitive
2. Cannot just be whitespace
3. Cannot contain leading or trailing whitespace
4. Cannot contain forward slash ("/")
5. Can contain a maximum of 100 characters

## Indexes
While you define the primary index on the type, the stream is where you define secondary indexes.
If the primary index defined on the type is a compound index, secondary indexes on the stream are allowed as long as that compound index does not have more than two properties. For more information on compound indexes, see [Indexes](xref:sdsIndexes#compound-indexes). 
<!-- Secondary indexes apply to a single property. In other words, there are no compound secondary indexes.-->

Note that you can only use the SdsTypeCodes of type properties that can be ordered (``DateTime`` or numbers, for example) as a secondary index.

## Interpolation and extrapolation
The `InterpolationMode`, `ExtrapolationMode`, and [SdsStreamPropertyOverride object](#sdsstreampropertyoverride) can be used to determine how a specific stream reads data.
These read characteristics are inherited from the type if they are not defined at the stream level.


## SdsStreamPropertyOverride
``SdsStreamPropertyOverride`` object provides a way to override interpolation behavior and unit of measure for individual 
SdsType Properties for a specific SdsStream.

The ``SdsStreamPropertyOverride`` object has the following structure:

| Property          | Type                 | Optionality | Details |
|-------------------|----------------------|-------------|---------|
| SdsTypePropertyId | String               | Required    | SdsTypeProperty identifier |
| InterpolationMode | SdsInterpolationMode | Optional    | Interpolation setting. Default is null |
| Uom               | String               | Optional    | Unit of measure |


The unit of measure can be overridden for any SdsTypeProperty defined by the stream type, including primary 
and secondary indexes. For more information on SdsTypeProperty `Uom`, see [Types](xref:sdsTypes#sdstypeproperty). 

Read characteristics of the stream are determined by the type and the `PropertyOverride` of the stream.
The interpolation mode for non-index properties can be defined and overridden at the stream level.
For more information about type read characteristics see [Types](xref:sdsTypes#sdstypeproperty).

If `InterpolationMode` of the type is set to ``Discrete``, it cannot be overridden 
at any level. When `InterpolationMode` is set to ``Discrete`` and an event is not defined for the index,
a null value is returned for the entire event.

# SdsStream API

The REST APIs provide programmatic access to read and write SDS data. The API in this 
section interacts with streams. When working in .NET framework, convenient SDS client libraries are 
available. The ``ISdsMetadataService`` interface, accessed using the ``SdsService.GetMetadataService( )`` helper, 
defines the available functions. See [Streams](#streams) above for general 
information related to streams. 

**********************
## `Get Streams` 
Returns a list of streams.

If specifying the optional search query parameter, the list of streams returned will match 
the search criteria. If the search query parameter is not specified, the list will include 
all streams in the namespace. See [Search in SDS](xref:sdsSearching#search-for-streams) 
for information about specifying those respective parameters.


### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query={query}&skip={skip}&count={count}&orderby={orderby}
 ```

### Parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string query`  
[Optional] Parameter representing a string search. 
See [Search in SDS](xref:sdsSearching) for information about specifying the search parameter.

`int skip`  
[Optional] Parameter representing the zero-based offset of the first SdsStream to retrieve. 
If not specified, a default value of 0 is used.

`int count`  
[Optional] Parameter representing the maximum number of SdsStreams to retrieve. 
If not specified, a default value of 100 is used.

`string orderby`  
[Optional] Parameter representing sorted order which SdsStreams will be returned. A field name is required. The sorting is based on the stored values for the given field (of type string). For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values ``asc`` or ``desc``, respectively. For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending. If no value is specified, there is no sorting of results.

### Response
The response includes a status code and a response body.

#### Response body 
A collection of zero or more SdsStreams

#### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[  
   {  
      "Id":"Simple",
      "TypeId":"Simple"
   },
   {  
      "Id":"Simple with Secondary",
      "TypeId":"Simple",
      "Indexes":[  
         {  
            "SdsTypePropertyId":"Measurement"
         }
      ]
   },
   {  
      "Id":"Compound",
      "TypeId":"Compound"
   },
   ...
]
```

### .NET client libraries method  
```csharp
   Task<IEnumerable<SdsStream>> GetStreamsAsync(string query = "", int skip = 0, 
      int count = 100);
```

***********************

## `Get Stream`
Returns the specified stream.

### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
 ```

### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier  
  
`string streamId`  
The stream identifier


### Response
The response includes a status code and a response body.

#### Response body 
The requested SdsStream

#### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

{  
   "Id":"Simple",
   "Name":"Simple",
   "TypeId":"Simple",
}
```

### .NET client libraries method
```csharp
   Task<SdsStream> GetStreamAsync(string streamId);
```

***********************

## `Get Stream Type`
Returns the type definition that is associated with a given stream.

### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Type
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response
The response includes a status code and a response body.

#### Response body 
The requested SdsType.

### .NET client libraries method
```csharp
   Task<SdsType> GetStreamTypeAsync(string streamId);
```

***********************

## `Get or Create Stream`
Creates the specified stream. If a stream with a matching identifier already exists, SDS compares the 
existing stream with the stream that was sent. If the streams are identical, a ``Found`` (302) error 
is returned with the Location header set to the URI where the stream may be retrieved using a Get function. 
If the streams do not match, a ``Conflict`` (409) error is returned.

For a matching stream (Found), clients that are capable of performing a redirect that includes the 
authorization header can automatically redirect to retrieve the stream. However, most clients, 
including the .NET HttpClient, consider redirecting with the authorization token to be a security vulnerability.

When a client performs a redirect and strips the authorization header, SDS cannot authorize the request and 
returns ``Unauthorized`` (401). For this reason, it is recommended that when using clients that do not 
redirect with the authorization header, you should disable automatic redirect.

### Request
 ```text
	POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier. The stream identifier must match the identifier in content. 

#### Request body  
The request content is the serialized SdsStream.

### Response
The response includes a status code and a response body.

#### Response body 
The newly created SdsStream.


### .NET client libraries method
```csharp
      Task<SdsStream> GetOrCreateStreamAsync(SdsStream SdsStream);
```

If a stream with a matching identifier already exists and it matches the stream in the request body, 
the client redirects a GET to the Location header. If the existing stream does not match the stream 
in the request body, a Conflict error response is returned and the client library method throws an exception. 

***********************

## `Create or Update Stream`

Creates the specified stream. If a stream with the same `Id` already exists, the definition of the stream is updated. 
The following changes are permitted:  

- Name  
- Description  
- Indexes  
- InterpolationMode  
- ExtrapolationMode  
- PropertyOverrides  

Note that modifying indexes will result in re-indexing all of the stream's data for each additional secondary index.

For more information on secondary indexes, see [Indexes](#indexes).

Changes that are not permitted result in an error.

### Request
 ```text
	PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

#### Request body  
The request content is the serialized SdsStream.

### Response
The response includes a status code.


### .NET client libraries method
```csharp
   Task CreateOrUpdateStreamAsync(SdsStream SdsStream);
```
***********************

## `Update Stream Type`

Updates a stream’s type. The type is modified to match the specified stream view. 
Defined indexes and PropertyOverrides are removed when updating a stream type. 

### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Type?streamViewId={streamViewId}
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

`string streamViewId`  
The stream view identifier  

#### Request body  
The request content is the serialized SdsStream.

### Response
The response includes a status code.

#### Response body 
On failure, the content contains a message describing the issue.

### .NET client libraries method
```csharp
   Task UpdateStreamTypeAsync(string streamId, string streamViewId);
```

***********************

## `Delete Stream`

Deletes a stream. 

### Request
 ```text
    DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response
The response includes a status code.

### .NET client libraries method
```csharp
   Task DeleteStreamAsync(string streamId);
```

***********************

## `Get Streams Access Control List`

Gets the default ACL for the Streams collection. For more information on ACL, see [Access Control](xref:accessControl).

### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Streams
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

### Response  
The response includes a status code and a response body.

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | See [Access Control](xref:accessControl) |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### Response body 
The default ACL for Streams

#### Response headers

Successful (200 OK) responses include an additional response header.

| Header | Description |
|--|--|
| ETag | An entity tag, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified. |

### .NET client libraries method
```csharp
   Task<AccessControlList> GetStreamsAccessControlListAsync();
   Task<SdsETagResult<AccessControlList>> GetStreamsAccessControlListWithETagAsync();
```

***********************

## `Update Streams Access Control List`

Updates the default ACL for the `Streams` collection. For more information on ACL, see [Access Control](xref:accessControl).

### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Streams
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

#### Request body  
Serialized ACL

### Response
The response includes a status code.

### .NET client libraries method
```csharp
   Task UpdateStreamsAccessControlListAsync(AccessControlList streamsAcl);
```


***********************

## `Patch Streams Access Control List`

Updates the default ACL for the `Streams` collection using an [RFC 6902](https://tools.ietf.org/html/rfc6902) compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List. For more information on ACLs, see [Access Control](xref:accessControl).

### Request
 ```text
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Streams
 ```

### Parameters

`string tenantId`  
The tenant identifier  
  
`string namespaceId`  
The namespace identifier  

#### Request body 
An [RFC 6902](https://tools.ietf.org/html/rfc6902) JSON Patch document that will be applied to the ACL.

The example below inserts a new **Access Control Entry** into the **Access Control List** giving **Read** and **Write** access to the role with the Id `11111111-1111-1111-1111-111111111111`. The remainder of the existing ACL remains unmodified.
```json
[
    {
        "op": "add",
        "path": "/RoleTrusteeAccessControlEntries",
        "value": {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessType": 0,
            "AccessRights": 3
        }
    }
]
```

#### Request headers

The **If-Match** header can be used to prevent modification of an ACL since it was last read using the `ETag` header from the response.

| Header | Description |
|--|--|
| If-Match | The entity tag header from a previous read of the ACL. If provided, the ACL will not be patched unless the current `ETag` of the ACL, on the server, matches the value passed into the `If-Match` header. |

### Response  
The response includes a status code.

| Status Code | Response Type | Description |
|--|--|--|
| 204 No Content || The ACL was successfully patched. |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 412 Precondition Failed | error | The `If-Match` header did not match `ETag` on the ACL, or a `test` operation in the JSON Patch document failed to evaluate to `true`.
| 500 Internal Server Error | error | An error occurred while processing the request. |

### .NET client libraries method
```csharp
   Task PatchStreamsAccessControlListAsync(JsonPatchDocument<AccessControlList> streamsAclPatch);
   Task PatchStreamsAccessControlListWithETagAsync(string etag, JsonPatchDocument<AccessControlList> streamsAclPatch);
```


***********************

## `Get Stream Access Control List`

Gets the ACL of the specified stream. For more information on ACL, see [Access Control](xref:accessControl).

### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessControl
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response  
The response includes a status code and a response body.

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | See [Access Control](xref:accessControl) |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### Response body  
The ACL for the specified stream.

#### Response headers

Successful (200 OK) responses include an additional response header.

| Header | Description |
|--|--|
| ETag | An entity tag, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified. |


### .NET client libraries method
```csharp
   Task<AccessControlList> GetStreamAccessControlListAsync(string streamId);
   Task<SdsETagResult<AccessControlList>> GetStreamAccessControlListWithETagAsync(string streamId);   
```

***********************

## `Update Stream Access Control List`

Updates the ACL of the specified stream. For more information on ACL, see [Access Control](xref:accessControl).

### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessControl
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

#### Request body  
Serialized ACL

### Response
The response includes a status code.

### .NET client libraries method
```csharp
   Task UpdateStreamAccessControlListAsync(string streamId, AccessControlList streamAcl);
```

***********************

## `Patch Stream Access Control List`

Updates the ACL of the specified stream using an [RFC 6902](https://tools.ietf.org/html/rfc6902) compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List. For more information on ACLs, see [Access Control](xref:accessControl).

### Request
 ```text
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessControl
 ```

### Parameters

`string tenantId`  
The tenant identifier  
  
`string namespaceId`  
The namespace identifier  
  
`string streamId`  
The stream identifier  

#### Request body 
An [RFC 6902](https://tools.ietf.org/html/rfc6902) JSON Patch document that will be applied to the ACL.

The example below inserts a new **Access Control Entry** into the **Access Control List** giving **Read** and **Write** access to the role with the Id `11111111-1111-1111-1111-111111111111`. The remainder of the existing ACL remains unmodified.
```json
[
    {
        "op": "add",
        "path": "/RoleTrusteeAccessControlEntries",
        "value": {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessType": 0,
            "AccessRights": 3
        }
    }
]
```

#### Request headers

The **If-Match** header can be used to prevent modification of an ACL since it was last read using the `ETag` header from the response.

| Header | Description |
|--|--|
| If-Match | The entity tag header from a previous read of the ACL. If provided, the ACL will not be patched unless the current `ETag` of the ACL, on the server, matches the value passed into the `If-Match` header. |

### Response  
The response includes a status code.

| Status Code | Response Type | Description |
|--|--|--|
| 204 No Content || The ACL was successfully patched. |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 412 Precondition Failed | error | The `If-Match` header did not match `ETag` on the ACL, or a `test` operation in the JSON Patch document failed to evaluate to `true`.
| 500 Internal Server Error | error | An error occurred while processing the request. |

### .NET client libraries method
```csharp
   Task PatchStreamAccessControlListAsync(string streamId, JsonPatchDocument<AccessControlList> streamAclPatch);
   Task PatchStreamAccessControlListWithETagAsync(string streamId, string etag, JsonPatchDocument<AccessControlList> streamAclPatch);
```



*** 

## `Get Stream Owner`

Gets the `Owner` of the specified stream. For more information, see [Access Control](xref:accessControl).

### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Owner
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response
The response includes a status code and a response body.

#### Response body 
The `Owner` for the specified stream 

### .NET client libraries method
```csharp
   Task<Trustee> GetStreamOwnerAsync(string streamId);
```
***********************

## `Update Stream Owner`

Updates the `Owner` of the specified stream. For more information, see [Access Control](xref:accessControl).

### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Owner
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

#### Request body  
Serialized Owner

### Response
The response includes a status code

### .NET client libraries method
```csharp
   Task UpdateStreamOwnerAsync(string streamId, Trustee streamOwner);
```
***

## `Get Stream Access Rights`

Gets the access rights associated with the specified stream for the requesting identity. For 
more information on access rights, see [Access Control](xref:accessControl#commonaccessrightsenum).

### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessRights
 ```

### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response
The response includes a status code and a response body

#### Response body 
The Access Rights associated with specified stream for the requesting identity.

#### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

["Read", "Write"]
```

### .NET client libraries method
```csharp
   Task<string[]> GetStreamAccessRightsAsync(string streamId);
```
***********************

