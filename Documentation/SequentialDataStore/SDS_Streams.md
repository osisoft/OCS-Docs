---
uid: sdsStreams
---

# Streams

SDS stores collections of events and provides convenient ways to find and associating events. Events 
of consistent structure are stored in streams, called SdsStreams.  An SdsType defines the structure 
of events in an SdsStream.

## Indexes

The Key or Primary Index is defined at the SdsType. Secondary
Indexes are defined at the SdsStream.

## Interpolation and Extrapolation

The InterpolationMode, ExtrapolationMode, and [PropertyOverrides](#propertyoverrides) can be used to determine how a specific stream reads data. These read characteristics are inherited from the type if they are not defined at the stream level.


## PropertyOverrides

PropertyOverrides provide a way to override interpolation behavior and unit of measure for individual 
SdsType Properties for a specific stream.


# SdsStream API

The REST APIs provide programmatic access to read and write SDS data. The APIs in this 
section interact with SdsStreams. When working in .NET convenient SDS Client libraries are 
available. The ``ISdsMetadataService`` interface, accessed using the ``SdsService.GetMetadataService( )`` helper, 
defines the available functions. See [Streams](#streams) for general 
SdsStream information. 


***********************

## `Get Stream`

Returns the specified stream.

**Request**
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
 ```

**Parameters**

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier  
  
`string streamId`  
The stream identifier


**Response**  
The response includes a status code and a response body.

**Response body**  
The requested SdsStream.

Example response body:
```json
HTTP/1.1 200
Content-Type: application/json

{  
   "Id":"Simple",
   "Name":"Simple",
   "TypeId":"Simple",
}
```

**.NET Library**
```csharp
   Task<SdsStream> GetStreamAsync(string streamId);
```

***********************

## `Get Streams` 

Returns a list of streams.

If specifying the optional search query parameter, the list of streams returned will match 
the search criteria. If the search query parameter is not specified, the list will include 
all streams in the Namespace. See [Searching](xref:sdsSearching) 
for information about specifying those respective parameters.


**Request**
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query={query}&skip={skip}&count={count}&orderby={orderby}
 ```

**Parameters**

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string query`  
An optional parameter representing a string search. 
See [Searching](xref:sdsSearching)
for information about specifying the search parameter.

`int skip`  
An optional parameter representing the zero-based offset of the first SdsStream to retrieve. 
If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsStreams to retrieve. 
If not specified, a default value of 100 is used.

`string orderby`  
An optional parameter representing sorted order which SdsStreams will be returned. A field name is required. The sorting is based on the stored values for the given field (of type string). For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values ``asc`` or ``desc``, respectively. For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending. If no value is specified, there is no sorting of results.

**Response**  
The response includes a status code and a response body.

**Response body**  
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

**.NET Library**  
```csharp
   Task<IEnumerable<SdsStream>> GetStreamsAsync(string query = "", int skip = 0, 
      int count = 100);
```


