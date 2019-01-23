---
uid: sdsWritingDataApi
---

API calls for writing data
==========================

Reading and writing data with the SDS Client Libraries is performed through 
the ``ISdsDataService`` interface, which is accessed with the ``SdsService.GetDataService( )`` 
helper.


***********************


``InsertValueAsync()``
----------------

Inserts data into the specified stream. Throws an exception if data is already present at the index used in ‘item’.

**Syntax**

        Task InsertValueAsync<T>(string streamId, T item);

*Http*

        POST api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/InsertValue

Content is serialized event of type T

**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``T item``
  The event to insert, where T is the type of the event and the stream


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
``InsertValue`` throws an exception if an event already exists at the specified index.

  For HTTP requests, the message content (the event) must be serialized in JSON format. JSON objects 
  consist of a series of name-value property pairs enclosed within brackets. 

  .. _Introducing JSON: http://json.org/index.html

  You can serialize your data using one of many available JSON serializers available at `Introducing JSON`_. 


  How the data is serialized depends upon the type of event you are inserting. For example, the following code 
  shows a single WaveData event serialized as JSON. See the SDS code samples for the complete WaveData example.

  ::

  	{
		"Order":2,	
		"Tau":0.25722883666666846,	
		"Radians":1.6162164471269089,	
		"Sin":1.9979373673043652,	
		"Cos":-0.090809010174665111,	
		"Tan":-44.003064529862513,	
		"Sinh":4.8353589272389,	
		"Cosh":5.2326566823391856,	
		"Tanh":1.8481468289554672
	}


**********************


``InsertValuesAsync()``
----------------

Inserts items into the specified stream. Throws an exception if data is already present at an index used in one of the ‘items'.


**Syntax**

        Task InsertValuesAsync<T>(string streamId, IList<T> items);

**Http**

        POST api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/InsertValues


Content is serialized list of events of type T	


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``T items``
  The list of events to insert, where T is the type of the stream and events


**Returns**  
An IEnumerable of all behavior objects

**Notes**  
``InsertValuesAsync`` throws an exception if any index in **items** already has an event. If any individual
  index encounters a problem, the entire operation is rolled back and no
  insertions are made. The streamId and index that caused the issue are
  included in the error response.

  For HTTP requests, the values to be inserted must be formatted as a serialized JSON array of type T. JSON arrays are 
  comma-delimited lists of type T enclosed within square brackets. The following code shows a list 
  of three WaveData events that are properly formatted for insertion. See the SDS code samples for 
  the complete WaveData example.

    	[
    		{
    			"Order":2,
    			"Tau":0.25722883666666846,
    			"Radians":1.6162164471269089,
    			"Sin":1.9979373673043652,
    			"Cos":-0.090809010174665111,
    			"Tan":-44.003064529862513,
    			"Sinh":4.8353589272389,
    			"Cosh":5.2326566823391856,
    			"Tanh":1.8481468289554672
    		}, 
    		{
    			"Order":4,
    			"Tau":0.25724560000002383,
    			"Radians":1.6163217742567466,
    			"Sin":1.9979277915696148,
    			"Cos":-0.091019446679060964,
    			"Tan":-43.901119254534827,
    			"Sinh":4.8359100947709592,
    			"Cosh":5.233166005842703,
    			"Tanh":1.8481776000882766
    		}, 
    		{
    			"Order":6,
    			"Tau":0.25724560000002383,
    			"Radians":1.6163217742567466,
    			"Sin":1.9979277915696148,
    			"Cos":-0.091019446679060964,
    			"Tan":-43.901119254534827,
    			"Sinh":4.8359100947709592,
    			"Cosh":5.233166005842703,
    			"Tanh":1.8481776000882766
    		}
    	]


Security
  Allowed by administrator accounts


**********************


``PatchValueAsync()``
----------------

Modifies the specified stream event. PatchValue affects only the data item parameters that are included in the call.


**Syntax**

        Task PatchValueAsync(string streamId, string selectExpression, T item);

**Http**

        PATCH api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/PatchValue?select={selectExpression}


Content is serialized patch property

**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``string selectExpression``
  CSV list of strings that indicates the event fields that will be changed in stream events.
``T item``
  Object with index and new values to patch in the stream.


**Returns**  
An IEnumerable of all behavior objects

**Notes**  
``PatchValue`` is used to modify the stream events. Only the values 
  for fields specified in the SelectExpression are taken from the item 
  and replaced (patched) in the stream using the item index.


Security
  Allowed by administrator accounts

**Example**

        var obj = new { TimeId = DateTime.UtcNow(), Value = 10 };
        await _dataService.PatchValueAsync(streamId, “Value”, obj);  


**********************


``PatchValuesAsync()``
----------------

Patches values of the selected fields for multiple events in the stream.


**Syntax**

        Task PatchValuesAsync(string streamId, string selectExpression, IList<T> items);

**Http**

        PATCH api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/PatchValues?select={selectExpression}

Content is serialized list of patch property values


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``string selectExpression``
  CSV list strings that indicates the event fields that will be changed in stream events.
