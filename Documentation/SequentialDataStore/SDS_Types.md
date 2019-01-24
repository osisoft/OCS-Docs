---
uid: sdsTypes
---

Types
=====

The Sequential Data Store (SDS) stores streams of events and provides convenient ways to find and associate 
events. Events are stored in streams, called SdsStreams. An SdsType defines the shape or structure of the 
event and how to associate events within the SdsStream.




SdsTypes can define simple atomic types, such as integers, floats, strings, arrays, and dictionaries, or 
they can define complex types using SdsTypes. You can define complex, nested types using the Properties 
collection of an SdsType. 

An SdsType used to define an SdsStream must have a Key. A Key is a Property, or a combination of Properties 
that constitute an ordered, unique identity. The Key is ordered, so it functions as an index; it is 
known as the Primary Index. While a timestamp (DateTime) is a very common type of Key, any type that 
can be ordered is permitted. Other indexes (secondary indexes), are defined in the SdsStream. 
Indexes are discussed in greater detail here: [Indexes](xref:sdsIndexes)

When defining a type, consider how the events will be represented in a stream. The SdsType defines 
each event in the stream. An event is a single unit whose properties have values that relate to the 
index; that is, each property of an SdsType event is related to the event’s index. Each event is a single unit.

An SdsType is referenced by its identifier or Id field. SdsType identifiers must be unique within a Namespace.

SdsTypes define how events are associated and read within a collection of events, or SdsStream. The read 
characteristics when attempting to read non-existent indexes, indexes that fall between, before or after 
existing indexes, are determined by the interpolation and extrapolation settings of the SdsType. For more 
information about read characteristics see  Interpolation_ and Extrapolation_.

SdsTypes are mostly immutable. When an SdsType is referenced by a stream or a stream view, its form  cannot be changed. 
Certain fields, such as the friendly name or description, can be changed because they do not affect the function 
of the SdsType. In addition, the SdsType may be deleted only if no streams or stream views reference it.

Only SdsTypes used to define SdsStreams or SdsStreamViews are required to be added to the Sequential data store. 
SdsTypes that define Properties or base types are contained within the parent SdsType and are not required
to be added to the Data Store independently.

The following table shows the required and optional SdsType fields. Fields that are not included are reserved for internal SDS use.


| Property          | Type                   | Optionality | Details |
|-------------------|------------------------|-------------|---------|
| Id                | String                 | Required    | Identifier for referencing the type |
| Name              | String                 | Optional    | Friendly name |
| Description       | String                 | Optional    | Description text |
| SdsTypeCode       | SdsTypeCode            | Required    | Numeric code identifying the base SdsType |
| InterpolationMode | SdsInterpolationMode   | Optional    | Interpolation setting of the type. Default is Continuous. |
| ExtrapolationMode | SdsExtrapolationMode   | Optional    | Extrapolation setting of the type. Default is All. |
| Properties        | IList<SdsTypeProperty> | Required    | List of SdsTypeProperty items |





**Rules for typeId**

1. Is not case sensitive
2. Can contain spaces
3. Cannot begin with two underscores ("\_\_")
4. Cannot contain forward slash or backslash characters ("/" or "\\")
5. Can contain a maximum of 100 characters
6. Cannot start or end with a period.
7. Cannot contain consecutive periods.
8. Cannot consist of only periods.

SdsType management using the .NET SDS Client Libraries is performed through the ``ISdsMetadataService``. 
You can create the ``ISdsMetadataService`` using one of the ``SdsService.GetMetadataService()`` factory methods.

The .NET libraries provide SdsTypeBuilder to help build SdsTypes from .NET types. SdsTypeBuilder is 
discussed in greater detail below.


SdsTypeCode
-----------

The SdsTypeCode is a numeric identifier used by the Data Store to identify SdsTypes. A SdsTypeCode exists for 
every supported type.

Atomic types, such as strings, floats and arrays, are defined entirely by the SdsTypeCode. Atomic 
types do not need fields to define the type.

Types requiring additional definition, such as enums and objects, are identified using a generic 
SdsTypeCode, such as ByteEnum, Int32Enum, NullableInt32Enum, or Object, plus additional SdsProperty fields.


**Supported Types**


The following types are supported and defined by the SdsTypeCode:


