---
uid: sdsReadingDataApi
---

API calls for reading data
===========================

Reading and writing data with the Qi Client Libraries is performed through the ``IQiDataService`` interface, which can be accessed with the ``QiService.GetDataService( )`` helper.



``Get Value``
--------------

Returns the value at the specified index. If no stored event exists at the specified index, the stream’s 
read characteristics determines how the returned event is calculated.


**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValue
            ?index={index}&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string index``
  The index
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.
  Consider a stream of type Simple with the default InterpolationMode of Continuous and 
  ExtrapolationMode of All. In the following request, the specified index matches an existing stored event:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValue 
         ?index=2017-11-23T13:00:00Z

The response will contain the event stored at the specified index:

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Time":"2017-11-23T13:00:00Z",
         "Measurement":10.0
      }

Note that State is not included in the JSON as its value is the default value.

The following request specifies an index for which no stored event exists:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValue 
          ?index=2017-11-23T13:30:00Z

Because the index is a valid type for interpolation and the stream type specifies a mode of interpolate, 
this request receives a response with an event interpolated at the specified index:

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Time":"2017-11-23T13:30:00Z",
         "Measurement":15.0
      }





**.NET Library**

      Task<T> GetValueAsync<T>(string streamId, string index, 
      string viewId = null);
      Task<T> GetValueAsync<T, T1>(string streamId, Tuple<T1> index, 
      string viewId = null);
      Task<T> GetValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
      string viewId = null);


**Security**

  Allowed for administrator and user accounts


***********************

``Get First Value``
--------------

Returns the first value in the stream. If no values exist in the stream, null is returned.


**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetFirstValue
            ?viewId={viewId}




**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.



**.NET Library**

      Task<T> GetFirstValueAsync<T>(string streamId, string viewId = null);



**Security**

  Allowed for administrator and user accounts


***********************

``Get Last Value``
--------------

Returns the last value in the stream. If no values exist in the stream, null is returned.


**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetLastValue
            ?viewId={viewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.


**.NET Library**

      Task<T> GetLastValueAsync<T>(string streamId, string viewId = null);


**Security**

  Allowed for administrator and user accounts


***********************

``Get Distinct Value``
---------------------

Returns the value at the specified index. If no value exists at the specified index, 
Get Distinct Value returns HTTP Status Code Not Found, 404.  The stream’s read characteristics 
do not affect Get Distinct Value.


**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetDistinctValue
            ?index={index}&viewId={viewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string index``
  The index
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.

  For a stream of type Simple, when making a Get Distinct Value request at an existing stored index: 

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        GetDistinctValue?index=2017-11-23T13:00:00Z 

The event at that index is returned in the response:

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Time":"2017-11-23T13:00:00Z",
         "Measurement":10.0
      }

Note that State is not included in the JSON as its value is the default value.

For a request at an index for which no stored event exists:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        GetDistinctValue?index=2017-11-23T13:30:00Z

No distinct value is found at the specified index, and an error response is returned:

**Response body**

      HTTP/1.1 404
      Content-Type: application/json

      {  
         "Message":"Resource not found" 
      }


**.NET Library**

      Task<T> GetDistinctValueAsync<T>(string streamId, string index, 
        string viewId = null);
      Task<T> GetDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, 
        string viewId = null);
      Task<T> GetDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
        string viewId = null);


**Security**

  Allowed for administrator and user accounts



***********************

``Find Distinct Value``
----------------------

Returns a stored event found based on the specified QiSearchMode and index. 


**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/FindDistinctValue
            ?index={index}&mode={mode}&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string index``
  The index
``string mode``
  The QiSearchMode
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.

For a stream of type Simple the following request, 

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          FindDistinctValue?index=2017-11-23T13:00:00Z&mode=Next

The request has an index that matches the index of an existing event, but because  
a QiSearchMode of ``next`` was specified, the response contains the next event in the stream after the 
specified index:

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      Formatted JSON Data
      {  
         "Time":"2017-11-23T14:00:00Z",
         "Measurement":20.0
      }


Note that State is not included in the JSON as its value is the default value.

