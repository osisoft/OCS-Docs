---
uid: sdsReadingData
---

# Read data

The .NET and REST APIs provide programmatic access to read and write data. This section identifies and describes 
the APIs used to read [SdsStreams](xref:sdsStreams) data. Results are influenced by [SdsTypes](xref:sdsTypes), [SdsStreamViews](xref:sdsStreamViews), [filter expressions](xref:sdsFilterExpressions), and [table format](xref:sdsTableFormat).

If you are working in a .NET environment, convenient SDS Client Libraries are available. 
The `ISdsDataService` interface, which is accessed using the ``SdsService.GetDataService()`` helper, 
defines the functions that are available.

### Single stream reads  
The following methods for reading a single value are available:

* [Get First Value](xref:sdsReadingDataApi#get-first-value) returns the first value in the stream.
* [Get Last Value](xref:sdsReadingDataApi#get-last-value) returns the last value in the stream.
* [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value) returns a value based on a starting index and search criteria.

In addition, the following methods support reading multiple values:

* [Get Values](xref:sdsReadingDataApi#get-values) retrieves a collection of stored values based on the request parameters.
* [Get Interpolated Values](xref:sdsReadingDataApi#get-interpolated-values) retrieves a collection of stored or calculated values based on the request parameters.
* [Get Summaries](xref:sdsReadingDataApi#get-summaries) retrieves a collection of evenly spaced summary intervals based on a count 
  and specified start and end indexes.
* [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values) retrieves a collection of sampled data based on the request parameters.

All single stream reads are HTTP GET actions. Reading data involves getting events from streams. The base reading URI from a single stream is as follows:
 ```text
	api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
 ```

**Parameters**  

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

### Bulk reads   

SDS supports reading from multiple streams in one request. The following method for reading data from multiple streams is available:
* [Join Values](xref:sdsReadingDataApi#join-values) retrieves a collection of events across multiple streams and joins the results based on the request parameters.

Multi-stream reads can be HTTP GET or POST actions. The base reading URI for reading from multiple streams is as follows:
 ```text
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data
 ```

**Parameters**  
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier


### Response format

Supported response formats include JSON, verbose JSON, and SDS. 

The default response format for SDS is JSON, which is used in all examples in this document. Default JSON responses do not include any values that are equal to the default value for their type.

Verbose JSON responses include all values, including defaults, in the returned JSON payload. To specify verbose JSON return, add the header ``Accept-Verbosity`` with a value of ``verbose`` to the request.  

To specify SDS format, set the ``Accept`` header in the request to ``application/sds``.

### Indexes and reading data

Most read operations take at least one index as a parameter. Indexes may be specified as strings, or 
using the SDS Client libraries, the index may be passed as-is to read methods that take the index 
type as a generic argument. For more information, see [Indexes](xref:sdsIndexes). For information on compound indexes, see [Compound indexes](xref:sdsIndexes#compound-indexes).


### Read characteristics

When data is requested at an index for which no stored event exists, the read characteristics determine 
whether the result is an error, no event, interpolated event, or extrapolated event. The combination of 
the type of the index and the interpolation and extrapolation modes of the SdsType and the SdsStream 
determine the read characteristics.

**\*Notes:** Use the ISO 8601 representation of dates and times in SDS, `2020-02-20T08:30:00-08:00` for February 20, 2020 at 8:30 AM PST, for example.
SDS returns timestamps in UTC if the timestamp is of property `DateTime` and in local time if it is of `DateTimeOffset`. 

### Interpolation

Interpolation determines how a stream behaves when asked to return an event at an index between 
two existing events. InterpolationMode determines how the returned event is constructed. SDS provides 
multiple ways to set the interpolation mode to get the desired behavior. The table 
below lists InterpolationModes:

|Mode                       |Enumeration value |Operation |
|---------------------------|------------------|----------|
|Default                    |0                 |The default InterpolationMode is Continuous |
|Continuous                 |0                 |Returns interpolated data using previous and next index values |
|StepwiseContinuousLeading  |1                 |Returns the data from the previous index  |
|StepwiseContinuousTrailing |2                 |Returns the data from the next index |
|Discrete                   |3                 |No event is returned |
|ContinuousNullableLeading  |4                 |Returns interpolated data or data from the previous index if either of the surrounding indexes has a null value|
|ContinuousNullableTrailing |5                 |Returns interpolated data or data from the trailing index if either of the surrounding indexes has a null value|

Note that `Continuous` cannot return values for type properties that cannot be interpolated, such as when the type property is not numeric. 

The table below describes how the **Continuous InterpolationMode** affects
properties that occur between data in a stream:
**InterpolationMode = Continuous or Default**

| Property Type             | Result for a property for an index between data in a stream  | Comment |
|---------------------------|--------------------------------------------------------------|---------|
|Numeric Types              |Interpolated*                   |Rounding is done as needed for integer types |
|Time-related Types         |Interpolated                    |DateTime, DateTimeOffset, TimeSpan |
|Nullable Types             |Interpolated**                  |Limited support for nullable numeric types |
|Array and List Types       |Default value                   |         |
|String Type                |Default value                   |         |
|Boolean Type               |Returns value of nearest index  |         |
|Enumeration Types          |Returns Enum value at 0         |This may have a value for the enumeration |
|GUID                       |Default value                   |         |
|Version                    |Default value                   |         |
|IDictionary or IEnumerable |Default value                   |Dictionary, Array, List, and so on. |
|Empty Type		|Not supported                  	 | |
|Object Type 		|Not supported                   	| |


*When extreme values are involved in an interpolation (for example
Decimal.MaxValue) the call might result in a BadRequest exception.

\**For the `Continuous` interpolation mode, Nullable types are interpolated in the same manner as their non-nulllable equivalents as long as the values surrounding the desired interpolation index are non-null. If either of the values are null, the interpolated value will be null.

If the InterpolationMode is not assigned, the events are interpolated in the default manner, unless the interpolation 
mode is overridden in the SdsTypeProperty or the SdsStream. For more information on overriding the interpolation mode 
on a specific type property see [SdsTypeProperty](xref:sdsTypes#sdstypeproperty). For more information on overriding the interpolation mode for a specific stream see [Sds Streams](xref:sdsStreams).

### Extrapolation

Extrapolation defines how a stream responds to requests with indexes that precede or follow all 
data in the steam. ExtrapolationMode acts as a master switch to determine whether extrapolation 
occurs and at which end of the data. 

ExtrapolationMode works with the InterpolationMode to determine how a stream responds. The following tables 
show how ExtrapolationMode affects returned values for each InterpolationMode value:

**ExtrapolationMode with InterpolationMode = Default (or Continuous), StepwiseContinuousLeading, and StepwiseContinuousTrailing**

| ExtrapolationMode   | Enumeration value   | Index before data          | Index after data          |
|---------------------|---------------------|----------------------------|---------------------------|
| All                 | 0                   | Returns first data value   | Returns last data value   |
| None                | 1                   | No event is returned       | No event is returned      |
| Forward             | 2                   | No event is returned       | Returns last data value   |
| Backward            | 3                   | Returns first data value   | No event is returned      |

**ExtrapolationMode with InterpolationMode = Discrete**

| ExtrapolationMode   | Enumeration value   | Index before data   | Index after data    |
|---------------------|---------------------|---------------------|---------------------|
| All                 | 0                   | No event is returned| No event is returned|
| None                | 1                   | No event is returned| No event is returned|
| Forward             | 2                   | No event is returned| No event is returned|
| Backward            | 3                   | No event is returned| No event is returned|

**ExtrapolationMode with InterpolationMode = ContinuousNullableLeading and ContinuousNullableTrailing**

| ExtrapolationMode   | Enumeration value   | Index before data          | Index after data          |
|---------------------|---------------------|----------------------------|---------------------------|
| All                 | 0                   | Returns the default value         | Returns the default value   |
| None                | 1                   | No event is returned       | No event is returned      |
| Forward             | 2                   | No event is returned       | Returns the default value value   |
| Backward            | 3                   | Returns the default value         | No event is returned      |

For additional information about the effect of read characteristics, see the
documentation on the [read method](xref:sdsReadingDataApi)
you are using.


### Filter expressions

Filter expressions can be applied to any read that returns multiple values, including Get Values, Get Range Values, 
Get Window Values, and Get Intervals. The filter expression is applied to the collection events conditionally 
filtering events that do not meet the filter conditions.

Filter expressions are covered in detail in the [Filter expressions](xref:sdsFilterExpressions) section.

### Table format

Results of a query can be organized into tables by directing the form parameter to return a table. 
Two forms of table are available: table and header table.

When the form parameter is specified as table, ``?form=table``, events are returned in row column form. 
Results include a collection named ``Columns`` that lists column name and type and a collection named 
``Rows`` containing a collection of rows matching the order of the columns.

Specifying a form of type ``table-headers``, ``?form=tableh``, results in a collection where the Rows collection 
contains a column header list.

Table formats are covered in detail in the [Table format](xref:sdsTableFormat) section.

### SdsBoundaryType

The `SdsBoundaryType` enum defines how data on the boundary of queries is handled: around the start index for range value queries, 
and around the start and end index for window values. The following are valid values for `SdsBoundaryType`:

| Boundary | Enumeration value | Operation |
| -------  | ----------------- | --------- |
| Exact    | 0                 | Results include the event at the specified index boundary if a stored event exists at that index. |
| Inside   | 1                 | Results include only events within the index boundaries |
| Outside  | 2                 | Results include up to one event that falls immediately outside of the specified index boundary. |
| ExactOrCalculated | 3        | Results include the event at the specified index boundary. If no stored event exists at that index, one is calculated based on the index type and interpolation and extrapolation settings. |

### SdsSearchMode

The `SdsSearchMode` enum defines search behavior when seeking a stored event near a specified index. The following are valid values for `SdsSearchMode`:

| Mode  | Enumeration value | Operation |
| ----- | ----------------- | --------- |
| Exact | 0                 | If a stored event exists at the specified index, that event is returned. Otherwise no event is returned. |
| ExactOrNext | 1           | If a stored event exists at the specified index, that event is returned. Otherwise the next event in the stream is returned. |
| Next | 2                  | Returns the stored event after the specified index. |
| ExactOrPrevious | 3       | If a stored event exists at the specified index, that event is returned. Otherwise the previous event in the stream is returned. |
| Previous | 4              | Returns the stored event before the specified index. |


*****

## Transforming data

SDS provides the ability to transform data upon reads. The supported data transformations are:
* [Reading with SdsStreamViews](#reading-with-sdsstreamviews): Changing the shape of the returned data
* [Unit of Measure Conversions](#unit-conversion-of-data): Converting the unit of measure of the data  

Data transformations are supported for all single stream reads, but transformations have specific endpoints. The following are the base URIs for the tranformation endpoints:
```text
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Last
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Interpolated
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Summaries
    api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Sampled
```

### Reading with SdsStreamViews
When transforming data with an SdsStreamView, the data read is converted to the *target type* specified in the SdsStreamView. Working with stream views is covered in detail in the [Stream Views](xref:sdsStreamViews) section.

All stream view transformations are HTTP GET requests. Specify the stream view ID (`streamViewId={streamViewId}`) at the end of the transformation endpoint in the request as shown below. For example, the following request returns the first event of the stream *transformed* to the target type (per stream view definition specified by `streamViewId`):
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First?streamViewId={streamViewId}
 ```



All single stream data reads support stream view transformations.

When data is requested with an SdsStreamView, the read characteristics defined by the *target type* of the SdsStreamView 
determine what is returned. The read characteristics are discussed in the code samples.


### Unit conversion of data
SDS supports assigning [Units of Measure](xref:unitsOfMeasure) (UOM) to stream data. If stream data has UOM information associated, SDS supports reading data with unit conversions applied. On each read data request, unit conversions are specified by a user defined collection of `SdsStreamPropertyOverride` objects in read requests. The `SdsStreamPropertyOverride` object has the following structure:

| Property          | Type                 | Optionality | Details                                               |
| ----------------- | -------------------- | ----------- | ----------------------------------------------------  |
| SdsTypePropertyId | String               | Required    | Identifier for an SdsTypeProperty with a UOM assigned |
| Uom               | String               | Required    | Target unit of measure                                |
| InterpolationMode | SdsInterpolationMode | N/A         | Currently not supported in context of data reads      |

This is supported in the .NET client libraries methods via overloads that accept a collection of `SdsStreamPropertyOverride` objects, and in the REST API via HTTP POST calls with a request body containing a collection of `SdsStreamPropertyOverride` objects.  

All unit conversions are POST HTTP requests. The unit conversion transformation URI is as follows:
 ```text
    POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
 ```

**Request body**  
The Request Body contains a collection of `SdsStreamPropertyOverride` objects. 

The following code defines a `Simple Type` with one index, `Time`, and one additional property, `Measurement`. `Measurement` has an assigned unit of measure, meter.

```csharp
public class SimpleType
{
   [SdsMember(IsKey = true, Order = 0) ]
   public DateTime Time { get; set; }
   [SdsMember(Uom = "meter")]
   public Double Measurement { get; set; }
}
```

This type is assigned to a stream, and the example request body below requests SDS to convert the `Measurement` property of the returned data from meter to centimeter.

```json
[
  {
    "SdsTypePropertyId" : "Measurement",
    "Uom" : "centimeter" 
  }
]
```

All single stream data reads with streams that have specified UOMs support UOM conversions.

***********************