Type                    | SdsTypeCode
----------------------- | -----
Array                   | 400
Boolean                 | 3
BooleanArray            | 203
Byte                    | 6
ByteArray               | 206
ByteEnum                | 606
Char                    | 4
CharArray               | 204
DateTime                | 16
DateTimeArray           | 216
DateTimeOffset          | 20
DateTimeOffsetArray     | 220
DBNull                  | 2
Decimal                 | 15
DecimalArray            | 215
Double                  | 14
DoubleArray             | 214
Empty                   | 0
Guid                    | 19
GuidArray               | 219
IDictionary             | 402
IEnumerable             | 403
IList                   | 401
Int16                   | 7
Int16Array              | 207
Int16Enum               | 607
Int32                   | 9
Int32Array              | 209
Int32Enum               | 609
Int64                   | 11
Int64Array              | 211
Int64Enum               | 611
NullableBoolean         | 103
NullableByte            | 106
NullableByteEnum        | 706
NullableChar            | 104
NullableDateTime        | 116
NullableDateTimeOffset  | 120
NullableDecimal         | 115
NullableDouble          | 114
NullableGuid            | 119
NullableInt16           | 107
NullableInt16Enum       | 707
NullableInt32           | 109
NullableInt32Enum       | 709
NullableInt64           | 111
NullableInt64Enum       | 711
NullableSByte           | 105
NullableSByteEnum       | 705
NullableSingle          | 113
NullableTimeSpan        | 121
NullableUInt16          | 108
NullableUInt16Enum      | 708
NullableUInt32          | 110
NullableUInt32Enum      | 710
NullableUInt64          | 112
NullableUInt64Enum      | 712
Object                  | 1
SdsColumn               | 510
SdsObject               | 512
SdsStream               | 507
SdsStreamIndex          | 508
SdsTable                | 509
SdsType                 | 501
SdsTypeProperty         | 502
SdsValues               | 511
SdsStreamView           | 503
SdsStreamViewMap        | 505
SdsStreamViewMapProperty| 506
SdsStreamViewProperty   | 504
SByte                   | 5
SByteArray              | 205
SByteEnum               | 605
Single                  | 13
SingleArray             | 213
String                  | 18
StringArray             | 218
TimeSpan                | 21
TimeSpanArray           | 221
UInt16                  | 8
UInt16Array             | 208
UInt16Enum              | 608
UInt32                  | 10
UInt32Array             | 210
UInt32Enum              | 610
UInt64                  | 12
UInt64Array             | 212
UInt64Enum              | 612
Version                 | 22
VersionArray            | 222


Interpolation
-------------

Interpolation determines how a stream behaves when asked to return an event at an index between 
two existing events. InterpolationMode determines how the returned event is constructed. The table 
below lists InterpolationModes:

|Mode                       |Enumeration value |Operation |
|---------------------------|------------------|----------|
|Default                    |0                 |The default InterpolationMode is Continuous |
|Continuous                 |0                 |Interpolates the data using previous and next index values | 
|StepwiseContinuousLeading  |1                 |Returns the data from the previous index  |
|StepwiseContinuousTrailing |2                 |Returns the data from the next index |
|Discrete                   |3                 |Returns ‘null’ |

Note that ``Continuous`` cannot return events for values that cannot be interpolated, such as when the type is not numeric.

The table below describes how the **Continuous InterpolationMode** affects
indexes that occur between data in a stream:

**InterpolationMode = Continuous or Default**

| Type                      | Result for an index between data in a stream  | Comment |
|---------------------------|-----------------------------------------------|---------|
|Numeric Types              |Interpolated*                                  |Rounding is done as needed for integer types |
|Time related Types         |Interpolated                                   |DateTime, DateTimeOffset, TimeSpan |
|Nullable Types             |Returns ‘null’                                 |Cannot reliably interpolate due to possibility of a null value |
|Array and List Types       |Returns ‘null’                                 |         |
|String Type                |Returns ‘null’                                 |         |
|Boolean Type               |Returns value of nearest index                 |         |
|Enumeration Types          |Returns Enum value at 0                        |This may have a value for the enumeration |
|GUID                       |                                               |         |
|Version                    |Returns ‘null’                                 |         |
|IDictionary or IEnumerable |Returns ‘null’                                 |Dictionary, Array, List, and so on. |

\*When extreme values are involved in an interpolation (for example
Decimal.MaxValue) the call might result in a BadRequest exception.


If the InterpolationMode is not assigned, the events are interpolated in the default manner, unless the interpolation 
mode is overridden in the TypeProperty or the SdsStream. For more information on overriding the interpolation mode 
on a specific type property see SdsTypeProperty_. For more information on overriding the interpolation mode for a specific stream see [Sds Streams](xref:sdsStreams).


Extrapolation
-------------

Extrapolation defines how a stream responds to requests with indexes that precede or follow all 
data in the steam. ExtrapolationMode acts as a master switch to determine whether extrapolation 
occurs and at which end of the data. 

ExtrapolationMode works with the InterpolationMode to determine how a stream responds. The following tables 
show how ExtrapolationMode affects returned values for each InterpolationMode value:

**ExtrapolationMode with Mode\ =Default or Continuous**