For the following request,

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        FindDistinctValue?index=2017-11-23T13:30:00Z&mode=Next

The request specifies an index that does not match an index of an existing event. 
The next event in the stream is retrieved.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      Formatted JSON Data
      {  
         "Time":"2017-11-23T14:00:00Z",
         "Measurement":20.0
      }






**.NET Library**

      Task<T> FindDistinctValueAsync<T>(string streamId, string index, 
              QiSearchMode mode, string viewId = null);
      Task<T> FindDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, 
              QiSearchMode mode, string viewId = null);
      Task<T> FindDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
              QiSearchMode mode, string viewId = null);



**Security**

  Allowed for administrator and user accounts


***********************

``Get Values``
--------------

Returns a collection of values at indexes based on request parameters. 

As with the single event call to Get Value, the stream’s read characteristics determine how events 
are calculated for indexes at which no stored event exists.

Get Values supports three ways of specifying which events to return. 

* A range can be specified with a start index, end index, and count. This will return the specified 
  count of events evenly spaced from start index to end index.
* Multiple indexes can be passed to the request in order to retrieve events at exactly those indexes.
* A filtered request accepts a [Qi_Filter_expressions_topic](xref:sdsFilterExpressions#qifilterexpressionstopic) that limits results by applying an expression against 
  event fields. Filter expressions are explained in detail in the [Qi_Filter_expressions_topic](xref:sdsFilterExpressions#qifilterexpressionstopic) section.


**Request (Ranged)**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
          GetValues?startIndex={startIndex}&endIndex={endIndex}&count={count}&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string startIndex``
  The index defining the beginning of the range
``string endIndex``
  The index defining the end of the range  
``int count``
  The number of events to return. Read characteristics of the stream determine how the form of the event.
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request, 

      api/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
          ?startIndex=2017-11-23T13:00:00Z&endIndex=2017-11-23T15:00:00Z&count=3

For this request, the start and end fall exactly on event indexes and the number of events 
from start to end match the count of three (3).

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":30.0
         }
      ] 


Note that State is not included in the JSON as its value is the default value.


**.NET Library**

      Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, string startIndex, 
           string endIndex, int count, string viewId = null);
      Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, T1 startIndex, 
           T1 endIndex, int count, string viewId = null);
      Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>string streamId, Tuple<T1, T2> startIndex, 
           Tuple<T1, T2> endIndex, int count, string viewId = null);



**Security**

  Allowed for administrator and user accounts


**Request (Index collection)**

        GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
           GetValues?index={index}[&index={index} …]&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string index``
  One or more indexes of values to retrieve
``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request, 

      api/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
          ?index=2017-11-23T12:30:00Z&index=2017-11-23T13:00:00Z&index=2017-11-23T14:00:00Z

For this request, the response contains events for each of the three specified indexes.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T12:30:00Z",
            "Measurement":5.0
         },
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         }
      ] 


Note that State is not included in the JSON as its value is the default value.


**.NET Library**

      Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, IEnumerable<string> index, 
           string viewId = null);

      Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, IEnumerable<T1> index,
           string viewId = null);

      Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>(string streamId, 
           IEnumerable<Tuple< T1, T2>> index, string viewId = null);




**Security**

  Allowed for administrator and user accounts

