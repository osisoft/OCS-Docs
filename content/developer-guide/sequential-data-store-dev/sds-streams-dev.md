---
uid: sdsStreams
---

# Streams

Streams are a container for sequential data of some type of sequentially occurring values indexed by a single property, typically time series data. You define streams to organize incoming data from another system into OCS.
To define a stream, you must first define a type, which defines the structure of the data you want to stream into a selected namespace.

SDS stores collections of events and provides convenient ways to find and associate events.
Events of consistent structure are stored in streams. Streams are referenced by their identifier or `Id` field.
Stream identifiers must be unique within a namespace.

A stream must include a `TypeId` that references the identifier of an existing type.
Stream management using the .NET SDS client libraries is performed through `ISdsMetadataService`.
Create the `ISdsMetadataService`, using one of the ``SdsService.GetMetadataService()`` factory methods.

The following table shows the required and optional stream fields. Fields not listed are reserved
for internal SDS use.

<a name="streampropertiestable"></a>
| Property          | Type                             | Optionality | Searchable | Details |
|-------------------|----------------------------------|-------------|------------|---------|
| Id                | String                           | Required    | Yes		  | An identifier for referencing the stream |
| TypeId            | String                           | Required    | Yes		  | The SdsType identifier of the type to be used for this stream |
| Name              | String                           | Optional    | Yes		  | Friendly name |
| Description       | String                           | Optional    | Yes		  | Description text |
| Indexes           | IList\<SdsStreamIndex\>            | Optional    | No		  | Used to define secondary indexes for stream |
| InterpolationMode | SdsInterpolationMode             | Optional    | No		  | Interpolation setting of the stream. Default is null. |
| ExtrapolationMode | SdsExtrapolationMode             | Optional    | No		  | Extrapolation setting of the stream. Default is null. |
| PropertyOverrides | IList\<SdsStreamPropertyOverride\> | Optional    | No		  | Used to define unit of measure and interpolation mode overrides for a stream. |
| [Tags](xref:sds-streams-tags)*		| IList\<String\>					| Optional    | Yes		  | A list of tags denoting special attributes or categories.|
| [Metadata](xref:sds-streams-metadata)*	| IDictionary\<String, String\>	| Optional    | Yes		  | A dictionary of string keys and associated string values.  |

> [!NOTE]
> You can access stream metadata and tags through Metadata API and Tags API respectively.
> Because they are associated with SdsStream objects, you can use them as search criteria.

**Rules for the stream identifier (SdsStream.Id)**
1. Is not case sensitive
2. Cannot just be whitespace
3. Cannot contain leading or trailing whitespace
4. Cannot contain forward slash ("/")
5. Can contain a maximum of 100 characters

## Streams API
[Streams API](xref:sds-streams)

## Indexes
While you define the primary index on the type, the stream is where you define secondary indexes.
If the primary index defined on the type is a compound index, secondary indexes on the stream are allowed as long as that compound index does not have more than two properties. For more information on compound indexes, see [Indexes](xref:sdsIndexes#compound-indexes). 
<!-- Secondary indexes apply to a single property. In other words, there are no compound secondary indexes.-->

Note that you can only use the SdsTypeCodes of type properties that can be ordered (``DateTime`` or numbers, for example) as a secondary index.

## Interpolation and extrapolation
The `InterpolationMode`, `ExtrapolationMode`, and [SdsStreamPropertyOverride object](#sdsstreampropertyoverride) can be used to determine how a specific stream reads data.
These read characteristics are inherited from the type if they are not defined at the stream level.


## SdsStreamPropertyOverride
``SdsStreamPropertyOverride`` object provides a way to override interpolation behavior and unit of measure for individual 
SdsType Properties for a specific SdsStream.

The ``SdsStreamPropertyOverride`` object has the following structure:

| Property          | Type                 | Optionality | Details |
|-------------------|----------------------|-------------|---------|
| SdsTypePropertyId | String               | Required    | SdsTypeProperty identifier |
| InterpolationMode | SdsInterpolationMode | Optional    | Interpolation setting. Default is null |
| Uom               | String               | Optional    | Unit of measure |


The unit of measure can be overridden for any SdsTypeProperty defined by the stream type, including primary 
and secondary indexes. For more information on SdsTypeProperty `Uom`, see [Types](xref:sdsTypes#sdstypeproperty). 

Read characteristics of the stream are determined by the type and the `PropertyOverride` of the stream.
The interpolation mode for non-index properties can be defined and overridden at the stream level.
For more information about type read characteristics see [Types](xref:sdsTypes#sdstypeproperty).

If `InterpolationMode` of the type is set to ``Discrete``, it cannot be overridden 
at any level. When `InterpolationMode` is set to ``Discrete`` and an event is not defined for the index,
a null value is returned for the entire event.


