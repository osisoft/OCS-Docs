---
uid: sdsReadingDataApi
---
# API calls for reading data
Reading and writing data with the Sds Client Libraries is performed through the ``ISdsDataService`` interface, which can be accessed with the ``SdsService.GetDataService( )`` helper.
***********************

## Sample Types
Many of the API methods described below contain sample JSON and sample code. 

When specifying a parameter of type enum, the API accepts both the name of the field and the numeric value of the field. 
Samples vary to highlight enum flexibility.

Samples use the following types:

### Type with a simple index, named *Simple*:

#### .NET
```csharp
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
        [SdsMember(Uom = "meter")]
        public Double Measurement { get; set; }
      }
```
#### Python
```python
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
```
#### JavaScript
```javascript
      var State =
      {
        Ok: 0,
        Warning: 1,
        Alarm: 2,
      }

      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }
```
Has values as follows:

      11/23/2017 12:00:00 PM: Ok  0
      11/23/2017  1:00:00 PM: Ok 10
      11/23/2017  2:00:00 PM: Ok 20
      11/23/2017  3:00:00 PM: Ok 30
      11/23/2017  4:00:00 PM: Ok 40

### Type with Compound Index, named ``DerivedCompoundIndex``

#### .NET
```csharp
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
```
#### Python
```python
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
```
#### JavaScript
```javascript
      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }

      var DerivedCompoundIndex = function() {
        Simple.call(this);
        this.Recorded = null;
      }
```
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

## ``Get Value``

Get Value supports two ways to retrieve an event:
* [Standard](#getvaluestandard): Returns the value at the specified index. If no stored event exists at the specified index, the stream’s read characteristics determines how the returned event is calculated.
* [Uom Conversion](#getvalueuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information 

<a name="getvaluestandard"></a>

### Request (Standard) 

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValue
         ?index={index}&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
The index

``string streamViewId``  
Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.
  Consider a stream of type Simple with the default InterpolationMode of Continuous and 
  ExtrapolationMode of All. In the following request, the specified index matches an existing stored event:

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValue 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValue 
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
      string streamViewId = null);
      Task<T> GetValueAsync<T, T1>(string streamId, Tuple<T1> index, 
      string streamViewId = null);
      Task<T> GetValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
      string streamViewId = null);

<a name="getvalueuomconversion"></a>

### Request (Uom Conversion)

        POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValue
            ?index={index}&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
The index

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized event similar to the standard request above (without Uom conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Time":"2017-11-23T13:00:00Z",
         "Measurement":1000.0 
      }