| ExtrapolationMode   | Enumeration value   | Index before data          | Index after data          |
|---------------------|---------------------|----------------------------|---------------------------|
| All                 | 0                   | Returns first data value   | Returns last data value   |
| None                | 1                   | Returns ‘null’             | Returns ‘null’            |
| Forward             | 2                   | Returns ‘null’             | Returns last data value   |
| Backward            | 3                   | Returns first data value   | Returns ‘null’            |

**ExtrapolationMode with InterpolationMode\ =Discrete**

| ExtrapolationMode   | Enumeration value   | Index before data   | Index after data   |
|---------------------|---------------------|---------------------|--------------------|
| All                 | 0                   | Returns ‘null’      | Returns ‘null’     |
| None                | 1                   | Returns ‘null’      | Returns ‘null’     |
| Forward             | 2                   | Returns ‘null’      | Returns ‘null’     |
| Backward            | 3                   | Returns ‘null’      | Returns ‘null’     |

**ExtrapolationMode with InterpolationMode\ =StepwiseContinuousLeading**

| ExtrapolationMode   | Enumeration value   | Index before data          | Index after data          |
|---------------------|---------------------|----------------------------|---------------------------|
| All                 | 0                   | Returns first data value   | Returns last data value   |
| None                | 1                   | Returns ‘null’             | Returns ‘null’            |
| Forward             | 2                   | Returns ‘null’             | Returns last data value   |
| Backward            | 3                   | Returns first data value   | Returns ‘null’            |

**ExtrapolationMode with InterpolationMode\ =StepwiseContinuousTrailing**

| ExtrapolationMode   | Enumeration value   | Index before data          | Index after data          |
|---------------------|---------------------|----------------------------|---------------------------|
| All                 | 0                   | Returns first data value   | Returns last data value   |
| None                | 1                   | Returns ‘null’             | Returns ‘null’            |
| Forward             | 2                   | Returns ‘null’             | Returns last data value   |
| Backward            | 3                   | Returns first data value   | Returns ‘null’            |


If the ExtrapolationMode is not assigned, the events are extrapolated in the default manner, unless the extrapolation mode is overridden on the SdsStream. For more information on overriding the extrapolation mode on a specific stream see [Sds Streams](xref:sdsStreams).

For additional information about the effect of read characteristics, see the
documentation on the [read method](xref:sdsReadingDataApi)
you are using.

SdsTypeProperty
---------------

The Properties collection define the fields in an SdsType. 

The following table shows the required and optional SdsTypeProperty fields. Fields that 
are not included are reserved for internal SDS use.

|          Property         | Type                    | Optionality | Details |
|---------------------------|-------------------------|-------------|---------|
| Id                        | String                  | Required    | Identifier for referencing the type |
| Name                      | String                  | Optional    | Friendly name |
| Description               | String                  | Optional    | Description text |
| SdsType                   | SdsType                 | Required    | Field defining the property's Type |
| IsKey                     | Boolean                 | Required    | Identifies the property as the Key (Primary Index) |
| Value                     | Object                  | Optional    | Value of the property |
| Order                     | Int                     | Optional    | Order of comparison within a compound index |
| InterpolationMode         | SdsInterpolationMode    | Optional    | Interpolation setting of the property. Default is null. |
| Uom                       | String                  | Optional    | Unit of Measure of the property |


The SdsTypeProperty’s identifier follows the same rules as the SdsType’s identifier.

IsKey is a Boolean value used to identify the SdsType’s Key. A Key defined by more than one 
Property is called a compound key. The maximum number of Properties that can define a compound key is three. 

In a compound key, each Property that is included in the 
Key is specified as IsKey. The Order field defines the precedence of fields applied to the Index.

The Value field is used for properties that represent a value. An example of a property with a 
value is an enum’s named constant. When representing an enum in a SdsType, the SdsType’s 
Properies collection defines the enum’s constant list. The SdsTypeProperty’s Identifier represents 
the constant’s name and the SdsTypeProperty’s Value represents the constant’s value (see the enum State definitions below).

InterpolationMode is assigned when the Property of the event should be interpolated in a specific way 
that differs from the InterpolationMode of the SdsType. InterpolationMode is only applied to a Property 
that is not part of the Index. If the InterpolationMode is not set, the Property is are interpolated 
in the manner defined by the SdsType’s IntepolationMode.


An SdsType with the InterpolationMode set to ``Discrete`` cannot have a Property with an InteroplationMode. 
For more information on interpolation of events see Interpolation_.


Uom is the unit of measure for the Property. The Uom of a Property may be specified by the name or the 
abbreviation. The names and abbreviations of Uoms are case sensitive. 

