---
uid: sdsSearching
---

# Search in SDS

You can search for objects using texts, phrases and fields in Sequential Data Store (SDS).
The REST APIs (or .NET client libraries methods ``GetStreamsAsync``, ``GetTypesAsync``, and ``GetStreamViewsAsync``) return items that match the search criteria within a given namespace.
By default, the ``query`` parameter applies to all searchable object fields.

For example, a namespace contains the following streams:

**streamId** | **Name**  | **Description**
------------ | --------- | ----------------
stream1      | tempA     | Temperature from DeviceA
stream2      | pressureA | Pressure from DeviceA
stream3      | calcA     | Calculation from DeviceA values

A ``GetStreamsAsync`` call with different queries will return below:

**Query string**     | **Returns**
------------------  | ----------------------------------------
``temperature``  | stream1
``calc*``        | stream3
``DeviceA*``     | stream1, stream2, stream3
``humidity*``    | nothing

#### Requests
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name

	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=id asc

	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name desc

	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name desc&skip=10&count=20
 ```
#### Parameters
`string query`  
[Optional] Parameter representing the search criteria. If unspecified, returns all values. Can be used with `skip`, `count` and `orderby`.

`int skip`  
[Optional] Parameter representing the zero-based offset of the first SdsStream to retrieve. The number of matched items to skip over before returning. If unspecified, a default value of 0 is used. Use when more items match the search criteria than can be returned in a single call.

`int count`  
[Optional] Parameter representing the maximum number of streams to retrieve. If unspecified, a default value of 100 is used. The maximum value is 1,000. 

`string orderby`  
[Optional] Parameter representing the sorted order in which streams are returned. Requires a field name (``orderby=name``, for example). Default order is ascending (``asc``). Add ``desc`` for descending order (``orderby=name desc``, for example). If unspecified, there is no sorting of results.

#### .NET client libraries methods
If there are 175 streams that match the search criteria "temperature" in a single call for example, the following call will return the first 100 matches:

```csharp
    _metadataService.GetStreamsAsync(query:"temperature", skip:0, count:100)
```

If ``skip`` is set to 100, the following call will return the remaining 75 matches while skipping over the first 100:
```csharp
    _metadataService.GetStreamsAsync(query:"temperature", skip:100, count:100)
```

## Search for streams

Streams search is exposed through the REST API and the client libraries method ``GetStreamsAsync``.

For more information on stream properties, see [Streams](xref:sdsStreams#streampropertiestable).

**Searcheable Properties**
| Property          | Searchable  |
|-------------------|-------------|
| Id                | Yes		  |
| TypeId            | Yes		  |
| Name              | Yes		  |
| Description       | Yes		  |
| Indexes           | No		  |
| InterpolationMode | No		  |
| ExtrapolationMode | No		  |
| PropertyOverrides | No		  |

**Searcheable Child Resources**
| Property          | Searchable  |
|-------------------|-------------|
| [Metadata](xref:sds-streams-metadata)*		| Yes		  |
| [Tags](xref:sds-streams-tags)*	| Yes		  |
| ACL | No		  |
| Owner | No		  |

> [!Note]
> You can access stream metadata and tags through Metadata API and Tags API respectively. Metadata and tags are associated with streeams and can be used as search criteria. See [below](#Stream_Metadata_search_topic) for more information.

#### Request
Search for streams using the REST API and specifying the optional `query` parameter:
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query={query}&skip={skip}&count={count}
 ```
#### Parameters
`string query`  
[Optional] Parameter representing the search criteria. If unspecified, returns all values. Can be used with `skip`, `count` and `orderby`. 

`int skip`  
[Optional] Parameter representing the zero-based offset of the first SdsStream to retrieve. If unspecified, a default value of 0 is used. Use when more items match the search criteria than can be returned in a single call.

`int count`  
[Optional] Parameter representing the maximum number of streams to retrieve. If unspecified, a default value of 100 is used. The maximum value is 1,000. 

#### .NET client libraries method
``GetStreamsAsync`` is used to search for and return streams. 
```csharp
      _metadataService.GetStreamsAsync(query:"QueryString", skip:0, count:100);
```