**.NET Library**

      Task<T> GetValueAsync<T>(string streamId, string index, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<T> GetValueAsync<T, T1>(string streamId, Tuple<T1> index, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<T> GetValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

***********************

## ``Get First Value``
Get First Value supports two ways to retrieve an event:

* [Standard](#getfirstvaluestandard): Returns the first value in the stream. If no values exist in the stream, null is returned.
* [Uom Conversion](#getfirstvalueuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information

<a name="getfirstvaluestandard"></a>
### Request (Standard)

        GET	api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetFirstValue
            ?streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string streamViewId``  
Optional stream view identifier

**Response**

  The response includes a status code and a response body containing a serialized event.

**.NET Library**

      Task<T> GetFirstValueAsync<T>(string streamId, string streamViewId = null);

<a name="getfirstvalueuomconversion"></a>
### Request (Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetFirstValue
         ?streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

  The response includes a status code and a response body containing a serialized event with unit conversions applied.

**.NET Library**

      Task<T> GetFirstValueAsync<T>(string streamId, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

***********************

## ``Get Last Value``

Get Last Value supports two ways to retrieve an event:
* [Standard](#getlastvaluestandard): Returns the last value in the stream. If no values exist in the stream, null is returned.
* [Uom Conversion](#getlastvalueuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information

<a name="getlastvaluestandard"></a>
### Request (Standard)
        GET	api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetLastValue
            ?streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier 

``string streamId``  
The stream identifier

``string streamViewId``  
Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.


**.NET Library**

      Task<T> GetLastValueAsync<T>(string streamId, string streamViewId = null);

<a name="getlastvalueuomconversion"></a>
### Request (Uom Conversion)
      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetLastValue
            ?streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier 

``string streamId``  
The stream identifier

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and a response body containing a serialized event with unit conversions applied.

**.NET Library**
```csharp
   Task<T> GetLastValueAsync<T>(string streamId, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
```
***********************

## ``Get Distinct Value``

Get Distinct Value supports two ways to retrieve an event:
* [Standard](#getdistinctvaluestandard): Returns the value at the specified index. If no value exists at the specified index, 
Get Distinct Value returns HTTP Status Code Not Found, 404.  The stream’s read characteristics 
do not affect Get Distinct Value.
* [Uom Conversion](#getdistinctvalueuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information

<a name="getdistinctvaluestandard"></a>
### Request (Standard)

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetDistinctValue
         ?index={index}&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
  The tenant identifier

``string namespaceId``  
  The namespace identifier

``string streamId``  
  The stream identifier

``string index``  
  The index

``string streamViewId``  
  Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.

  For a stream of type Simple, when making a Get Distinct Value request at an existing stored index: 

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetDistinctValue?index=2017-11-23T13:00:00Z 

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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        GetDistinctValue?index=2017-11-23T13:30:00Z

No distinct value is found at the specified index, and an error response is returned:

**Response body**

      HTTP/1.1 404
      Content-Type: application/json

      {  
         "Message":"Resource not found" 
      }


**.NET Library**
```csharp
   Task<T> GetDistinctValueAsync<T>(string streamId, string index, 
      string streamViewId = null);
   Task<T> GetDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, 
      string streamViewId = null);
   Task<T> GetDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
      string streamViewId = null);
```

<a name="getdistinctvalueuomconversion"></a>
### Request (Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetDistinctValue
         ?index={index}&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
  The tenant identifier

``string namespaceId``  
  The namespace identifier

``string streamId``  
  The stream identifier

``string index``  
  The index

``string streamViewId``  
  Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized event similar to the standard request above (without Uom conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the Measurement property of the event.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Time":"2017-11-23T13:00:00Z",
         "Measurement":1000.0
      }

**.NET Library**
```csharp
   Task<T> GetDistinctValueAsync<T>(string streamId, string index, IList<SdsStreamPropertyOverride> propertyOverrides,
      string streamViewId = null);
   Task<T> GetDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, IList<SdsStreamPropertyOverride> propertyOverrides,
      string streamViewId = null);
   Task<T> GetDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, IList<SdsStreamPropertyOverride> propertyOverrides,
      string streamViewId = null);
```
***********************

## ``Find Distinct Value``
Get Last Value supports two ways to retrieve an event:
* [Standard](#finddistinctvaluestandard): Returns a stored event found based on the specified SdsSearchMode and index. 
* [Uom Conversion](#finddistinctvalueuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information

<a name="finddistinctvaluestandard"></a>
### Request (Standard)

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/FindDistinctValue
         ?index={index}&mode={mode}&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
The index

``string mode``  
The SdsSearchMode

``string streamViewId``  
Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized event.

For a stream of type Simple the following request, 

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          FindDistinctValue?index=2017-11-23T13:00:00Z&mode=Next

The request has an index that matches the index of an existing event, but because  
a SdsSearchMode of ``next`` was specified, the response contains the next event in the stream after the 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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
```csharp
   Task<T> FindDistinctValueAsync<T>(string streamId, string index, 
            SdsSearchMode mode, string streamViewId = null);
   Task<T> FindDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, 
            SdsSearchMode mode, string streamViewId = null);
   Task<T> FindDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
            SdsSearchMode mode, string streamViewId = null);
```
<a name="finddistinctvalueuomconversion"></a>
### Request (Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/FindDistinctValue
         ?index={index}&mode={mode}&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
The index

``string mode``  
The SdsSearchMode

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized event similar to the standard request above (without Uom conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.

**Response body**
      
      HTTP/1.1 200
      Content-Type: application/json

      Formatted JSON Data
      {  
         "Time":"2017-11-23T14:00:00Z",
         "Measurement":2000.0
      }


**.NET Library**

```csharp
   Task<T> FindDistinctValueAsync<T>(string streamId, string index, IList<SdsStreamPropertyOverride> propertyOverrides,
            SdsSearchMode mode, string streamViewId = null);
   Task<T> FindDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, IList<SdsStreamPropertyOverride> propertyOverrides,
            SdsSearchMode mode, string streamViewId = null);
   Task<T> FindDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, IList<SdsStreamPropertyOverride> propertyOverrides,
            SdsSearchMode mode, string streamViewId = null);
```

***********************

``Get Values``
--------------

Returns a collection of values at indexes based on request parameters. 

As with the single event call to Get Value, the stream’s read characteristics determine how events 
are calculated for indexes at which no stored event exists.

Get Values supports six ways of specifying which events to return. 

* [Ranged](#getvaluesrangedstandard): A range can be specified with a start index, end index, and count. This will return the specified 
  count of events evenly spaced from start index to end index.
* [Index Collection](#getvaluesindexcollectionstandard): Multiple indexes can be passed to the request in order to retrieve events at exactly those indexes.
* [Filtered](#getvaluesfilteredstandard): A filtered request accepts a [filter expression](xref:sdsFilterExpressions) that limits results by applying an expression against 
  event fields. Filter expressions are explained in detail in the [Filter expressions](xref:sdsFilterExpressions) section.
* [Ranged with Uom Conversion](#getvaluesrangeduomconversion): Same as Ranged, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information
* [Index Collection with Uom Conversion](#getvaluesindexcollectionuomconversion): Same as Index Collection, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information
* [Filtered with Uom Conversion](#getvaluesfiltereduomconversion): Same as Filtered, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. Note that the filter is applied *before* any unit conversions. See [Units of Measure](xref:unitsOfMeasure) for additional information

<a name="getvaluesrangedstandard"></a>
### Request (Ranged)

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
      ?startIndex={startIndex}&endIndex={endIndex}&count={count}&streamViewId={streamViewId}

**Request Parameters**

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

``string streamViewId``  
Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request, 

      api/v1-preview/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
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
```csharp
      Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, string startIndex, 
           string endIndex, int count, string streamViewId = null);
      Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, T1 startIndex, 
           T1 endIndex, int count, string streamViewId = null);
      Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>string streamId, Tuple<T1, T2> startIndex, 
           Tuple<T1, T2> endIndex, int count, string streamViewId = null);
```

<a name="getvaluesindexcollectionstandard"></a>
### Request (Index collection)

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
      ?index={index}[&index={index} …]&streamViewId={streamViewId}

**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
One or more indexes of values to retrieve

``string streamViewId``  
Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request, 

      api/v1-preview/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
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
```csharp
   Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, IEnumerable<string> index, 
         string streamViewId = null);

   Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, IEnumerable<T1> index,
         string streamViewId = null);

   Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>(string streamId, 
         IEnumerable<Tuple< T1, T2>> index, string streamViewId = null);
```

<a name="getvaluesfilteredstandard"></a>
### Request (Filtered)

        GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
           GetValues?filter={filter}&streamViewId={streamViewId}



**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string filter``  
The filter expression (see [Filter expressions](xref:sdsFilterExpressions))

``string streamViewId``  
Optional stream view identifier


**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request, 

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
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
```csharp
   Task<IEnumerable<T>> GetFilteredValuesAsync<T>(string streamId, string filter, 
         string streamViewId = null);
```

<a name="getvaluesrangeduomconversion"></a>
### Request (Ranged with Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
      ?startIndex={startIndex}&endIndex={endIndex}&count={count}&streamViewId={streamViewId}


**Request Parameters**

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

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":1000.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":2000.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":3000.0
         }
      ] 

**.NET Library**
```csharp
   Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, string startIndex, 
         string endIndex, int count, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, T1 startIndex, 
         T1 endIndex, int count, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>string streamId, Tuple<T1, T2> startIndex, 
         Tuple<T1, T2> endIndex, int count, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
```

<a name="getvaluesindexcollectionuomconversion"></a>
### Request (Index collection with Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
      ?index={index}[&index={index} …]&streamViewId={streamViewId}


**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
One or more indexes of values to retrieve

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T12:30:00Z",
            "Measurement":500.0
         },
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":1000.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":2000.0
         }
      ] 

**.NET Library**
```csharp
   Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, IEnumerable<string> index, IList<SdsStreamPropertyOverride> propertyOverrides,
         string streamViewId = null);

   Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, IEnumerable<T1> index, IList<SdsStreamPropertyOverride> propertyOverrides,
         string streamViewId = null);

   Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>(string streamId, 
         IEnumerable<Tuple< T1, T2>> index, string streamViewId = null);
```

<a name="getvaluesfiltereduomconversion"></a>
### Request (Filtered with Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
      ?filter={filter}&streamViewId={streamViewId}


**Request Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string filter``  
The filter expression (see [Filter expressions](xref:sdsFilterExpressions))

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event. Note that the filter expression is applied to values *before* unit conversion.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":2000.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":3000.0
         },
         {  
            "Time":"2017-11-23T16:00:00Z",
            "Measurement":4000.0
         }
      ] 

**.NET Library**
```csharp
      Task<IEnumerable<T>> GetFilteredValuesAsync<T>(string streamId, string filter, IList<SdsStreamPropertyOverride> propertyOverrides,
          string streamViewId = null);
```
***********************

## ``Get Range Values``
Get Range Values supports two ways to retrieve events:
* [Standard](#getrangevaluesstandard): Returns a collection of values as determined by a start index and count. Additional optional parameters specify the direction of the range, how to handle events near or at the start index, whether to skip a certain number of events at the start of the range, and how to filter the data.
* [Uom Conversion](#getrangevaluesuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information 

<a name="getrangevaluesstandard"></a>
### Request (Standard)

      GET	api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetRangeValues
         ?startIndex={startIndex}&count={count}&skip={skip}&reversed={reversed} 
         &boundaryType={boundaryType}&filter={filter}&streamViewId={streamViewId}

**Request Parameters**

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

``SdsBoundaryType boundaryType``  
Optional SdsBoundaryType specifies the handling of events at or near startIndex

``string filter``  
Optional filter expression

``string streamViewId``  
Optional stream view identifier

**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following request will return a response with up to 100 events starting 
  at 13:00 and extending forward toward the end of the stream: 

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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
```csharp
   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
         int count, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
         int count, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> 
         startIndex, int count, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
         int count, bool reversed, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
         int count, bool reversed, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, int count, bool reversed, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
         int count, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
         int count, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, int count, SdsBoundaryType boundaryType, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> 
         startIndex, int skip, int count, bool reversed, SdsBoundaryType 
         boundaryType, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T>(string streamId, string startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, 
         string streamViewId = null);
   Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1>(string streamId, T1 startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, 
         string streamViewId = null);
   Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, int skip, int count, bool reversed, SdsBoundaryType boundaryType, 
         string filter, string streamViewId = null);
```
<a name="getrangevaluesuomconversion"></a>
### Request (Unit Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetRangeValues 
         ?startIndex={startIndex}&count={count}&skip={skip}&reversed={reversed} 
         &boundaryType={boundaryType}&filter={filter}&streamViewId={streamViewId}

**Request Parameters**

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

``SdsBoundaryType boundaryType``  
Optional SdsBoundaryType specifies the handling of events at or near startIndex

``string filter``  
Optional filter expression

``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.

**Response body**

      HTTP/1.1 200
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":1000.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":2000.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":3000.0
         },
         {  
           "Time":"2017-11-23T16:00:00Z",
            "Measurement":4000.0
         }
      ] 

**.NET Library**
```csharp
      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex,
          int count, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int count, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> 
          startIndex, int count, string streamViewId = null);

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int count, bool reversed, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int count, bool reversed, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, int count, bool reversed, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int count, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int count, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, int count, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

      Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
      Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> 
          startIndex, int skip, int count, bool reversed, SdsBoundaryType 
          boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

      Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T>(string streamId, string startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, IList<SdsStreamPropertyOverride> propertyOverrides,
          string streamViewId = null);
      Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1>(string streamId, T1 startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, IList<SdsStreamPropertyOverride> propertyOverrides,
          string streamViewId = null);
      Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, int skip, int count, bool reversed, SdsBoundaryType boundaryType, 
          string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
```
***********************

## ``Get Window Values``
Get Window Values supports two ways of retrieving events:
* [Standard](#getwindowvaluesstandard): Get Window Values returns a collection of stored events based on specified start and end indexes. 
For handling events at and near the boundaries of the window, a single SdsBoundaryType that applies 
to both the start and end indexes can be passed with the request, or separate boundary types may 
be passed for the start and end individually. 
* [Uom Conversion](#getwindowvaluesuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  [Units of Measure](xref:unitsOfMeasure) for additional information

Get Window Values also supports paging for large result sets. Results for paged requests are returned 
as a SdsResultPage.


| Property          | Type   | Details                                          |
| ----------------- | ------ | ------------------------------------------------ |
| Results           | IList  | Collection of events of type T                   |
| ContinuationToken | String | The token used to retrieve the next page of data |

To retrieve the next page of values, include the ContinuationToken from the results of the previous request. 
For the first request, specify a null or empty string for the ContinuationToken.

<a name="getwindowvaluesstandard"></a>
### Request (Standard)

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType} 
          &filter={filter}&count={count}&streamViewId={streamViewId}

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &streamViewId={streamViewId}

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType} 
          &filter={filter}&count={count}&continuationToken={continuationToken}&streamViewId={streamViewId}

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &continuationToken={continuationToken}&streamViewId={streamViewId}



**Request Parameters**

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

``SdsBoundaryType boundaryType``  
Optional SdsBoundaryType specifies handling of events at or near the start and end indexes

``SdsBoundaryType startBoundaryType``  
Optional SdsBoundaryType specifies the first value in the result in relation to the start index

``SdsBoundaryType endBoundaryType``  
  Optional SdsBoundaryType specifies the last value in the result in relation to the end index

``string filter``  
  Optional filter expression

``string streamViewId``  
  Optional stream view identifier



**Response**

  The response includes a status code and a response body containing a serialized collection of events.

  For a stream of type Simple, the following requests all stored events between 13:30 and 15:30: 

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
          GetWindowValues?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z

The response will contain the event stored at the specified index:

**Response body**
```json
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
```

Note that State is not included in the JSON as its value is the default value.

When the request is modified to specify a boundary type of Outside, the value 
before 13:30 and the value after 15:30 are included:

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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

      api/v1-preview/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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
```csharp
   Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
         string endIndex, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex,
         T1 endIndex, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, T
         uple<T1, T2> startIndex, Tuple<T1, T2> endIndex, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
         string endIndex, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
   SdsBoundaryType boundaryType, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, string viestreamViewIdwId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
         SdsBoundaryType boundaryType, string filter, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
         SdsBoundaryType endBoundaryType, string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId,
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
         Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
         string filter, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowValuesAsync<T>(string streamId, string startIndex,
         string endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
         SdsBoundaryType boundaryType, int count, string continuationToken, 
         string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, 
         int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
         SdsBoundaryType boundaryType, string filter, int count, 
         string continuationToken, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowValuesAsync<T>(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
         Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
         Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, string streamViewId = null);
```

<a name="getwindowvaluesuomconversion"></a>
### Request (Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType} 
          &filter={filter}&count={count}&streamViewId={streamViewId}

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &streamViewId={streamViewId}

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType} 
          &filter={filter}&count={count}&continuationToken={continuationToken}&streamViewId={streamViewId}

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &continuationToken={continuationToken}&streamViewId={streamViewId}


**Request Parameters**

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

``SdsBoundaryType boundaryType``  
Optional SdsBoundaryType specifies handling of events at or near the start and end indexes

``SdsBoundaryType startBoundaryType``  
Optional SdsBoundaryType specifies the first value in the result in relation to the start index

``SdsBoundaryType endBoundaryType``  
  Optional SdsBoundaryType specifies the last value in the result in relation to the end index

``string filter``  
  Optional filter expression

``string streamViewId``  
  Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.


**Response body**
```json
      Content-Type: application/json

      [  
         {  
            "Time":"2017-11-23T13:00:00Z",
            "Measurement":1000.0
         },
         {  
            "Time":"2017-11-23T14:00:00Z",
            "Measurement":2000.0
         },
         {  
            "Time":"2017-11-23T15:00:00Z",
            "Measurement":3000.0
         }
      ] 
```

**.NET Library**
```csharp
   Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
         string endIndex, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex,
         T1 endIndex, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, T
         uple<T1, T2> startIndex, Tuple<T1, T2> endIndex, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
         string endIndex, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
   SdsBoundaryType boundaryType, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
         SdsBoundaryType boundaryType, string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
         SdsBoundaryType endBoundaryType, string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId,
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
         Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
         string filter, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowValuesAsync<T>(string streamId, string startIndex,
         string endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
         SdsBoundaryType boundaryType, int count, string continuationToken,  IList<SdsStreamPropertyOverride> propertyOverrides,
         string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, 
         int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
         SdsBoundaryType boundaryType, string filter, int count, 
         string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowValuesAsync<T>(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
         Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
         Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, IList<SdsStreamPropertyOverride> propertyOverrides, string streamViewId = null);
```
***********************

## ``Get Intervals``
Get Intervals supports two ways to retrieve events:
* [Standard](#getintervalsstandard): Returns summary intervals between a specified start and end index. 
* [Uom Conversion](#getintervalsuomconversion): Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See [Units of Measure](xref:unitsOfMeasure) for additional information 
  
Index types that cannot be interpolated do not 
support GetIntervals requests. Strings are an example of indexes that cannot be interpolated. The 
Get Intervals method does not support compound indexes. Interpolating between two indexes 
that consist of multiple properties is not defined and results in non-determinant behavior.

Results are returned as a collection of SdsIntervals. Each SdsInterval has a start, end, and collection of 
summary values.

| Property  | Type                        | Details                                           |
| --------- | --------------------------- | ------------------------------------------------- |
| Start     | T                           | The start of the interval                         |
| End       | T                           | The end of the interval                           |
| Summaries | IDictionary<SdsSummaryType, | The summary values for the interval, keyed by     |
|           | IDictionary<string, object> | summary type. The nested dictionary contains      |
|           | Summaries                   | property name keys and summary calculation result |
|           |                             | values.                                           |


Summary values supported by SdsSummaryType enum:

| Summary                            | Enumeration value |
| ---------------------------------- | ----------------- |
| Count                              | 1                 |
| Minimum                            | 2                 |
| Maximum                            | 4                 |
| Range                              | 8                 |
| Mean                               | 16                |
| StandardDeviation                  | 64                |
| Total                              | 128               |
| Skewness                           | 256               |
| Kurtosis                           | 512               |
| WeightedMean                       | 1024              |
| WeightedStandardDeviation          | 2048              |
| WeightedPopulationStandardDeviatio | 4096              |

<a name="getintervalsstandard"></a>
### Request (Standard)

      GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetIntervals
         ?startIndex={startIndex}&endIndex={endIndex}&count={count}&filter={filter}&streamViewId={streamViewId}

**Request Parameters**

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
  
``string streamViewId``  
Optional stream view identifier

**Response**

  The response includes a status code and a response body containing a serialized collection of SdsIntervals.

For a stream of type Simple, the following requests calculates two summary intervals between the first 
and last events: 

      api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
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
```csharp
   Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T>(string streamId, string 
         startIndex, string endIndex, int count, string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T, T1>(string streamId, T1 
         startIndex, T1 endIndex, int count, string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T, T1, T2>(string streamId, 
         Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, int count, 
         string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T>(string streamId, 
         string startIndex, string endIndex, int count, string filter, 
         string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T, T1>(string streamId, 
         T1 startIndex, T1 endIndex, int count, string filter, 
         string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T, T1, T2>(string 
         streamId, Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, int count, 
         string filter, string streamViewId = null);
```
<a name="getintervalsuomconversion"></a>
### Request (Uom Conversion)

      POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetIntervals
         ?startIndex={startIndex}&endIndex={endIndex}&count={count}&filter={filter}&streamViewId={streamViewId}

**Request Parameters**

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
  
``string streamViewId``  
Optional stream view identifier

**Request Body**

The Request Body contains a collection of `SdsStreamPropertyOverride` objects. The example request body below requests Sds convert the `Measurement` property of the returned data from meter to centimeter.
```json
    [
      {
        "SdsTypePropertyId" : "Measurement",
        "Uom" : "centimeter" 
      }
    ]
```

**Response**

The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the `Measurement` property of the event.

**Response body**

      [{
          "Start":{  
             "Time":"2017-11-24T20:00:00Z"
          },
          "End":{  
             "Time":"2017-11-24T22:00:00Z",
             "Measurement":2000.0
          },
          "Summaries":{  
             "Count":{  
                "Measurement":2
             },
             "Minimum":{  
                "Measurement":0.0
             },
             "Maximum":{  
                "Measurement":2000.0
             },
             "Range":{  
                "Measurement":2000.0
             },
             "Total":{  
                "Measurement":2000.0
             },
             "Mean":{  
                "Measurement":1000.0
             },
             "StandardDeviation":{  
                "Measurement":707.10678118654755
             },
             "PopulationStandardDeviation":{  
                "Measurement":500.0
             },
             "WeightedMean":{  
                "Measurement":1000.0
             },
             "WeightedStandardDeviation":{  
                "Measurement":707.10678118654755
             },
             "WeightedPopulationStandardDeviation":{  
                "Measurement":500.0
             },
             "Skewness":{  
                "Measurement":000.0
             },
             "Kurtosis":{  
                "Measurement":-200.0
             }
          }
       },
       {  
          "Start":{  
             "Time":"2017-11-24T22:00:00Z",
             "Measurement":2000.0
          },
          "End":{  
             "Time":"2017-11-25T00:00:00Z",
             "Measurement":4000.0
          },
          "Summaries":{  
             "Count":{  
                "Measurement":2
             },
             "Minimum":{  
                "Measurement":2000.0
             },
             "Maximum":{  
                "Measurement":4000.0
             },
             "Range":{  
                "Measurement":2000.0
             },
             "Total":{  
                "Measurement":6000.0
             },
             "Mean":{  
                "Measurement":3000.0
             },
             "StandardDeviation":{  
                "Measurement":707.10678118654755
             },
             "PopulationStandardDeviation":{  
                "Measurement":500.0
             },
             "WeightedMean":{  
                "Measurement":3000.0
             },
             "WeightedStandardDeviation":{  
                "Measurement":707.10678118654755
             },
             "WeightedPopulationStandardDeviation":{  
                "Measurement":500.0
             },
             "Skewness":{  
                "Measurement":0.0
             },
             "Kurtosis":{  
                "Measurement":-200.0
             }
          }
      }]



**.NET Library**

      Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T>(string streamId, string 
          startIndex, string endIndex, int count, string streamViewId = null);

      Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T, T1>(string streamId, T1 
          startIndex, T1 endIndex, int count, string streamViewId = null);

      Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T, T1, T2>(string streamId, 
          Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, int count, 
          string streamViewId = null);

      Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T>(string streamId, 
          string startIndex, string endIndex, int count, string filter, 
          string streamViewId = null);

      Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T, T1>(string streamId, 
          T1 startIndex, T1 endIndex, int count, string filter, 
          string streamViewId = null);

      Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T, T1, T2>(string 
          streamId, Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, int count, 
          string filter, string streamViewId = null);

***********************