The InterpolationMode and Uom of a Property can be overriden on the stream. For more information, see [Sds Streams](xref:sdsStreams#propertyoverrides). 

Supported Units of Measure
--------------------------

For a list of units of measures that are supported for an SdsTypeProperty, see [Units of Measure](xref:unitsOfMeasure#supported-units-of-measure).

Working with SdsTypes using .NET
--------------------------------


When working in .NET, use the SdsTypeBuilder to create SdsTypes. The SdsTypeBuilder eliminates 
potential errors that can occur when working with SdsTypes manually.

There are several ways to work with the builder. The most convenient is to use the static 
methods, as shown here:

      public enum State
      {
          Ok,
          Warning,
          Alarm
      }

      public class Simple
      {
          [SdsMember(IsKey = true, Order = 0)]
          public DateTime Time { get; set; }
          public State State { get; set; }
          public Double Measurement { get; set; }
      }

      SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
      simpleType.Id = "Simple";
      simpleType.Name = "Simple";
      simpleType.Description = "Basic sample type";


SdsTypeBuilder recognizes the ``System.ComponentModel.DataAnnotations.KeyAttribute`` and 
its own ``OSIsoft.Sds.SdsMemberAttribute``. When using the SdsMemberAttribute to specify 
the Primary Index, set the IsKey to true.

The type is created with the following parameters. SdsTypeBuilder automatically generates 
unique identifiers. Note that the following table contains only a partial list of fields.


| Field            | Values                  |             |                                      |
|------------------|-------------------------|-------------|--------------------------------------|
| Id               | Simple                  |             |                                      |
| Name             | Simple                  |             |                                      |
| Description      | Basic sample type       |             |                                      |
| Properties       | Count = 3               |             |                                      |
|   [0]            | Id                      | Time                                               |
|                  | Name                    | Time                                               |
|                  | Description             | null                                               |
|                  | Order                   | 0                                                  |
|                  | IsKey                   | true                                               |
|                  | SdsType                 | Id          | c48bfdf5-a271-384b-bf13-bd21d931c1bf |
|                  |                         | Name        | DateTime                             |
|                  |                         | Description | null                                 |
|                  |                         | Properties  | null                                 |
|                  | Value                   | null                                               |
|   [1]            | Id                      | State                                              |
|                  | Name                    | State                                              |
|                  | Description             | null                                               |
|                  | Order                   | 0                                                  |
|                  | IsKey                   | false                                              |
|                  | SdsType                 | Id          | 02728a4f-4a2d-3588-b669-e08f19c35fe5 |
|                  |                         | Name        | State                                |
|                  |                         | Description | null                                 |
|                  |                         | Properties  | Count = 3                            |
|                  |                         | [0]         | Id                | "Ok"             |
|                  |                         |             | Name              | null             |
|                  |                         |             | Description       | null             |
|                  |                         |             | Order             | 0                |
|                  |                         |             | SdsType           | null             |
|                  |                         |             | Value             | 0                |
|                  |                         | [1]         | Id                | "Warning"        |
|                  |                         |             | Name              | null             |
|                  |                         |             | Description       | null             |
|                  |                         |             | Order             | 0                |
|                  |                         |             | SdsType           | null             |
|                  |                         |             | Value             | 1                |
|                  |                         | [2]         | Id                | "Alarm"          |
|                  |                         |             | Name              | null             |
|                  |                         |             | Description       | null             |
|                  |                         |             | Order             | 0                |
|                  |                         |             | SdsType           | null             |
|                  |                         |             | Value             | 2                |
|                  | Value                   | null                                               |
|   [2]            | Id                      | Measurement                                        |
|                  | Name                    | Measurement                                        |
|                  | Description             | null                                               |
|                  | Order                   | 0                                                  |
|                  | IsKey                   | false                                              |
|                  | SdsType                 | Id          | 0f4f147f-4369-3388-8e4b-71e20c96f9ad |
|                  |                         | Name        | Double                               |
|                  |                         | Description | null                                 |
|                  |                         | Properties  | null                                 |
|                  | Value                   | null                                               |


The SdsTypeBuilder also supports derived types. Note that you need not add the base types to 
the Data Store before using SdsTypeBuilder. Base types are maintained within the SdsType.

Working with SdsTypes when not using .NET
----------------------------------------


SdsTypes must be built manually when .NET SdsTypeBuilder is unavailable. The following discussion 
refers to the following types and are defined in  
`Python <https://github.com/osisoft/Qi-Samples/tree/master/Basic/Python>`__ and 
`JavaScript <https://github.com/osisoft/Sds-Samples/tree/master/Basic/JavaScript>`__ samples. 
Samples in other languages can be found here: `Samples <https://github.com/osisoft/Qi-Samples/tree/master/Basic>`__.

In the sample code, ``SdsType``, ``SdsTypeProperty``, and ``SdsTypeCode`` are defined as in the code snippets shown here:

**Python**

      class SdsTypeCode(Enum):
          Empty = 0
          Object = 1
          DBNull = 2
          Boolean = 3
          Char = 4
            ...
      class SdsTypeProperty(object):
          """SDS type property definition"""

          def __init__(self):
                  self.__isKey = False

          @property
          def Id(self):
              return self.__id
          @Id.setter
          def Id(self, id):
              self.__id = id

            ...

          @property
          def IsKey(self):
              return self.__isKey
          @IsKey.setter
          def IsKey(self, iskey):
              self.__isKey = iskey

          @property
          def SdsType(self):
              return self.__SdsType
          @SdsType.setter
          def SdsType(self, SdsType):
              self.__SdsType=SdsType
            ...

      class SdsType(object):
          """SDS type definitions"""
          def __init__(self):
              self.SdsTypeCode = SdsTypeCode.Object

          @property
          def Id(self):
              return self.__id
          @Id.setter
          def Id(self, id):
              self.__id = id

            ...

          @property
          def BaseType(self):
              return self.__baseType
          @BaseType.setter
          def BaseType(self, baseType):
              self.__baseType = baseType

          @property
          def SdsTypeCode(self):
              return self.__typeCode
          @SdsTypeCode.setter
          def SdsTypeCode(self, typeCode):
              self.__typeCode = typeCode

          @property
          def Properties(self):
              return self.__properties
          @Properties.setter
          def Properties(self, properties):
              self.__properties = properties



**JavaScript**

      SdsTypeCodeMap: {
          Empty: 0,
          "Object": 1,
          DBNull: 2,
          "Boolean": 3,
          Char: 4,
          ...
      SdsTypeProperty: function (SdsTypeProperty) {
          if (SdsTypeProperty.Id) {
              this.Id = SdsTypeProperty.Id;
          }
          if (SdsTypeProperty.Name) {
              this.Name = SdsTypeProperty.Name;
          }
          if (SdsTypeProperty.Description) {
              this.Description = SdsTypeProperty.Description;
          }
          if (SdsTypeProperty.SdsType) {
              this.SdsType = SdsTypeProperty.SdsType;
          }
          if (SdsTypeProperty.IsKey) {
              this.IsKey = SdsTypeProperty.IsKey;
          }
      },
      SdsType: function (SdsType) {
          if (SdsType.Id) {
              this.Id = SdsType.Id
          }
          if (SdsType.Name) {
              this.Name = SdsType.Name;
          }
          if (SdsType.Description) {
              this.Description = SdsType.Description;
          }
          if (SdsType.SdsTypeCode) {
              this.SdsTypeCode = SdsType.SdsTypeCode;
          }
          if (SdsType.Properties) {
              this.Properties = SdsType.Properties;
          }
      },



Working with the following types (both Python and JavaScript classes are shown):


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

          Measurement = property(getMeasurement, setMeasurement)
          def getMeasurement(self):
              return self.__measurement
          def setMeasurement(self, measurement):
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
            this.Measurement = null;
        }


Define the SdsType as follows:

**Python**

      # Create the properties

      # Time is the primary key
      time = SdsTypeProperty()
      time.Id = "Time"
      time.Name = "Time"
      time.IsKey = True
      time.SdsType = SdsType()
      time.SdsType.Id = "DateTime"
      time.SdsType.Name = "DateTime"
      time.SdsType.SdsTypeCode = SdsTypeCode.DateTime

      # State is not a pre-defined type. A SdsType must be defined to represent the enum
      stateTypePropertyOk = SdsTypeProperty()
      stateTypePropertyOk.Id = "Ok"
      stateTypePropertyOk.Value = State.Ok
      stateTypePropertyWarning = SdsTypeProperty()
      stateTypePropertyWarning.Id = "Warning"
      stateTypePropertyWarning.Value = State.Warning
      stateTypePropertyAlarm = SdsTypeProperty()
      stateTypePropertyAlarm.Id = "Alarm"
      stateTypePropertyAlarm.Value = State.Alarm

      stateType = SdsType()
      stateType.Id = "State"
      stateType.Name = "State"
      stateType.Properties = [ stateTypePropertyOk, stateTypePropertyWarning, \
                              stateTypePropertyAlarm ]

      state = SdsTypeProperty()
      state.Id = "State"
      state.Name = "State"
      state.SdsType = stateType

      # Value property is a simple non-indexed, pre-defined type
      value = SdsTypeProperty()
      value.Id = "Measurement"
      value.Name = "Measurement"
      value.SdsType = SdsType()
      value.SdsType.Id = "Double"
      value.SdsType.Name = "Double"

      # Create the Simple SdsType
      simpleType = SdsType()
      simpleType.Id = "Simple"
      simpleType.Name = "Simple"
      simpleType.Description = "Basic sample type"
      simpleType.SdsTypeCode = SdsTypeCode.Object
      simpleType.Properties = [ time ]


**JavaScript**

      // Time is the primary key
      var timeProperty = new SdsObjects.SdsTypeProperty({
          "Id": "Time",
          "IsKey": true,
          "SdsType": new SdsObjects.SdsType({
              "Id": "dateType",
              "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
          })
      });

      // State is not a pre-defined type. An SdsType must be defined to represent the enum
      var stateTypePropertyOk = new SdsObjects.SdsTypeProperty({
          "Id": "Ok",
          "Value": State.Ok
      });
      var stateTypePropertyWarning = new SdsObjects.SdsTypeProperty({
          "Id": "Warning",
          "Value": State.Warning
      });
      var stateTypePropertyAlarm = new SdsObjects.SdsTypeProperty({
          "Id": "Alarm",
          "Value": State.Alarm
      });

      var stateType = new SdsObjects.SdsType({
          "Id": "State",
          "Name": "State",
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Int32Enum,
          "Properties": [stateTypePropertyOk, stateTypePropertyWarning,
              stateTypePropertyAlarm, stateTypePropertyRed]
      });

      // Measurement property is a simple non-indexed, pre-defined type
      var measurementProperty = new SdsObjects.SdsTypeProperty({
          "Id": "Measurement",
          "Name": "Measurement",
          "SdsType": new SdsObjects.SdsType({
              "Id": "doubleType",
              "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Double
          })
      });

      // Create the Simple SdsType
      var simpleType = new SdsObjects.SdsType({
          "Id": "Simple",
          "Name": "Simple", 
          "Description": "This is a simple SDS type ",
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
          "Properties": [timeProperty, stateProperty, measurementProperty]
      });


     Working with a derived class is easy. For the following derived class:

      class Derrived(Simple):
          @property
          def Observation(self):
              return self.__observation
          @Observation.setter
          def Observation(self, observation):
              self.__observation = observation


Extend the SdsType as follows:

**Python**

      # Observation property is a simple non-inexed, standard data type
      observation = SdsTypeProperty()
      observation.Id = "Observation"
      observation.Name = "Observation"
      observation.SdsType = SdsType()
      observation.SdsType.Id = "String"
      observation.SdsType.Name = "String"
      observation.SdsType.SdsTypeCode = SdsTypeCode.String

      # Create the Derived SdsType
      derived = SdsType()
      derived.Id = "Derived"
      derived.Name = "Derived"
      derived.Description = "Derived sample type"
      derived.BaseType = simpleType # Set the base type to the derived type
      derived.SdsTypeCode = SdsTypeCode.Object
      derived.Properties = [ observation ]


**JavaScript**

      var observationProprety = new SdsObjects.SdsTypeProperty({
          "Id": "Observation",
          "SdsType": new SdsObjects.SdsType({
              "Id": "strType",
              "SdsTypeCode": SdsObjects.SdsTypeCodeMap.String
          })
      });

      var derivedType = new SdsObjects.SdsType({
          "Id": "Derived",
          "Name": "Derived",
          "Description": " Derived sample type",
          "BaseType": simpleType,
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
          "Properties": [ observationProprety ]
      });


SdsType API
----------


The REST APIs provide programmatic access to read and write Sds data. The APIs in this section 
interact with SdsTypes. When working in .NET convenient Sds Client libraries are available. 
The ISdsMetadataService interface, accessed using the ``SdsService.GetMetadataService( )`` helper, 
defines the available functions. See Types_ for general SdsType information.


***********************

``Get Type``
------------

Returns the type corresponding to the specified typeId within a given namespace.

**Request**

        GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}


**Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string typeId``  
The type identifier


**Response**

The response includes a status code and a response body.

**Response body**

  The requested SdsType

  Sample response body:

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Id":"f1a7ef61-d47f-3007-a260-449643a7c219",
         "Name":"Simple",
         "SdsTypeCode":1,
         "Properties":[  
            {  
               "Id":"Time",
               "Name":"Time",
               "IsKey":true,
               "SdsType":{  
                  "$id":"567",
                  "Id":"19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                  "Name":"DateTime",
                  "SdsTypeCode":16
               }
            },
            {  
               "Id":"State",
              "Name":"State",
               "SdsType":{  
                  "$id":"569",
                  "Id":"e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                  "Name":"State",
                  "SdsTypeCode":609,
                  "Properties":[  
                     {  
                        "$id":"570",
                        "Id":"Ok",
                        "Value":0
                     },
                     {  
                        "$id":"571",
                        "Id":"Warning",
                        "Value":1
                     },
                     {  
                        "$id":"572",
                        "Id":"Aalrm",
                        "Value":2
                     }
                  ]
               }
            },
            {  
               "$id":"573",
               "Id":"Measurement",
               "Name":"Measurement",
               "SdsType":{  
                  "$id":"574",
                  "Id":"6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                  "Name":"Double",
                  "SdsTypeCode":14
               }
            }
         ]
      }