**Request (Filtered)**

        GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
           GetValues?filter={filter}&viewId={viewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string filter``
  The filter expression (see [Qi_Filter_expressions_topic](xref:sdsFilterExpressions#qifilterexpressionstopic)) ``string viewId``
  Optional view identifier


**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request, 

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
          ?filter=Measurement gt 10

The events in the stream whose Measurement is less than or equal to 10 are not returned.


**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":30.0
         },
         {  
            "Time":"2017-11-23T16:00:00Z",
            "Measurement":40.0
         }
      ] 



Note that State is not included in the JSON as its value is the default value.


**.NET Library**

      Task<IEnumerable<T>> GetFilteredValuesAsync<T>(string streamId, string filter, 
          string viewId = null);



**Security**

  Allowed for administrator and user accounts




***********************

``Get Range Values``
--------------

Returns a collection of values as determined by a start index and count. 

Additional optional parameters specify the direction of the range, how to handle events near or 
at the start index, whether to skip a certain number of events at the start of the range, and 
how to filter the data.



**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetRangeValues 
            ?startIndex={startIndex}&count={count}&skip={skip}&reversed={reversed} 
            &boundaryType={boundaryType}&filter={filter}&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string startIndex``
  Index identifying the beginning of the series of events to return
``int count``
  The number of events to return
``int skip``
  Optional value specifying the number of events to skip at the beginning of the result
``bool reversed``
  Optional specification of the direction of the request. By default, range requests move forward 
  from startIndex, collecting events after startIndex from the stream. A reversed request will 
  collect events before startIndex from the stream.
``QiBoundaryType boundaryType``
  Optional QiBoundaryType specifies the handling of events at or near startIndex
``string filter``
  Optional filter expression
``string viewId``
  Optional view identifier




**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request will return a response with up to 100 events starting 
  at 13:00 and extending forward toward the end of the stream: 

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetRangeValues?startIndex=2017-11-23T13:00:00Z&count=100



**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":30.0
         },
         {  
           "Time":"2017-11-23T16:00:00Z",
            "Measurement":40.0
         }
      ] 


Note that State is not included in the JSON as its value is the default value.

To reverse the direction of the request, set reversed to true. This request will 
return up to 100 events starting at 13:00 and extending back toward the start of the stream:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetRangeValues?startIndex=2017-11-23T13:00:00Z&count=100&reversed=true



**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T12:00:00Z"
         }
      ] 

Note that State is not included in the JSON as its value is the default value. 
Further, Measurement is not include in the second, 12:00:00, event as zero is the default value for numbers.

The following request specifies a boundary type of Outside for a reversed-direction range request. 
The response will contain up to 100 events. The boundary type Outside indicates that up to one 
event outside the boundary will be included in the response. For a reverse direction range request, 
this means one event forward of the specified start index. In a default direction range request, 
it would mean one event before the specified start index.

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetRangeValues?startIndex=2017-11-23T13:00:00Z&count=100&reversed=true 
          &boundaryType=2

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T12:00:00Z"
         }
      ] 


The event outside of the index is the next event or the event at 14:00 because the 
request operates in reverse.

Note that State is not included in the JSON as its value is the default value. Further 
Measurement is not included in the last event as its value is default.

Adding a filter to the request means only events that meet the filter criteria are returned:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetRangeValues?startIndex=2017-11-23T13:00:00Z&count=100&reversed=true 
          &boundaryType=2&filter=Measurement gt 10

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
      ] 



**.NET Library**

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int count, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int count, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> 
          startIndex, int count, string viewId = null);

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int count, bool reversed, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int count, bool reversed, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, int count, bool reversed, string viewId = null);

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int count, QiBoundaryType boundaryType, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int count, QiBoundaryType boundaryType, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, int count, QiBoundaryType boundaryType, string viewId = null);

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int skip, int count, bool reversed, QiBoundaryType boundaryType, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int skip, int count, bool reversed, QiBoundaryType boundaryType, string viewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> 
          startIndex, int skip, int count, bool reversed, QiBoundaryType 
          boundaryType, string viewId = null);

      Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T>(string streamId, string startIndex, 
          int skip, int count, bool reversed, QiBoundaryType boundaryType, string filter, 
          string viewId = null);
      Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int skip, int count, bool reversed, QiBoundaryType boundaryType, string filter, 
          string viewId = null);
      Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, int skip, int count, bool reversed, QiBoundaryType boundaryType, 
          string filter, string viewId = null);



**Security**

  Allowed for administrator and user accounts


***********************

``Get Window Values``
--------------------

Get Window Values returns a collection of stored events based on specified start and end indexes. 
For handling events at and near the boundaries of the window, a single QiBoundaryType that applies 
to both the start and end indexes can be passed with the request, or separate boundary types may 
be passed for the start and end individually. 

Get Window Values also supports paging for large result sets. Results for paged requests are returned 
as a QiResultPage.


| Property          | Type                         | Details                                                  |
|-------------------|------------------------------|----------------------------------------------------------|
| Results           | IList                        | Collection of events of type T                           |
| ContinuationToken | String                       | The token used to retrieve the next page of data         |