``T items``
  List which contain indexes and new values to patch in the stream.


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
``PatchValues`` is used to patch the values of the selected
  fields for multiple events in the stream. Only the fields indicated in
  **selectExpression** are modified. The events to be modified are indicated
  by the index value of each member of the **items** collection. The
  individual events in **items** also hold the new values.

  **PatchValues** may be thought of as a series of PatchValue calls. If there
  is a problem patching any individual event, the entire operation is
  rolled back and the error will indicate the streamId and index of the
  problem.  


***********************


``RemoveValueAsync()``
----------------

Removes the event at the index from the specified stream. Different overloads are available to make it easier to indicate the index where you want to remove a data event. This method throws an exception if there is no data at the specified index.


**Syntax**

        Task RemoveValueAsync(string streamId, string index);
        Task RemoveValueAsync<T1>(string streamId, T1 index);
        Task RemoveValueAsync<T1, T2>(string streamId, Tuple<T1, T2> index);

**Http**

        DELETE api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/RemoveValue?index={index}


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``index``
  String representation of the index in the stream to be deleted.


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
Precision is taken into account when finding a value. If the index is a DateTime,
  use the round-trip format specifier: ``DateTime.ToString(“o”)``.  


***********************


``RemoveValuesAsync()``
----------------

Removes the event at each index from the specified stream. Different overloads are available to make it easier to indicate the index where you want to remove a data event. 


**Syntax**

        Task RemoveValuesAsync(string streamId, IEnumerable<string> index);
        Task RemoveValuesAsync<T1>(string streamId, IEnumerable<T1> index);
        Task RemoveValuesAsync<T1, T2>(string streamId, IEnumerable<Tuple<T1, T2>> index);

**Http**

        DELETE api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/RemoveValues?index={index}


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``index``
  List of indices at which to remove events in the stream


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
If any individual event fails to be removed, the entire RemoveValues
  operation is rolled back and no events are removed. The streamId and index
  that caused the issue are included in the error response. 

  If you attempt to remove events at indexes that have no events, an exception is thrown. If this occurs, you can use the ‘RemoveWindowValues’ call to remove any events from a specified ‘window’ of indexes, which will not throw exceptions if no data is found.


***********************


``RemoveWindowValuesAsync()``
----------------

Removes a range of values at and between the given indices.


**Syntax**

        Task RemoveWindowValuesAsync(string streamId, string startIndex, string endIndex);
        Task RemoveWindowValuesAsync<T1>(string streamId, T1 startIndex, T1 endIndex);
        Task RemoveWindowValuesAsync<T1, T2>(string streamId, Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex);


**Http**

        DELETE api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/RemoveWindowValues?startIndex={startIndex}&endIndex={endIndex}


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``startIndex``
  String representation of the starting index value.
``endIndex``
  String representation of the ending index value



**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
If any individual event fails to be removed, the entire operation is
  rolled back and no removes are done.


***********************  


``ReplaceValueAsync()``
----------------

Writes an item over an existing event in the specified stream.


**Syntax**

        Task ReplaceValueAsync<T>(string streamId, T item);

**Http**

        PUT api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/ReplaceValue

Content is serialized replacement object


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
Throws an exception if the stream does not have an event to be replaced at the
  specified index. Overloads are available to help you set the indexes you want removed.

***********************


``ReplaceValuesAsync()``
----------------

Writes **items** over existing events in the specified stream.


**Syntax**

        Task ReplaceValuesAsync<T>(string streamId, IList<T> items);

**Http**

        PUT api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/ReplaceValues

Content is serialized list of replacement values


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``T items``
  List of new items to replace existing items in the stream


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts


**Notes**  
Throws an exception if any index does not have a value to be replaced. If any individual event fails to be replaced, the entire operation is rolled back and no replaces are performed. The index (of the *items* IEnumerable) that caused the issue and the streamId are included in the error response.


***********************


``UpdateValueAsync()``
----------------

Writes **item** to the specified stream.


**Syntax**

        Task UpdateValueAsync<T>(string streamId, T item);

**Http**

        PUT api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/UpdateValue

Content is serialized updated value


**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``T item``
  Event to write to the stream


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

**Notes**  
``UpdateValue`` performs an insert or a replace depending on whether an event already exists at the index in the stream.


***********************

``UpdateValuesAsync()``
----------------

Writes items to the specified stream.


**Syntax**

        Task UpdateValuesAsync<T>(string streamId, IList<T> items);

**Http**

        PUT api/{tenantId}/{namespaceId}/Streams/{streamId}/Data/UpdateValues


Content is serialized list of updated values	

**Parameters**

``string tenantId``
  The tenant identifier for the request
``string namespaceId``
  The namespace identifier for the request.
``string streamId``
  The stream identifier for the request.
``T items``
  Events to write to the stream.


**Returns**  
An IEnumerable of all behavior objects

Security
  Allowed by administrator accounts

 **Notes**
  ``UpdateValues`` performs an insert
  or a replace depending on whether an event already exists at the item's
  indexes. If any item fails to write, the entire operation is rolled back and
  no events are written to the stream. The index (of the *items* IEnumerable) that caused the issue is
  included in the error response.