**.NET Library**

      Task<SdsType> GetTypeAsync(string typeId);


**Security**

  Allowed by administrator and user accounts


***********************

``Get Types``
------------

Returns a list of types within a given namespace.

If specifying the optional search parameter or optional filter parameter, the list of types returned are filtered to match 
the search/filter criteria. If neither parameter is specified, the list includes all types 
in the Namespace. See [Searching](xref:sdsSearching) 
and [Filter Expressions: Metadata Objects](xref:sdsFilterExpressionsMetadata) 
for information about specifying those respective parameters.

**Request**

        GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Types?query={query}&filter={filter}&skip={skip}&count={count}&orderby={orderby}


**Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string query``  
An optional query string to match which SdsTypes will be returned.  See the [Searching](xref:sdsSearching) topic for information about specifying the query parameter.

``string filter``  
An optional filter string to match which SdsTypes will be returned.  See the [Filter Expressions: Metadata Objects](xref:sdsFilterExpressionsMetadata) 
topic for information about specifying the filter parameter.

``int skip``  
  An optional value representing the zero-based offset of the first SdsType to retrieve. If not specified, 
a default value of 0 is used.

``int count``  
An optional value representing the maximum number of SdsTypes to retrieve. If not specified, a default value of 100 is used.

``string orderby``  
An optional parameter representing sorted order which SdsTypes will be returned. A field name is required. The sorting is based on the stored values for the given
  field (of type string). For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). 
  Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by 
  using values ``asc`` or ``desc``, respectively.
  For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending.
  If no value is specified, there is no sorting of results.