To retrieve the next page of values, include the ContinuationToken from the results of the previous request. 
For the first request, specify a null or empty string for the ContinuationToken.


**Request**

      GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType} 
          &filter={filter}&count={count}&viewId={viewId}

      GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &viewId={viewId}

      GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType} 
          &filter={filter}&count={count}&continuationToken={continuationToken}&viewId={viewId}

      GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &continuationToken={continuationToken}&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string startIndex``
  Index bounding the beginning of the series of events to return
``string endIndex``
  Index bounding the end of the series of events to return
``int count``
  Optional maximum number of events to return
``QiBoundaryType boundaryType``
  Optional QiBoundaryType specifies handling of events at or near the start and end indexes
``QiBoundaryType startBoundaryType``
  Optional QiBoundaryType specifies the first value in the result in relation to the start index
``QiBoundaryType endBoundaryType``
  Optional QiBoundaryType specifies the last value in the result in relation to the end index
``string filter``
  Optional filter expression
``string viewId``
  Optional view identifier



**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following requests all stored events between 13:30 and 15:30: 

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetWindowValues?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z

The response will contain the event stored at the specified index:

**Response body**

      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":30.0
         }
      ] 


Note that State is not included in the JSON as its value is the default value.

When the request is modified to specify a boundary type of Outside, the value 
before 13:30 and the value after 15:30 are included:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetWindowValues?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z 
          &boundaryType=2


**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T12:00:00Z"
         },
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
           "Measurement":30.0
         },
         {  
            "Time":"2017-11-23T16:00:00Z",
            "Measurement":40.0
         }
      ] 

Note that State is not included in the JSON as its value is the default value. 
Further, Measurement is not include in the second, 12:00:00, event as zero is the default 
value for numbers.

If instead a start boundary of Inside, only values inside the start boundary (after 13:30) 
are included in the result. With an end boundary of Outside one value outside the end index 
(after 15:30) is included:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetWindowValues?startIndex=2017-11-23T12:30:00Z&&startBoundaryType=1 
          &endIndex=2017-11-23T15:30:00Z&endBoundaryType=2

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":10.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":20.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":30.0
         },
         {  
            "Time":"2017-11-23T16:00:00Z",
            "Measurement":40.0
         }
      ] 


Note that State is not included in the JSON as its value is the default value.

In order to page the results of the request, a continuation token may be specified. 
This requests the first page of the first two stored events between start index and 
end index by indicating count is 2 and continuationToken is an empty string:

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetWindowValues?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z 
          &count=2&continuationToken=

*Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Results":[  
            {  
               "Time":"2017-11-23T13:00:00Z",
               "Measurement":10.0
            },
            {  
               "Time":"2017-11-23T14:00:00Z",
               "Measurement":20.0
            }
         ],
         "ContinuationToken":"2017-11-23T14:00:00.0000000Z"
      } 


Note that State is not included in the JSON as its value is the default value.

This Get Window Values request uses the continuation token from the previous 
page to request the next page of stored events:

      api/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetWindowValues?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z 
          &count=2&continuationToken=2017-11-23T14:00:00Z


**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Results":[  
            {  
               "Time":"2017-11-23T15:00:00Z",
               "Measurement":30.0
            }
         ]
      } 


In this case, the results contain the final event. The returned continuation token is null 
(not shown because it null is the default value for a JSON string). 

Note that State is not included in the JSON as its value is the default value.



