---
uid: sdsWritingData
---

Writing data
============

The Sds REST APIs provide programmatic access to read and write Sds data. This section describes 
the APIs used to write SdsStream data.

When working in .NET, convenient Sds Client libraries are available. The ``ISdsDataServiceinterface``, accessed using the
``SdsService.GetDataService( )`` helper, defines the available functions.

All writes rely on a stream’s key or primary index. Preexisting values and positioning within the stream 
is determined exclusively by the primary index. Secondary indexes are updated, but they do not contribute 
to the request. All references to indexes are to the primary index.

The following single value write methods are available:

* **Insert Value** inserts a value at the specified primary index. 
* **Patch Value** updates specific fields in an existing value identified by the primary index.
* **Replace Value** replaces the value at the specified primary index.
* **Update Value** replaces the value with matching primary index. If no value exists the value is added.
* **Remove Value** deletes the value at the specified primary index.


The following support writing multiple values:

* **Insert Values** inserts a collection of values.
* **Patch Values** updates specific fields for a collection of values.
* **Replace Values** replaces a collection of values.
* **Update Values** replaces or adds a collection of values.
* **Remove Values** deletes the values at the specified primary indexes.
* **Remove Window Values** removes values that fall within the window defined by the start and end primary indexes.


The base URI for writing Sds data is:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data

**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier


Response Format
---------------

Supported response formats include JSON, verbose JSON, and Sds. 

The default response format for reading data is JSON, which is used in all examples in this document. 
Default JSON responses do not include any values that are equal to the default value for their type.

Verbose JSON responses include all values in the returned JSON payload, including defaults.
To specify verbose JSON return, add the header ``Accept-Verbosity`` with a value of ``verbose`` to the request. 

Verbose has no impact on writes; writes return only error messages.

To specify Sds format, set the ``Accept`` header in the request to ``application/Sds``.

Indexes
-------

Sds writes rely on the primary index for positioning within streams and locating existing events. 
Most writes use the index as specified by the value. Deletes are the exception to this rule. When deleting, 
indexes are specified as strings in the URI, or, when using the Sds Client libraries, the index may be 
passed as-is to delete methods that take the index type as a generic argument. More details about working 
with indexes can be found on the [Indexes](xref:sdsIndexes) page. 

To specify compound indexes in the URI, specify each field that composes the index, in the specified order, 
separated by the pipe character, ‘|’.

Examples
--------

Many of the API methods described below contain sample JSON. 

When specifying a parameter of type ``enum``, the API accepts both the name of the field and the numeric 
value of the field. Samples vary to highlight enum flexibility.

Samples use the following types:

* Type with a simple index, named *Simple*:

**.NET**


      public enum State 
      {
        Ok,
        Warning,
        Alarm
      }

      public class Simple
      {
        [SdsMember(IsKey = true, Order = 0) ] 
        public DateTime Time { get; set; }
        public State State { get; set; }
        public Double Measurement { get; set; }
      }

**Python**


      class State(Enum):
        Ok = 0
        Warning = 1
        Alarm = 2

      class Simple(object):
        Time = property(getTime, setTime)
        def getTime(self):
          return self.__time
        def setTime(self, time):
          self.__time = time

        State = property(getState, setState)
        def getState(self):
          return self.__state
        def setState(self, state):
          self.__state = state

        Measurement = property(getValue, setValue)
        def getValue(self):
          return self.__measurement
        def setValue(self, measurement):
          self.__measurement = measurement

**JavaScript**


      var State =
      {
        Ok: 0,
        Warning: 1,
        Aalrm: 2,
      }

      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }


The values produced by the above code is as follows:


      11/23/2017 12:00:00 PM: Ok  0
      11/23/2017  1:00:00 PM: Ok 10
      11/23/2017  2:00:00 PM: Ok 20
      11/23/2017  3:00:00 PM: Ok 30
      11/23/2017  4:00:00 PM: Ok 40

* Type with Compound Index, named DerivedCompoundIndex

.NET


      public class Simple
      {
        [SdsMember(IsKey = true, Order = 0)]
        public DateTime Time { get; set; }
        public State State { get; set; }
        public Double Measurement { get; set; }
      }

      public class DerivedCompoundIndex : Simple
      {
        [SdsMember(IsKey = true, Order = 1)]
        public DateTime Recorded { get; set; }
      }

