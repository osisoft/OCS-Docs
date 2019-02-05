---
uid: sdsSearching
---

Searching
=====================
SdsSearch provides a way to search text, phrases, fields, etc. cross the Sequential Data Store. This document covers the 
searching for SdsStreams and SdsTypes.

Searching for Streams
=====================

The search functionality for streams is exposed through the REST API and the client libraries method ``GetStreamsAsync``.

``GetStreamsAsync`` is an overloaded method that is used to search for and return streams (also see [Streams](xref:sdsStreams) for information about using ``GetStreamAsync`` to return streams). When you call an overloaded method, the software determines the most appropriate method to use by comparing the argument types specified in the call to the method definition.

The syntax of the client libraries method is as follows:

      _metadataService.GetStreamsAsync(query:"QueryString", skip:0, count:100);


Searching for streams is also possible using the REST API and specifying the optional ``query`` parameter, as shown here:

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query={query}&skip={skip}&count={count}


Searching for Types
=====================

Similarly, the search functionality for types is also exposed through REST API and the client libraries method ``GetTypesAsync``. The query syntax and the request parameters are the same. 
The only difference is the resource you're searching on, and you can filter on different properties for types than for streams. See [Types](xref:sdsTypes) for more information.

``GetTypesAsync`` is an overloaded method that is used to search for and return types. 

The syntax of the client libraries method is as follows:

      _metadataService.GetTypesAsync(query:"QueryString", skip:0, count:100);


As previously mentioned, searching for types is also possible using the REST API and specifying the optional ``query`` parameter, as shown here:

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Types?query={query}&skip={skip}&count={count}

How Searching Works
=====================

The ``GetStreamsAsync`` or ``GetTypesAsync`` overload return items that match specific search criteria within a given namespace. 
The query parameter will be applied across all properties of items we’re searching on by default, such as ``Name`` or ``Description``.

For example, assume that a namespace contains the following Streams:

**streamId** | **Name**  | **Description**
------------ | --------- | ----------------
stream1      | tempA     | The temperature from DeviceA
stream2      | pressureA | The pressure from DeviceA
stream3      | calcA     | calculation from DeviceA values


Using the stream data above, the following table shows the results of a ``GetStreamsAsync`` call with different ``Query`` values:

**QueryString**     | **Streams returned**
------------------ | ----------------------------------------
``“temperature”``  | Only stream1 returned.
``“calc*”``        | Only stream3 returned.
``“DeviceA*”``     | All three streams returned.
``“humidity*”``    | No streams returned.

The ``skip`` and ``count`` parameters determine which items are returned when a large number of them match 
the ``query`` criteria.   

``count`` indicates the maximum number of items returned by the ``GetStreamsAsync()`` or ``GetTypesAsync()`` call. The maximum value of 
the ``count`` parameter is 1000. 

``skip`` indicates the number of matched items to skip over before returning matching items. You use the 
skip parameter when more items match the search criteria than can be returned in a single call. 

For example, assume there are 175 streams that match the search criteria: “temperature”.

The following call returns the first 100 matches:

       _metadataService.GetStreamsAsync(“temperature”, 0, 100)

After the previous call, you can use the following call to return the remaining 75 matches, skipping over the first 
100 matches because of the skip parameter set at 100):

       _metadataService.GetStreamsAsync(“temperature”, 100, 100)

The ``orderby`` parameter is supported for searching both the streams and types. The basic functionality of it is to search the items and then return the result in sorted order.
The default value for ``orderby`` parameter is ascending order. It can be changed to descending order by specifying ``desc`` alongside the orderby field value. It can be used in conjunction with 
``query``, ``filter``, ``skip``, and ``count`` parameters.

**REST API examples**

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=id asc

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name desc

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name desc&skip=10&count=20


Search operators
=====================

You can specify search operators in the ``query`` string to return more specific search results. 

Operators | Description
----------|-------------------------------------------------------------------
``AND`` | AND operator. For example, ``"cat AND dog"`` searches for streams containing both "cat" and "dog".  AND must be in all caps.
``OR``  | OR operator. For example, ``"cat OR dog"`` searches for streams containing either "cat" or "dog" or both.  OR must be in all caps.
``NOT`` | NOT operator. For example, ``"cat NOT dog"`` searches for streams that have the "cat" term or do not have "dog".  NOT must be in all caps.
``*``   | Wildcard operator. For example, ``"cat*"`` searches for streams that have a term that starts with "cat", ignoring case.
``:``   | Field-scoped query.  For example, ``id:stream*`` will search for streams where the ``id`` field starts with "stream", but will not search on other fields like ``name`` or ``description``.  *Note that field names are camel case and are case sensitive.*
``" "`` | Phrase search operator. For example, while ``Roach Motel`` (without quotes) would search for streams containing Roach Motel anywhere in any order, ``"Roach Motel"`` (with quotes) will only match documents that contain the whole phrase together and in that order.
``( )`` | Precedence operator. For example, ``motel AND (wifi OR luxury)`` searches for streams containing the motel term and either wifi or luxury (or both).

**Notes regarding wildcard:** The wildcard ``*`` can only be used once for each search term, except for the case of a Contains type query clause. In that case two wildcards are allowed: 
one as prefix and one as suffix e.g. ``*Tank*`` is valid but ``*Ta*nk``, ``Ta*nk*``, and ``*Ta*nk*`` are currently not supported.

 The wildcard ``*`` can't be combined when searching for a phrase using the ``" "`` operators which combine multiple ordered search terms. 
It only works when specifying a single search term. For example, you can search for ``Tank*``, ``*Tank``, ``Ta*nk`` but not ``"Tank Meter*"``.

**: Operator**
---------------

You can also qualify which fields are searched by using the following syntax: 

	fieldname:fieldvalue

**REST API example**

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure

**C# example**

	GetStreamsAsync(query:”name:pump name:pressure”);

**\* Operator**
-----------------

You can use the ``‘*’`` character as a wildcard to specify an incomplete string.

**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
``“log*”`` | log<br>logger | analog
``“*log”`` | analog<br>alog | logg
``“*log*”`` | analog<br>alogger | lop
``“l*g”`` | log<br>logg | lop

**Supported**     | **Not Supported**
------------------ | ----------------------------------------
``“*”``<br>``“*log”``<br>``“l*g”``<br>``“log*”``<br>``“*log*”``	| ``“*l*g*”``<br>``“*l*g”``<br>``“l*g*”``

**REST API example**

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=log*

**C# example**

	GetStreamsAsync(query:”log*”);


\"" Operator
-------------------

The search engine automatically searches on strings delimited by
whitespace and dashes (with the exception of identifier fields like Id
or TypeId fields). To search for values that include delimiters, enclose the value in double quotes.
``"*"`` can not be used in conjunction with this operator.

**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
``“pump pressure”`` | pump pressure<br>pump pressure gauge<br>the pump pressure gauge | the pump<br>pressure<br>pressure pump

**REST API example**

	GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams?query=”pump pressure”

**C# example**

	GetStreamsAsync(query:”\\”pump pressure\\””);

Other operators examples
---------------------

**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
``“mud AND log”`` | log mud<br>mud log | mud<br>log
``“mud OR log”`` | log mud<br>mud<br>log | 
``“mud AND (NOT log)”`` | mud | mud log
``“mud AND (log OR pump*)”`` | mud log<br>mud pumps | mud bath
``“name:stream\* AND (description:pressure OR description:pump)”`` | The name starts with “stream” and the description has the either of the terms “pressure” or “pump” | 