**.NET Library**

      Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
          string endIndex, string viewId = null);
      Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex,
          T1 endIndex, string viewId = null);
      Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, T
          uple<T1, T2> startIndex, Tuple<T1, T2> endIndex, string viewId = null);

      Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
          string endIndex, QiBoundaryType boundaryType, string viewId = null);
      Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
          T1 endIndex, QiBoundaryType boundaryType, string viewId = null);
      Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
      QiBoundaryType boundaryType, string viewId = null);

      Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
          string startIndex, string endIndex, QiBoundaryType boundaryType, 
          string filter, string viewId = null);
      Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
          T1 startIndex, T1 endIndex, QiBoundaryType boundaryType, string filter, string viewId = null);
      Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
          QiBoundaryType boundaryType, string filter, string viewId = null);

      Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
          string startIndex, QiBoundaryType startBoundaryType, string endIndex, 
          QiBoundaryType endBoundaryType, string filter, string viewId = null);
      Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId,
          T1 startIndex, QiBoundaryType startBoundaryType, 
          T1 endIndex, QiBoundaryType endBoundaryType, 
          string filter, string viewId = null);
      Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, QiBoundaryType startBoundaryType, 
          Tuple<T1, T2> endIndex, QiBoundaryType endBoundaryType, 
          string filter, string viewId = null);

      Task<QiResultPage<T>> GetWindowValuesAsync<T>(string streamId, string startIndex,
          string endIndex, QiBoundaryType boundaryType, int count, 
          string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
          T1 endIndex, QiBoundaryType boundaryType, int count, 
          string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
          QiBoundaryType boundaryType, int count, string continuationToken, 
          string viewId = null);

      Task<QiResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
          string startIndex, string endIndex, QiBoundaryType boundaryType, 
          string filter, int count, string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
          T1 startIndex, T1 endIndex, QiBoundaryType boundaryType, string filter, 
          int count, string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
          QiBoundaryType boundaryType, string filter, int count, 
          string continuationToken, string viewId = null);

      Task<QiResultPage<T>> GetWindowValuesAsync<T>(string streamId, 
          string startIndex, QiBoundaryType startBoundaryType, 
          string endIndex, QiBoundaryType endBoundaryType, 
          int count, string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, 
          T1 startIndex, QiBoundaryType startBoundaryType, 
          T1 endIndex, QiBoundaryType endBoundaryType, 
          int count, string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, QiBoundaryType startBoundaryType, 
          Tuple<T1, T2> endIndex, QiBoundaryType endBoundaryType, 
          int count, string continuationToken, string viewId = null);

      Task<QiResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
          string startIndex, QiBoundaryType startBoundaryType, 
          string endIndex, QiBoundaryType endBoundaryType, 
          string filter, int count, string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
          T1 startIndex, QiBoundaryType startBoundaryType, 
          T1 endIndex, QiBoundaryType endBoundaryType, 
          string filter, int count, string continuationToken, string viewId = null);
      Task<QiResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, QiBoundaryType startBoundaryType, 
          Tuple<T1, T2> endIndex, QiBoundaryType endBoundaryType, 
          string filter, int count, string continuationToken, string viewId = null);



**Security**

  Allowed for administrator and user accounts


***********************

``Get Intervals``
--------------

Returns summary intervals between a specified start and end index. 

Index types that cannot be interpolated do not 
support GetIntervals requests. Strings are an example of indexes that cannot be interpolated. The 
Get Intervals method does not support compound indexes. Interpolating between two indexes 
that consist of multiple properties is not defined and results in non-determinant behavior.

Results are returned as a collection of QiIntervals. Each QiInterval has a start, end, and collection of 
summary values.

| Property          | Type                         | Details                                                  |
|-------------------|------------------------------|----------------------------------------------------------|
| Start             | T                            | The start of the interval                                |
| End               | T                            | The end of the interval                                  |
| Summaries         | IDictionary<QiSummaryType,   | The summary values for the interval, keyed by            |
|                   | IDictionary<string, object>  | summary type. The nested dictionary contains             |
|                   | Summaries                    | property name keys and summary calculation result        |
|                   |                              | values.                                                  |


Summary values supported by QiSummaryType enum:

| Summary                                                        | Enumeration value            | 
|----------------------------------------------------------------|------------------------------|
| Count                                                          | 1                            |
| Minimum                                                        | 2                            |
| Maximum                                                        | 4                            |
| Range                                                          | 8                            |
| Mean                                                           | 16                           |
| StandardDeviation                                              | 64                           |
| Total                                                          | 128                          |
| Skewness                                                       | 256                          |
| Kurtosis                                                       | 512                          |
| WeightedMean                                                   | 1024                         |
| WeightedStandardDeviation                                      | 2048                         |
| WeightedPopulationStandardDeviatio                             | 4096                         |