Python


      class Simple(object):
      # First-order Key property
      Time = property(getTime, setTime)
      def getTime(self):
        return self.__time
      def setTime(self, time):
        self.__time = time

      State = property(getState, setState)
      def getState(self):
        return self.__state
      def setState(self, state):
        self.__state = state

      Measurement = property(getValue, setValue)
      def getValue(self):
        return self.__measurement
      def setValue(self, measurement):
        self.__measurement = measurement

      class DerivedCompoundIndex(Simple):
      # Second-order Key property
      @property
      def Recorded(self):
        return self.__recorded
       @Recorded.setter
      def Recorded(self, recorded):
        self.__recorded = recorded

JavaScript


      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }

      var DerivedCompoundIndex = function() {
        Simple.call(this);
        this.Recorded = null;
      }

Has values as follows:


      1/20/2017 1:00:00 AM : 1/20/2017 12:00:00 AM 	0
      1/20/2017 1:00:00 AM : 1/20/2017  1:00:00 AM 	2
      1/20/2017 1:00:00 AM : 1/20/2017  2:00:00 PM 	5
      1/20/2017 2:00:00 AM : 1/20/2017 12:00:00 AM 	1
      1/20/2017 2:00:00 AM : 1/20/2017  1:00:00 AM 	3
      1/20/2017 2:00:00 AM : 1/20/2017  2:00:00 AM 	4
      1/20/2017 2:00:00 AM : 1/20/2017  2:00:00 PM 	6

All times are represented at offset 0, GMT.


***********************

``Insert value``
----------------

Inserts an event into the specified stream. If an event already exists at the specified primary index, 
the insert operation fails, and returns HTTP status code Conflict, 409.


**Request**

        POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/InsertValue


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier

The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.

A sample of serialized Simple type content is shown here:


      {  
         "Time":"2017-11-23T12:00:00Z",
         "State":0,
         "Measurement":1000.0
      }



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**


      Task InsertValueAsync<T>(string streamId, T item);


**Security**

  Allowed for administrator accounts.


***********************

``Patch value``
----------------

Updates fields in an event. Use the select parameter to specify the fields to update. If there is 
not an event with a matching primary index, the patch operation fails and returns HTTP status code Not Found, 404.


**Request**


        PATCH api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
              PatchValue?select={select}

**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string select``
  Comma-separated list of fields to update


The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.

A sample of serialized Simple type content is shown here:


      {  
        "Time":"2017-11-23T12:00:00Z",
        "State":”Warning”,
        "Measurement":500.0
      }

To update the state field to Warning, set the index to ``state``. To update the state to Warning 
and the measurement to 500, set the index to ``state,measurement``.

**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.


**.NET Library**

      Task PatchValueAsync<T>(string streamId, string select, T item);


**Security**

  Allowed for administrator accounts.


***********************

``Replace value``
----------------

Replaces an existing event with an event with matching primary index. If there is not an event with a 
matching index, the replace operation fails and returns HTTP status code Not Found, 404.


**Request**

        PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ReplaceValue


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier

The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.

A sample of serialized Simple type content is shown here:


      {  
        "Time":"2017-11-23T12:00:00Z",
        "State":0,
        "Measurement":1000.0
      }




**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

      Task ReplaceValueAsync<T>(string streamId, T item);


**Security**

  Allowed for administrator accounts.


***********************

``Update value``
----------------

Replaces an existing event with an event that has a matching primary index. If there is not an event with 
a matching index, the event is inserted.


**Request**

        PUT	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/UpdateValue


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier

The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.

A sample of serialized Simple type content is shown here:


      {  
         "Time":"2017-11-23T12:00:00Z",
         "State":0,
         "Measurement":1000.0
      }



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.


**.NET Library**

      Task UpdateValueAsync<T>(string streamId, T item);


**Security**

  Allowed for administrator accounts.


***********************

``Remove value``
----------------

Removes an event that matches a primary index. If there is not an event with a matching index, 
the remove operation fails and returns HTTP status code Not Found, 404.


**Request**

        DELETE api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
             RemoveValue?index={index}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string index``
  The primary index identifying the event


**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

      Task RemoveValueAsync(string streamId, string index);
      Task RemoveValueAsync<T1>(string streamId, T1 index);
      Task RemoveValueAsync<T1, T2>(string streamId, Tuple<T1, T1> index);


**Security**

  Allowed for administrator accounts.


***********************

``Insert values``
----------------

Inserts a collection of events into the specified stream. If an event exists at the same primary 
index as any of the values, the insert operation fails and returns HTTP status code Conflict, 409.


**Request**

        POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/InsertValues


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier

The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.

A sample of serialized Simple type content is shown here:


      [  
        {  
           "Time":"2017-11-23T12:00:00Z",
           "State":0,
           "Measurement":0.0
        },
        {  
           "Time":"2017-11-23T13:00:00Z",
           "State":0,
           "Measurement":10.0
        },
        {  
           "Time":"2017-11-23T14:00:00Z",
           "State":0,
           "Measurement":20.0
        },
        {  
           "Time":"2017-11-23T15:00:00Z",
           "State":0,
           "Measurement":30.0
        },
        {  
           "Time":"2017-11-23T16:00:00Z",
           "State":0,
           "Measurement":40.0
        }
      ]



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

       Task InsertValuesAsyncs<T>(string streamId, IList<T> items);


**Security**

  Allowed for administrator accounts.


***********************

``Patch values``
----------------

Updates fields for a collection of events in the specified stream. If there is not an event with 
a matching index, the patch operation fails and returns HTTP status code Not Found, 404.


**Request**

        POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/PatchValues 
             ?select={select}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string select``
  Comma separated list of fields to update


The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.

To patch the State of the sample stream shown previously, a URI resembles the following:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{simpleStream.Id}/ 
          Data/PatchValues?select=state


A sample of serialized Simple type content is shown here:


      [  
        {  
           "Time":"2017-11-23T12:00:00Z",
           "State":1
        },
        {  
           "Time":"2017-11-23T13:00:00Z",
           "State":1
        },
        {  
           "Time":"2017-11-23T14:00:00Z",
           "State":1
        },
        {  
           "Time":"2017-11-23T15:00:00Z",
           "State":1
        }
      ]



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

       Task PatchValuesAsync<T>(string streamId, string select, IList<T> items);


**Security**

  Allowed for administrator accounts.


***********************


``Replace values``
----------------

Replaces a collection of events with events that match primary indexes. If there is not an event with a 
matching index, the replace operation fails and returns HTTP status code Not Found, 404.


**Request**

       PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ReplaceValues



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier

The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

       Task ReplaceValuesAsync<T>(string streamId, IList<T> items);


**Security**

  Allowed for administrator accounts.


***********************


``Update values``
----------------

Replaces a collection of events with events that contain matching primary indexes. If there is not a collectin of events with a 
matching index, the events are inserted.


**Request**

        PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/UpdateValues


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier

The request content is the serialized object matching the stream type. If you are not 
using the Sds client libraries, using JSON is recommended.



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

       Task UpdateValuesAsync<T>(string streamId, T item);

**Security**

  Allowed for administrator accounts.


***********************


``Remove values``
----------------

Removes events at matching primary indexes. If there is not an event with a matching index, 
the remove operation fails and returns HTTP status code Not Found, 404.


**Request**

        DELETE api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
               RemoveValues?index={index}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string index``
  The collection of indexes identifying the events

Each index is treated like a separate parameter. For example, to delete three events, the URI 
should resebble the following:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
           RemoveValues?index=2017-01-20T01:00:00Z|2017-01-20T00:00:00Z
           &index=2017-01-20T01:00:00Z|2017-01-20T01:00:00Z
           &index=2017-01-20T01:00:00Z|2017-01-20T14:00:00Z



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

       Task RemoveValuesAsync(string streamId, IEnumerable<string>> index);
       Task RemoveValuesAsync<T1>(string streamId, IEnumerable<T1> index);
       Task RemoveValuesAsync<T1, T2>(string streamId, IEnumerable<Tuple<T1, T1>> index);



**Security**

  Allowed for administrator accounts.


***********************


``Remove window values``
----------------------

Removes events that fall within a window defined by start and end primary indexes. Events that fall 
at the start or end index are also deleted. 


**Request**

        DELETE api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
               RemoveWindowValues?startIndex={startIndex}&endIndex={endIndex}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string startIndex``
  Index defining the beginning of the window
``string endIndex``
  The Index defining the end of the window



**Response**

  The response includes a status code. On error, the response body contains a serialized description of the error.



**.NET Library**

       Task RemoveWindowValuesAsync (string streamId, string startIndex, string endIndex);
       Task RemoveWindowValuesAsync <T1>(string streamId, T1 startIndex, T1 endIndex);
       Task RemoveWindowValuesAsync <T1, T2>(string streamId, Tuple<T1, T1> startIndex, Tuple<T1, T1>endIndex);



**Security**

  Allowed for administrator accounts.


***********************