The stream fields valid for search are identified in the fields table located on the [Streams](xref:sdsStreams#streampropertiestable) page.
Note that stream metadata has unique syntax rules.
See [How search works with stream metadata](#Stream_Metadata_search_topic).

## Search for types

Type search is exposed through the REST API and the client libraries method ``GetTypesAsync``. 
For more information on type properties, see [Types](xref:sdsTypes#typepropertiestable).

**Searcheable Properties**
| Property          | Searchable |
|-------------------|------------|
| Id                | Yes        |
| Name              | Yes        |
| Description       | Yes        |
| SdsTypeCode       | No         |
| InterpolationMode | No         |
| ExtrapolationMode | No         |
| Properties        | Yes, with limitations* |

> [!NOTE]
> `Properties` field  
> `Name` and `Id` of an SdsType are included in its `Properties` field.
>  Similarly, `Name` and `Id` of a nested type are included in its `Properties`. If there are two types with the same `Properties`, `Name` or `Id`, the search will return both types in the result.

#### Request
Search for types using the REST API and specifying the optional `query` parameter:
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types?query={query}&skip={skip}&count={count}
 ```
#### Parameters
`string query`  
[Optional] Parameter representing the search criteria. If unspecified, returns all values. Can be used with `skip`, `count` and `orderby`. 

`int skip`  
[Optional] Parameter representing the zero-based offset of the first type to retrieve. If unspecified, a default value of 0 is used. Use when more items match the search criteria than can be returned in a single call.

`int count`  
[Optional] Parameterr representing the maximum number of types to retrieve. If unspecified, a default value of 100 is used. The maximum value is 1,000. 

#### .NET client libraries method
``GetTypesAsync`` is used to search for and return types. 
```csharp
      _metadataService.GetTypesAsync(query:"QueryString", skip:0, count:100);
```
## Search for stream views
Stream view search is exposed through the REST API and the client libraries method ``GetStreamViewsAsync``. 
For more information on stream view properties, see [Stream Views](xref:sdsStreamViews#streamviewpropertiestable).

**Searcheable Properties**
| Property     | Searchable |
|--------------|------------|
| Id           | Yes		|
| Name         | Yes		|
| Description  | Yes		|
| SourceTypeId | Yes		|
| TargetTypeId | Yes		|
| Properties   | Yes, with limitations* |

> [!NOTE]
> The `Properties` collection contains a list of SdsStreamViewProperty objects. 
> The query will attempt to find a match on the SdsStreamViewProperty's `Id`, `SourceTypeId`, and `TargetTypeId` fields. 
> The `Properties` collection of nested views will also be searched. See the example below.  

#### Example
You can search for ``ComplexView`` using the `Id`("NestedView"), `SourceTypeId`, and `TargetTypeId` of ``NestedView`` but not its `Description`("An example of a nested view").  
```json
{ 
   "Id":"ComplexView",
   "Name":"ComplexView",
   "SourceTypeId":"ComplexSourceType",
   "TargetTypeId":"ComplexTargetType",
   "Description":null,
   "Properties":[ 
      { 
         "SourceId":"Value",
         "TargetId":"Value",
         "SdsStreamView":{ 
            "Id":"NestedView",
            "SourceTypeId":"NestedType",
            "TargetTypeId":"NestedType",
            "Description":"An example of a nested view",
            "Properties":[ 
               { 
                  "SourceId":"Value",
                  "TargetId":"Value"
               }
            ]
         }
      }
   ]
}
```
#### Request
Search for stream views using the REST API and specifying the optional `query` parameter:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews?query={query}&skip={skip}&count={count}
 ```
#### Parameters
`string query`  
[Optional] Parameter representing the search criteria. If unspecified, returns all values. Can be used with `skip`, `count` and `orderby`. 

`int skip`  
[Optional] Parameter representing the zero-based offset of the first stream view to retrieve.If unspecified, a default value of 0 is used. Use when more items match the search criteria than can be returned in a single call.

`int count`  
[Optional] Parameter representing the maximum number of stream views to retrieve. If unspecified, a default value of 100 is used. The maximum value is 1,000. 

#### .NET client libraries method
``GetStreamViewsAsync`` is used to search for and return stream views. 
```csharp
    _metadataService.GetStreamViewsAsync(query:"QueryString", skip:0, count:100);
```

## Tokenization
Tokenization is the process of breaking a string sequence into pieces called tokens using specific characters to delimit tokens. User-specified queries are tokenized into search terms. How the query string is tokenized can affect search results.

Delimit the terms with 1) a space, or 2) one or more punctuation characters (``*``, ``!``, ``?``, ``.``, for example) and a space. Query string followed without space by other punctuation characters does not trigger tokenization and is treated as part of the term. 

If your query has a wildcard (``*``) operator after a punctuation character, neither the punctuation nor the wildcard operator is tokenized. To specifically search for a term that has trailing punctuation, enclose the query in quotation marks to ensure that the punctuation is part of the query. See examples below:

 Term | Tokenized Term | Description
----------|--------------|-----------
``Device.1`` | ``Device.1``| The token includes ``.1`` because there is no space between it and ``Device``.
``Device!!1`` | ``Device!!1``| The token includes ``!!1`` because there is no space between it and ``Device``.
<code>Device.&nbsp;</code>  | ``Device``| ``.`` and the following space demarcates ``Device`` as the token term.
<code>Device!!&nbsp;</code> | ``Device``| ``!!`` and the following space demarcates ``Device`` as the token term.
``Device!*`` | ``Device``| The token does not include ``!*`` because neither is tokenized if a wildcard operator follows a punctuation character.
``"Device!"*`` | ``Device!``| ``Device!`` is the token because the string is enclosed in double quotes.

## Search operators
You can use search operators in the ``query`` string to get more refined search results. Use operators ``AND``,``OR``, and ``NOT`` in all caps. 

Operator | Description
----------|-------------------------------------------------------------------
``AND`` | AND operator. ``cat AND dog`` searches for both "cat" and "dog".  
``OR``  | OR operator. ``cat OR dog`` searches for either "cat" or "dog", or both. 
``NOT`` | NOT operator. ``cat NOT dog`` searches for "cat" or those without "dog".
``*``   | Wildcard operator. Matches 0 or more characters. ``log*`` searches for those starting with "log" ("log", "logs" or "logger" for example.); ignores case.
``:``   | Field-scoped query. Specifies a field to search. ``id:stream*`` searches for streams whose ``id`` field starts with "stream", but will not search other fields like ``name`` or ``description``. See [Field-scoping operator](#fieldScoped) below.
``" "`` | Quote operator. Scopes the search to an exact sequence of characters. While ``dog food`` (without quotes) searches for instances with "dog" or "food" anywhere in any order, ``"dog food"`` (with quotes) will only match instances that contain the whole string together and in that order.
``( )`` | Precedence operator. ``motel AND (wifi OR luxury)`` searches for either "wifi" or "luxury", or "wifi" and "luxury" at the intersection of "motel".

### Examples
**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
``mud AND log`` | log mud<br>mud log | mud<br>log
``mud OR log`` | log mud<br>mud<br>log | mutt<br>look
``mud AND (NOT log)`` | mud | mud log
``mud AND (log OR pump*)`` | mud log<br>mud pumps | mud bath
``name:stream* AND (description:pressure OR description:pump)`` | The name starts with "stream" and the description has either "pressure" or "pump", or both. | string


### <a name="fieldScoped">Field-scoping (``:``) operator</a>
You can qualify the search to a specific field using the ``:`` operator.  

	fieldname:fieldvalue

#### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure
 ```

#### .NET client libraries method
```csharp
	GetStreamsAsync(query:"name:pump name:pressure");
```

### Wildcard (``*``) operator
You can use the wildcard operator (``*``) to complement an incomplete string.
It can only be used once per token, unless there's one at the beginning and another at the end (``*Tank*`` but not ``*Ta*nk``, ``Ta*nk*`` or ``*Ta*nk*``, for example).  

**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
``log*`` | log<br>logger | analog
``*log`` | analog<br>alog | logg
``*log*`` | analog<br>alogger | lop
``l*g`` | log<br>logg | lake swimming (``*`` does not span across two tokens)

**Supported**     | **Not Supported**
------------------ | ----------------------------------------
``*``<br>``*log``<br>``l*g``<br>``log*``<br>``*log*`` <br>``"my log"*``	| ``*l*g*``<br>``*l*g``<br>``l*g*`` <br>``"my"*"log"``

#### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=log*
 ```

#### .NET client libraries method
```csharp
	GetStreamsAsync(query:"log*");
```

### Double quotes (``""``) operator	
Tokenized search terms are delimited by whitespace and punctuation. To include these delimiters in a search, enclose them in double quotes.	

When using double quotes, the matching string must include the whole value of the field on the object being searched. Partial strings will not be matched unless wildcards are used. For example, if you're searching for a stream with description ``Pump three on unit five``, a query ``"unit five"`` will not match the description, but ``*"unit five"`` will.

Note that while wildcard (``*``) can be used either in or outside of quotes, it is treated as a string literal inside quotes.  For example, you can search for ``"dog food"*`` to find a string that starts with "dog food", but if you search for ``"dog food*"``, it will only match the value of "dog food*".

 **Query string**     | **Matches field value** | **Does not match field value**	
------------------ | --------------------------------- | -----------------------------	
``"pump pressure"`` | pump pressure | pressure <br> pressure pump <br> pump pressure gauge	
``"pump pressure"*`` | pump pressure <br> pump pressure gauge | pressure <br> pressure pump <br> the pump pressure gauge
``*"pump pressure"`` | pump pressure <br> the pump pressure | pressure <br> pressure pump <br> the pump pressure gauge
``*"pump pressure"*`` | pump pressure <br> pump pressure gauge <br> the pump pressure gauge | pressure <br> pressure pump 
``"pump*pressure"`` | pump\*pressure | pump pressure <br> the pump pressure gauge

#### Request
```text	
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query="pump pressure"	
```

#### .NET client libraries method
```csharp	
	GetStreamsAsync(query:"\\"pump pressure\\"");	
```

## <a name="Stream_Metadata_search_topic">How search works with stream metadata</a>
[Stream metadata](xref:sds-streams-metadata) behaves differently with search syntax rules described in the previous sections. 

**A namespace with streams with respective metadata key-value pairs**

**streamId** | **Metadata**
------------ | --------- 
stream1      | { manufacturer, company }<br>{ serial, abc }
stream2      | { serial, a1 }
stream3      | { status, active }<br>{ second key, second value }   


### Field-scoping (``:``) Operator
Stream metadata key is only searchable in association with its value. This pairing is defined using the field-scoping (``:``) operator. 

	myStreamMetadataKey:myStreamMetadataValue

Metadata key is not searched if the operator (``:``) is missing in the query string: the search is then limited to metadata values along with other searchable fields in the stream.

**Query string**            | **Returns** | **Description**
------------------------   | ------------- |-------------
``manufacturer:company``  | stream1 | Searches and returns stream1.
``company``               | stream1      | Searches only the metadata values due to lack of ``:`` operator and returns stream1.
``a*``  | stream1, stream2, stream3       | Searches the metadata values and returns all three streams.

#### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=manufacturer:company
 ```

#### .NET client libraries method
```csharp
	GetStreamsAsync(query:"manufacturer:company");
```

### Wildcard (``*``) Operator  
Wildcard (``*``) character can be used both in metadata keys and values with one caveat: wildcard (``*``) used in the field (left of field-scoped operator (``:``)) will only search within SdsStream metadata.

**Query string**     | **Returns** | **Description**
------------------  | ---------------- | ------------------------
``manufa*turer:compan*``  | stream1 | Searches and returns stream1.
``ser*al:a*``  | stream1, stream2 | Searches and returns stream1 and stream2.
``s*:a*``  | stream1, stream2, stream3 | Searches and returns all three streams. 
``Id:stream*``  |  stream1, stream2, stream3 | Searches all fields and returns three streams. 
``Id*:stream*``  | nothing | Wildcard in the field limits the search to metadata. Returns nothing because there is no metadata by that name that meets the criteria.

#### Request
 ```text
	GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=manufa*turer:compan*
 ```

#### .NET client libraries method
```csharp
	GetStreamsAsync(query:"manufa*turer:compan*");
```