**Request**

       GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetIntervals
           ?startIndex={startIndex}&endIndex={endIndex}&count={count}&filter={filter}&viewId={viewId}



**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamId``
  The stream identifier
``string startIndex``
  The start index for the intervals
``string endIndex``
  The end index for the intervals
``int count``
  The number of intervals requested
``string filter``
  Optional filter expression
``string viewId``
  Optional view identifier

**Response**

  The response includes a status code and a response body containing a serialized collection of QiIntervals.

For a stream of type Simple, the following requests calculates two summary intervals between the first 
and last events: 

      api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        GetIntervals?startIndex=2017-11-23T12:00:00Z&endIndex=2017-11-23T16:00:00Z&count=2



**Response body**

      [{
          "Start":{  
             "Time":"2017-11-24T20:00:00Z"
          },
          "End":{  
             "Time":"2017-11-24T22:00:00Z",
             "Measurement":20.0
          },
          "Summaries":{  
             "Count":{  
                "Measurement":2
             },
             "Minimum":{  
                "Measurement":0.0
             },
             "Maximum":{  
                "Measurement":20.0
             },
             "Range":{  
                "Measurement":20.0
             },
             "Total":{  
                "Measurement":20.0
             },
             "Mean":{  
                "Measurement":10.0
             },
             "StandardDeviation":{  
                "Measurement":7.0710678118654755
             },
             "PopulationStandardDeviation":{  
                "Measurement":5.0
             },
             "WeightedMean":{  
                "Measurement":10.0
             },
             "WeightedStandardDeviation":{  
                "Measurement":7.0710678118654755
             },
             "WeightedPopulationStandardDeviation":{  
                "Measurement":5.0
             },
             "Skewness":{  
                "Measurement":0.0
             },
             "Kurtosis":{  
                "Measurement":-2.0
             }
          }
       },
       {  
          "Start":{  
             "Time":"2017-11-24T22:00:00Z",
             "Measurement":20.0
          },
          "End":{  
             "Time":"2017-11-25T00:00:00Z",
             "Measurement":40.0
          },
          "Summaries":{  
             "Count":{  
                "Measurement":2
             },
             "Minimum":{  
                "Measurement":20.0
             },
             "Maximum":{  
                "Measurement":40.0
             },
             "Range":{  
                "Measurement":20.0
             },
             "Total":{  
                "Measurement":60.0
             },
             "Mean":{  
                "Measurement":30.0
             },
             "StandardDeviation":{  
                "Measurement":7.0710678118654755
             },
             "PopulationStandardDeviation":{  
                "Measurement":5.0
             },
             "WeightedMean":{  
                "Measurement":30.0
             },
             "WeightedStandardDeviation":{  
                "Measurement":7.0710678118654755
             },
             "WeightedPopulationStandardDeviation":{  
                "Measurement":5.0
             },
             "Skewness":{  
                "Measurement":0.0
             },
             "Kurtosis":{  
                "Measurement":-2.0
             }
          }
      }]



**.NET Library**

      Task<IEnumerable<QiInterval<T>>> GetIntervalsAsync<T>(string streamId, string 
          startIndex, string endIndex, int count, string viewId = null);

      Task<IEnumerable<QiInterval<T>>> GetIntervalsAsync<T, T1>(string streamId, T1 
          startIndex, T1 endIndex, int count, string viewId = null);

      Task<IEnumerable<QiInterval<T>>> GetIntervalsAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, int count, 
          string viewId = null);

      Task<IEnumerable<QiInterval<T>>> GetFilteredIntervalsAsync<T>(string streamId, 
          string startIndex, string endIndex, int count, string filter, 
          string viewId = null);

      Task<IEnumerable<QiInterval<T>>> GetFilteredIntervalsAsync<T, T1>(string streamId, 
          T1 startIndex, T1 endIndex, int count, string filter, 
          string viewId = null);

      Task<IEnumerable<QiInterval<T>>> GetFilteredIntervalsAsync<T, T1, T2>(string 
          streamId, Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, int count, 
          string filter, string viewId = null);



**Security**

  Allowed for administrator and user accounts


***********************
