---
uid: sdsStreams
---

# Streams

Streams are collections of sequentially occurring values indexed by a single property, typically time series data. You define streams to organize incoming data from another system into OCS.  To define a stream, you must first define a type, which defines the structure of the data you want to stream into a selected namespace. 

SDS stores collections of events and provides convenient ways to find and associate events. Events of consistent structure are stored in streams, called SdsStreams.  SdsStreams are referenced by their identifier or Id field. SdsStream identifiers must be unique within a Namespace.

An SdsStream must include a TypeId that references the identifier of an existing SdsType. SdsStream management using the .NET SDS Client Libraries is performed through ISdsMetadataService. Create the ISdsMetadataService, using one of the ``SdsService.GetMetadataService()`` factory methods.

The following table shows the required and optional SdsStream fields. Fields not listed are reserved
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

**\* Notes regarding SdsStream metadata and tags:** Stream metadata and tags are accessed via the Metadata and Tags API respectively.
However, they are associated with SdsStream objects and can be used as search criteria.

**Rules for the Stream Identifier (SdsStream.Id)**
1. Is not case sensitive
2. Cannot just be whitespace
3. Cannot contain leading or trailing whitespace
4. Cannot contain forward slash ("/")
5. Can contain a maximum of 100 characters

## Indexes

While the key (or primary index) is defined at the SdsType, secondary
indexes are defined at the SdsStream.

Secondary indexes are applied to a single property; there are no
compound secondary indexes. Only SdsTypeCodes
that can be ordered are supported for use in a secondary index.

For more information on indexes, see [Indexes](xref:sdsIndexes).


## Interpolation and Extrapolation

The InterpolationMode, ExtrapolationMode, and [PropertyOverrides](#propertyoverrides) can be used to determine how a specific SdsStream reads data.
These read characteristics are inherited from the SdsType if they are not defined at the SdsStream level.


## PropertyOverrides

PropertyOverrides provide a way to override interpolation behavior and unit of measure for individual 
SdsType Properties for a specific SdsStream.

The ``SdsStreamPropertyOverride`` object has the following structure:


| Property          | Type                 | Optionality | Details |
|-------------------|----------------------|-------------|---------|
| SdsTypePropertyId | String               | Required    | SdsTypeProperty identifier |
| InterpolationMode | SdsInterpolationMode | Optional    | Interpolation setting. Default is null |
| Uom               | String               | Optional    | Unit of measure |


The unit of measure can be overridden for any SdsTypeProperty defined by the stream type, including primary 
and secondary indexes. For more information on SdsTypeProperty `Uom`, see [Types](xref:sdsTypes#SdsTypeProperty). 

Read characteristics of the SdsStream are determined by the SdsType and the `PropertyOverride` of the SdsStream. The 
interpolation mode for non-index properties can be defined and overridden at the SdsStream level. For more 
information about type read characteristics see [Types](xref:sdsTypes#SdsTypeProperty).

If `InterpolationMode` of the SdsType is set to ``Discrete``, it cannot be overridden 
at any level. When `InterpolationMode` is set to ``Discrete`` and an event is not defined for the index,
a null value is returned for the entire event.

# SdsStream API

The REST APIs provide programmatic access to read and write SDS data. The APIs in this 
section interact with SdsStreams. When working in .NET convenient SDS Client libraries are 
available. The ``ISdsMetadataService`` interface, accessed using the ``SdsService.GetMetadataService( )`` helper, 
defines the available functions. See [Streams](#streams) above for general 
SdsStream information. 


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


## `Get Streams` 
------
Returns a list of streams.

If specifying the optional search query parameter, the list of streams returned will match 
the search criteria. If the search query parameter is not specified, the list will include 
all streams in the namespace. See [Search in SDS](xref:sdsSearching) 
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
An optional parameter representing a string search. 
See [Search in SDS](xref:sdsSearching)
for information about specifying the search parameter.

`int skip`  
An optional parameter representing the zero-based offset of the first SdsStream to retrieve. 
If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsStreams to retrieve. 
If not specified, a default value of 100 is used.

`string orderby`  
An optional parameter representing sorted order which SdsStreams will be returned. A field name is required. The sorting is based on the stored values for the given field (of type string). For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values ``asc`` or ``desc``, respectively. For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending. If no value is specified, there is no sorting of results.

### Response
The response includes a status code and a response body.

#### Response body 
A collection of zero or more SdsStreams.

Example response body:
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

Creates the specified stream. If a stream with the same Id already exists, the definition of the stream is updated. 
The following changes are permitted:  

- Name  
- Description  
- Indexes  
- InterpolationMode  
- ExtrapolationMode  
- PropertyOverrides  

Note that modifying Indexes will result in re-indexing all of the stream's data for each additional secondary index.

For more information on secondary indexes, see [Indexes](#indexes).

Unpermitted changes result in an error.

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
Defined Indexes and PropertyOverrides are removed when updating a stream type. 

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

Get the default ACL for the Streams collection. For more information on ACLs, see [Access Control](xref:accessControl).

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

#### Response body 
The default ACL for Streams

### .NET client libraries method
```csharp
   Task<AccessControlList> GetStreamsAccessControlListAsync();
```
***********************

## `Update Streams Access Control List`

Update the default ACL for the Streams collection. For more information on ACLs, see [Access Control](xref:accessControl).

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

## `Get Stream Access Control List`

Get the ACL of the specified stream. For more information on ACLs, see [Access Control](xref:accessControl).

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

#### Response body 
The ACL for the specified stream 

### .NET client libraries method
```csharp
   Task<AccessControlList> GetStreamAccessControlListAsync(string streamId);
```
***********************

## `Update Stream Access Control List`

Update the ACL of the specified stream. For more information on ACLs, see [Access Control](xref:accessControl).

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
*** 

## `Get Stream Owner`

Get the Owner of the specified stream. For more information on Owners, see [Access Control](xref:accessControl).

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
The Owner for the specified stream 

### .NET client libraries method
```csharp
   Task<Trustee> GetStreamOwnerAsync(string streamId);
```
***********************

## `Update Stream Owner`

Update the Owner of the specified stream. For more information on Owners, see [Access Control](xref:accessControl).

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
The response includes a status code.

### .NET client libraries method
```csharp
   Task UpdateStreamOwnerAsync(string streamId, Trustee streamOwner);
```
*** 

## `Get Stream Access Rights`

Gets the Access Rights associated with the specified stream for the requesting identity. For 
more information on Access Rights, see [Access Control](xref:accessControl#commonaccessrightsenum).

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
The response includes a status code and a response body.

#### Response body 
The Access Rights associated with specified stream for the requesting identity.

Example response body:
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

