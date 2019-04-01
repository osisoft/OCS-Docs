---
uid: sdsStreamExtra
---

Stream Metadata and Tags
========================

SdsStream metadata is represented as a dictionary of string keys and associated string values. 
It can be used to associate additional information with a stream. SdsStream tags are represented 
as a list of strings. Tags can be used to categorize or denote special attributes of streams. 
The SdsStream Metadata API And SdsStream Tags API do not accept the search query parameter in their respective
Get calls. However, they can be used in search query strings to return SdsStream results with the [Stream](xref:sdsStreams) API.

SdsStream Metadata API 
---------------------

``Get stream metadata``
----------------------

Returns the metadata dictionary for the specified stream. 


**Request**

        GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  
  

**Response**

  The response includes a status code and a response body.

**Response body**

  The metadata for the specified SdsStream. 

**Sample response body**

      HTTP/1.1 200 
      Content-Type: application/json 
      { 
          "a metadata key":"a metadata value", 
          "another key":"another value" 
      } 


**.NET Library**

      Task<IDictionary<string, string>> GetStreamMetadataAsync(string streamId); 


**Security**

  Allowed for administrator and user accounts


***********************


``Get stream metadata value``
----------------------

Returns the value for the specified key in the metadata dictionary of the specified stream. 


**Request**

        GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata/{key} 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  
  
``string key``  
  The key specifying the metadata value of interest  



**Response**

  The response includes a status code and a response body.

**Response body**

  The metadata for the specified SdsStream. 

**Sample response body**

      HTTP/1.1 200 
      Content-Type: application/json 
      { 
          "a metadata value” 
      } 


**.NET Library**

      Task<string> GetStreamMetadataValueAsync(string streamId, string key); 


**Security**

  Allowed for administrator and user accounts


***********************

``Update stream metadata``
------------------------

Replaces the metadata for the specified stream with the metadata in the request body. 
Overwrites any existing metadata; does not merge. 


**Request**

        PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  


**Response**

  The response includes a status code.


**.NET Library**

       Task UpdateStreamMetadataAsync(string streamId, IDictionary<string, string> metadata); 


**Security**

  Allowed for administrator accounts


***********************



``Delete stream metadata``
------------------------

Deletes the metadata for the specified stream.  

**Request**

        DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  
  

**Response**

  The response includes a status code.


**.NET Library**

        Task DeleteStreamMetadataAsync(string streamId); 


**Security**

  Allowed for administrator accounts


***********************


SdsStream Tags API 
-----------------


``Get stream tags``
----------------------

Returns the tag list for the specified stream. 


**Request**

        GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  


**Response**

  The response includes a status code and a response body.

**Response body**

  The tags for the specified SdsStream. 

**Sample response body**

      HTTP/1.1 200 
      Content-Type: application/json 
      [ 
          "a tag", 
          "another tag" 
      ] 


**.NET Library**

      Task<IList<string>> GetStreamTagsAsync(string streamId); 


**Security**

  Allowed for administrator and user accounts


***********************

``Update stream tags``
---------------------

Replaces the tag list for the specified stream with the tags listed in the request body.  
Overwrites any existing tags; does not merge. 


**Request**

        PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  

  The request content is the serialized list of tags. 

**Response**

  The response includes a status code.


**.NET Library**

       Task UpdateStreamTagsAsync(string streamId, IList<string> tags); 


**Security**

  Allowed by administrator accounts.


***********************


``Delete stream tags``
------------------------

Deletes the tag list for the specified stream. 


**Request**

       DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags 


**Parameters**

``string tenantId``  
  The tenant identifier  
  
``string namespaceId``  
  The namespace identifier  
  
``string streamId``  
  The stream identifier  


**Response**

  The response includes a status code.


**.NET Library**

       Task DeleteStreamTagsAsync(string streamId); 


**Security**

  Allowed for administrator accounts.


***********************
