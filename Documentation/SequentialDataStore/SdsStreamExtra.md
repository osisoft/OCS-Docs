---
uid: sdsStreamExtra
---

# Stream Metadata and Tags
SdsStream metadata is represented as a dictionary of string keys and associated string values. 
It can be used to associate additional information with a stream. SdsStream tags are represented 
as a list of strings. Tags can be used to categorize or denote special attributes of streams. 
The SdsStream Metadata API And SdsStream Tags API do not accept the search query parameter in their respective
Get calls. However, stream tags and metadata can be used as criteria in search query strings to return 
SdsStream results with the [Stream](xref:sdsStreams) API.

# SdsStream Metadata API 

***********************

## `Get stream metadata`
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
The metadata for the specified SdsStream

#### Sample response body
```json
HTTP/1.1 200 
Content-Type: application/json 

{ 
   "a metadata key":"a metadata value", 
   "another key":"another value" 
} 
```

#### .NET client libraries method
```csharp
      Task<IDictionary<string, string>> GetStreamMetadataAsync(string streamId); 
```

### Security
Allowed for administrator and user accounts  

***********************

## `Get stream metadata value`
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
The metadata for the specified SdsStream 

#### Sample response body
```json
HTTP/1.1 200 
Content-Type: application/json 

{ 
   "a metadata value"
} 
```

### .NET client libraries method  
```csharp
      Task<string> GetStreamMetadataValueAsync(string streamId, string key); 
```

### Security  
Allowed for administrator and user accounts  

***********************

## `Update stream metadata`
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

### .NET client libraries method  
```csharp
      Task UpdateStreamMetadataAsync(string streamId, IDictionary<string, string> metadata); 
```

### Security  
Allowed for administrator accounts  

***********************

## `Patch stream metadata`
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

### .NET client libraries method
```csharp
      Task<IDictionary<string, string>> PatchStreamMetadataAsync(string streamId, MetadataPatchDocument patchDoc);
```

### Security  
Allowed for administrator accounts  

***********************

## `Delete stream metadata`
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


### .NET client libraries method
```csharp
      Task DeleteStreamMetadataAsync(string streamId); 
```

### Security  
Allowed for administrator accounts  

***********************

# SdsStream Tags API 

## `Get stream tags`  
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
The tags for the specified SdsStream   

#### Sample response body
```json
HTTP/1.1 200 
Content-Type: application/json

[ 
    "a tag", 
    "another tag" 
] 
```  

### .NET client libraries method
```csharp
      Task<IList<string>> GetStreamTagsAsync(string streamId); 
```

### Security  
Allowed for administrator and user accounts  

***********************

## `Update stream tags`
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

### .NET client libraries method
```csharp
      Task UpdateStreamTagsAsync(string streamId, IList<string> tags); 
```

### Security  
Allowed by administrator accounts  

***********************

## `Delete stream tags`
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

### .NET client libraries method  
```csharp
      Task DeleteStreamTagsAsync(string streamId); 
```

### Security  
Allowed for administrator accounts  

***********************