**Response**

  The response includes a status code and a response body.

**Response body**

  A collection of zero or more SdsTypes.

  Sample response body:

      HTTP/1.1 200
      Content-Type: application/json

      [  
        {  
            "Id":"f1a7ef61-d47f-3007-a260-449643a7c219",
            "Name":"Simple",
            "SdsTypeCode":1,
            "Properties":[  
               {  
                  "Id":"Time",
                  "Name":"Time",
                  "IsKey":true,
                  "SdsType":{  
                     "Id":"19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                     "Name":"DateTime",
                     "SdsTypeCode":16
                  }
               },
               {  
                  "Id":"State",
                  "Name":"State",
                  "SdsType":{  
                     "Id":"e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                     "Name":"State",
                     "SdsTypeCode":609,
                     "Properties":[  
                        {  
                           "Id":"Ok",
                           "Value":0
                        },
                        {  
                           "Id":"Warning",
                           "Value":1
                        },
                        {  
                           "Id":"Aalrm",
                           "Value":2
                        }
                     ]
                  }
               },
               {  
                  "Id":"Measurement",
                  "Name":"Measurement",
                  "SdsType":{  
                     "$id":"574",
                     "Id":"6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                     "Name":"Double",
                     "SdsTypeCode":14
                  }
               }
            ]
         },
         …
      ]



