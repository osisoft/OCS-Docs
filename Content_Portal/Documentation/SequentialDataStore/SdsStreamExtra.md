---
uid: sdsStreamExtra
---

# Stream metadata and tags
Stream metadata is represented as a dictionary of string keys and associated string values. 
It can be used to associate additional information with a stream. Stream tags are represented 
as a list of strings. Tags can be used to categorize or denote special attributes of streams. 
The Stream Metadata API And Stream Tags API do not accept the search query parameter in their respective
GET calls. However, stream tags and metadata can be used as criteria in search query strings to return 
stream results with the [Stream](xref:sdsStreams) API.

# SdsStream Metadata API 

***********************

## `Get Stream Metadata`
Returns the metadata dictionary for the specified stream.   

### Request  
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 
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
The metadata for the specified stream

#### Example response body
```json
HTTP/1.1 200 
Content-Type: application/json 

{ 
   "a metadata key":"a metadata value", 
   "another key":"another value" 
} 
```
### Authorization
Allowed for account administrator and account members

#### .NET client libraries method
```csharp
      Task<IDictionary<string, string>> GetStreamMetadataAsync(string streamId); 
```

***********************

## `Get Stream Metadata Value`
Returns the value for the specified key in the metadata dictionary of the specified stream.  

### Request
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata/{key} 
 ```

### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`   
The namespace identifier   

`string streamId`  
The stream identifier   

`string key`  
The key specifying the metadata value of interest  

### Response  
The response includes a status code and a response body  

#### Response body  
The metadata for the specified stream 

#### Example response body
```json
HTTP/1.1 200 
Content-Type: application/json 

{ 
   "a metadata value"
} 
```

### Authorization
Allowed for account administrator and account members

### .NET client libraries method  
```csharp
      Task<string> GetStreamMetadataValueAsync(string streamId, string key); 
```

***********************

## `Update Stream Metadata`
Replaces the metadata for the specified stream with the metadata in the request body. 
Overwrites any existing metadata; does not merge.  

### Request
 ```text
      PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 
 ```

### Parameters  
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response  
The response includes a status code  

### Authorization
Allowed for account administrator and account members

### .NET client libraries method  
```csharp
      Task UpdateStreamMetadataAsync(string streamId, IDictionary<string, string> metadata); 
```


***********************

## `Patch Stream Metadata`
Modifies the metadata based on operations specified in the request body. The request body follows
[JSON Patch format](http://jsonpatch.com/).

### Request  
 ```text
      PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 
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
A collection of operations to be applied to the metadata collection as specified by the [JSON Patch format](http://jsonpatch.com/)  

### Authorization
Allowed for account administrator and account members

### .NET client libraries method
```csharp
      Task<IDictionary<string, string>> PatchStreamMetadataAsync(string streamId, MetadataPatchDocument patchDoc);
```

***********************

## `Delete Stream Metadata`
Deletes the metadata for the specified stream.  

### Request
 ```text
      DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 
 ```

### Parameters  
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response  
The response includes a status code  

### Authorization
Allowed for account administrator and account members

### .NET client libraries method
```csharp
      Task DeleteStreamMetadataAsync(string streamId); 
```

***********************

# SdsStream Tags API 

## `Get Stream Tags`  
Returns the tag list for the specified stream. 

### Request
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags 
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
The tags for the specified stream   

#### Example response body
```json
HTTP/1.1 200 
Content-Type: application/json

[ 
    "a tag", 
    "another tag" 
] 
```
### Authorization
Allowed for account administrator and account members

### .NET client libraries method
```csharp
      Task<IList<string>> GetStreamTagsAsync(string streamId); 
```

***********************
## `Update Stream Tags`
Replaces the tag list for the specified stream with the tags listed in the request body.
Overwrites any existing tags; does not merge. 

### Request
 ```text
      PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags 
 ```

### Parameters  
`string tenantId`  
The tenant identifier    

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

#### Request body  
The request content is the serialized list of tags 

### Response  
The response includes a status code  

### Authorization
Allowed for account administrator and account members

### .NET client libraries method
```csharp
      Task UpdateStreamTagsAsync(string streamId, IList<string> tags); 
```

***********************
## `Delete Stream Tags`
Deletes the tag list for the specified stream. 

### Request
 ```text
      DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags 
 ```

### Parameters  
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string streamId`  
The stream identifier  

### Response  
The response includes a status code  

### Authorization
Allowed for account administrator and account members

### .NET client libraries method  
```csharp
      Task DeleteStreamTagsAsync(string streamId); 
```

***********************