**.NET Library**

      Task<IEnumerable<SdsType>> GetTypesAsync(string query = "", int skip = 0, int count = 100);


**Security**

  Allowed by administrator and user accounts


***********************

``Create Type``
-------------

Creates the specified type. If a type with a matching identifier already exists, The Data Store compares the 
existing type with the type that was sent. If the types are identical, a ``Found`` (302) error 
is returned with the Location header set to the URI where the type may be retrieved using a Get function. 
If the types do not match, a ``Conflict`` (409) error is returned.

For a matching type (``Found``), clients that are capable of performing a redirect that includes the 
authorization header can automatically redirect to retrieve the type. However, most clients, 
including the .NET HttpClient, consider redirecting with the authorization token to be a security vulnerability.

When a client performs a redirect and strips the authorization header, SDS cannot authorize the request and 
returns ``Unauthorized`` (401). For this reason, it is recommended that when using clients that do not 
redirect with the authorization header, you should disable automatic redirect and perform the redirect manually.


**Request**

        POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}

**Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string typeId``  
The type identifier. The identifier must match the SdsType.Id field. 


**Response**

  The response includes a status code and a response body.

**Response body**

  The request content is the serialized SdsType. If you are not using the SDS client libraries, it is recommended 
  that you use JSON.

  Sample SdsType content:

      {  
         "Id":"Simple",
         "Name":"Simple",
         "Description":"Basic sample type",
         "SdsTypeCode":1,
         "IsGenericType":false,
         "IsReferenceType":false,
         "GenericArguments":null,
         "Properties":[  
            {  
               "Id":"Time",
               "Name":"Time",
               "Description":null,
               "Order":0,
               "IsKey":true,
               "FixedSize":0,
               "SdsType":{  
                  "Id":"c48bfdf5-a271-384b-bf13-bd21d931c1bf",
                  "Name":"DateTime",
                  "Description":null,
                  "SdsTypeCode":16,
                  "IsGenericType":false,
                  "IsReferenceType":false,
                  "GenericArguments":null,
                  "Properties":null,
                  "BaseType":null,
                  "DerivedTypes":null
               },
               "Value":null
            },
            {  
               "Id":"State",
               "Name":"State",
               "Description":null,
               "Order":0,
               "IsKey":false,
               "FixedSize":0,
               "SdsType":{  
                  "Id":"ba5d20e1-cd21-3ad0-99f3-c3a3b0146aa1",
                  "Name":"State",
                  "Description":null,
                  "SdsTypeCode":609,
                  "IsGenericType":false,
                  "IsReferenceType":false,
                  "GenericArguments":null,
                  "Properties":[  
                     {  
                        "Id":"Ok",
                        "Name":null,
                        "Description":null,
                        "Order":0,
                        "IsKey":false,
                        "FixedSize":0,
                        "SdsType":null,
                        "Value":0
                     },
                     {  
                        "Id":"Warning",
                        "Name":null,
                        "Description":null,
                        "Order":0,
                        "IsKey":false,
                        "FixedSize":0,
                        "SdsType":null,
                        "Value":1
                     },
                     {  
                        "Id":"Alarm",
                        "Name":null,
                        "Description":null,
                        "Order":0,
                        "IsKey":false,
                        "FixedSize":0,
                        "SdsType":null,
                        "Value":2
                     }
                  ],
                  "BaseType":null,
                  "DerivedTypes":null
               },
               "Value":null
            },
            {  
               "Id":"Measurement",
               "Name":"Measurement",
               "Description":null,
               "Order":0,
               "IsKey":false,
               "FixedSize":0,
               "SdsType":{  
                  "Id":"0f4f147f-4369-3388-8e4b-71e20c96f9ad",
                  "Name":"Double",
                  "Description":null,
                  "SdsTypeCode":14,
                  "IsGenericType":false,
                  "IsReferenceType":false,
                  "GenericArguments":null,
                  "Properties":null,
                  "BaseType":null,
                  "DerivedTypes":null
               },
               "Value":null
            }
         ],
         "BaseType":null,
         "DerivedTypes":null
      }


Response

The response includes a status code and a response body.

Response body

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Id":"Simple",
         "Name":"Simple",
         "Description":"Basic sample type",
         "SdsTypeCode":1,
         "Properties":[  
            {  
               "Id":"Time",
               "Name":"Time",
               "IsKey":true,
               "SdsType":{  
                  "$id":"596",
                  "Id":"c48bfdf5-a271-384b-bf13-bd21d931c1bf",
                  "Name":"DateTime",
                  "SdsTypeCode":16
               }
            },
            {  
               "Id":"State",
               "Name":"State",
               "SdsType":{  
                  "$id":"598",
                  "Id":"ba5d20e1-cd21-3ad0-99f3-c3a3b0146aa1",
                  "Name":"State",
                  "SdsTypeCode":609,
                  "Properties":[  
                     {  
                        "Id":"Ok",
                        "Value":0
                     },
                     {  
                        "Id":"Warning",
                        "Value":1
                     },
                     {  
                        "Id":"Alarm",
                        "Value":2
                     }
                  ]
               }
            },
            {  
               "Id":"Measurement",
               "Name":"Measurement",
               "SdsType":{  
                  "Id":"0f4f147f-4369-3388-8e4b-71e20c96f9ad",
                  "Name":"Double",
                  "SdsTypeCode":14
               }
            }
         ]
      }




**.NET Library**


  ``Task<SdsType> GetOrCreateTypeAsync(SdsType SdsType);``

  If a type with a matching identifier already exists and it matches the type in the request body, 
  the client redirects a GET to the Location header. If the existing type does not match the type
  in the request body, a Conflict error response is returned and the client library method throws an exception. 

  The SDS .NET Libraries manage redirects.

**Security**

  Allowed by administrator accounts


***********************



``Create or Update Type``
------------------------

Creates the specified type. If a type with the same Id already exists, the definition of the type is updated.

Note that a type cannot be updated if any streams or stream views are 
associated with it. Also, certain parameters, including the type id, cannot be changed after 
they are defined.

**Request**

        PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}


**Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string typeId``  
The type identifier


**Response**

  The response includes a status code and a response body.

**Response body**

  The content is set to true on success.


**.NET Library**

      Task CreateOrUpdateTypeAsync(SdsType SdsType)


**Security**

  Allowed by administrator accounts


***********************



``Delete Type``
------------

Deletes a type from the specified tenant and namespace. Note that a type cannot be deleted if any streams or stream views reference it.

**Request**

        DELETE	api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}


**Parameters**

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string typeId``  
The type identifier


**Response**

  The response includes a status code.


**.NET Library**

      Task DeleteTypeAsync(string typeId);


**Security**

  Allowed by administrator accounts
