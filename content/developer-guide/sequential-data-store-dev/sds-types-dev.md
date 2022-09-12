---
uid: sdsTypes
---

# Types

The Sequential Data Store (SDS) stores streams of events and provides convenient ways to find and associate 
events. Events are stored in streams.
A primitive type is available in OCS and is used within the API and REST definitions to identify a stream type.

You can define simple atomic types, such as integers, floats, strings, arrays, and dictionaries, or 
complex or nested types using the [Properties collection of SdsTypes](#sdstypeproperty). 

A type that is used to define a stream must have a key. A key is a [Property, or a combination of Properties](#sdstypeproperty) 
that constitutes an ordered, unique identity. If the key is ordered so it functions as an index, it is 
known as the *primary index*. While a timestamp (``DateTime``) is a very common type of index, any type that 
can be ordered is permitted. Secondary and other indexes are defined in the stream. 
For more information, see [Indexes](xref:sdsIndexes).

Consider how the events will be represented in a stream as the type defines 
each event in a stream. An event is a single unit whose properties have values that relate to the 
index; that is, each property of a type event is related to the event's index. Each event is a single unit.

A type is referenced by its identifier or ``Id`` field.
Type identifiers must be unique within a namespace.

A type can also refer to other types by using their identifiers. This enables type re-usability.
Nested types and base types are automatically created as separate types.
For more information, see [Type Reusability](#type-reusability).

Types define how events are read and associated within a collection of streams. The read 
characteristics when attempting to read non-existent indexes, indexes that fall between, before or after 
existing indexes, are determined by the interpolation and extrapolation settings of the type. For more 
information about read characteristics, see [Interpolation](xref:sdsReadingData#interpolation) and [Extrapolation](xref:sdsReadingData#extrapolation).

Types are immutable. After a type is created, its definition cannot be updated.
A type must be deleted and recreated if the definition is incorrect.
You can delete a type only if no streams, stream views, or other types reference it.

Only the types that are used to define streams or stream views are required to be added to the SDS. 
Types that define [properties](#sdstypeproperty) or base types are contained within the parent type so they don't need to be added to the SDS independently.

## Types API
[Types API](xref:sds-types)

## SdsType fields and properties table
<a name="typepropertiestable"></a>
The table below lists required and optional fields in a type. Fields that are not included are reserved for internal SDS use.
For more information on search including limitations, see [Search in SDS](xref:sdsSearching).
| Property Name         | Data Type                   | Required | Searchable | Details |
|-------------------|------------------------|-------------|---------|---------|
| Id                | String                 | Yes    | Yes | Identifier for referencing the type |
| Name              | String                 | No    | Yes | Friendly name |
| Description       | String                 | No    | Yes | Description text |
| SdsTypeCode       | SdsTypeCode            | Yes    | No | Numeric code identifying the base SdsType |
| InterpolationMode | SdsInterpolationMode   | No    | No | Interpolation setting of the type. Default is Continuous. For more information, see [Interpolation](xref:sdsReadingData#interpolation).|
| ExtrapolationMode | SdsExtrapolationMode   | No    | No | Extrapolation setting of the type. For more information, see [Extrapolation](xref:sdsReadingData#extrapolation). |
| Properties        | IList\<SdsTypeProperty\> | Yes    | Yes, with limitations | List of SdsTypeProperty items. See [SdsTypeProperty](#sdstypeproperty) below.  |

### Rules for the type identifier (SdsType.Id)
1. Is not case sensitive
2. Cannot just be whitespace
3. Cannot contain leading or trailing whitespace
4. Cannot contain forward slash ("/")
5. Can contain a maximum of 100 characters  

Type management using the .NET SDS client libraries methods is performed through ``ISdsMetadataService``. 
You can create ``ISdsMetadataService`` using one of the ``SdsService.GetMetadataService()`` factory methods.
.NET client libraries provide `SdsTypeBuilder` to help build SdsTypes from .NET types. SdsTypeBuilder is discussed in greater detail below.

## SdsTypeCode
The SdsTypeCode is a numeric identifier used by the SDS to identify SdsTypes.
An SdsTypeCode exists for every supported type.

Atomic types, such as strings, floats and arrays, are defined entirely by the SdsTypeCode and do not need other fields to define the type.

Types that require additional definition (enumerations and objects, for example) are identified with a generic 
SdsTypeCode (`ByteEnum`, `Int32Enum`, `NullableInt32withEnum`, or `Object`, for example) *and* additional SdsTypeProperty fields.

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

## SdsTypeProperty
The `Properties` collection defines the fields in a type. 
Type properties will appear in every stream that is created from a given type.

The following table shows the required and optional `SdsTypeProperty` fields.
Fields that are not included are reserved for internal SDS use.

|          Property Name         | Data Type                    | Required | Details |
|---------------------------|-------------------------|-------------|---------|
| Id                        | String                  | Yes    | Identifier for referencing the type |
| Name                      | String                  | No    | Friendly name |
| Description               | String                  | No    | Description text |
| SdsType                   | SdsType                 | Yes    | Field defining the property's SdsType |
| IsKey                     | Boolean                 | Yes    | Identifies the property as the index |
| Value                     | Object                  | No    | Value of the property |
| Order                     | Int                     | No    | Order of comparison within a compound index |
| InterpolationMode         | SdsInterpolationMode    | No    | Interpolation setting of the property. Default is null. |
| Uom                       | String                  | No    | Unit of measure of the property |

**ID rule**
The SdsTypeProperty ID follows the same [rules](#typepropertiestable) as the type identifier.

**`IsKey`**   
Boolean value ``IsKey`` identifies the primary index of a type in a single index. An index that is defined by more than one 
SdsTypeProperty is called a compound index. The maximum number of properties that can define a compound index is three. 
In a compound index, each `SdsTypeProperty` that is included in the index is specified as ``IsKey``.
The ``Order`` field marks the order of comparison within a compound index.

**`Value`**  
The ``Value`` field is used for the properties of enumeration types.
An enumeration is a collection of named constants with associated constant values.
Each named constant is defined by the `Id` of the SdsTypeProperty.
The associated constant value is defined by the `Value` of the SdsTypeProperty.
For more information, see the enumeration ``State`` definitions in the sample code below.


**`InterpolationMode`**  
``InterpolationMode`` is assigned when the SdsTypeProperty of the event should be interpolated in a specific way 
that differs from the interpolation mode of the SdsType. ``InterpolationMode`` is only applied to an SdsTypeProperty 
that is not part of the index. If the ``InterpolationMode`` is not set, the SdsTypeProperty is interpolated 
in the manner defined by the SdsType's ``InterpolationMode``.

An SdsType with the ``InterpolationMode`` set to `Discrete` cannot also have the SdsTypeProperty with ``InteroplationMode``. 
For more information on interpolation of events, see [Interpolation](xref:sdsReadingData#interpolation).

**`Uom`**  
``Uom`` is the unit of measure for the SdsTypeProperty. The ``Uom`` of the SdsTypeProperty may be specified by the name or the 
abbreviation. The names and abbreviations of ``Uoms`` are case sensitive. 

The ``InterpolationMode`` and ``Uom`` of the SdsTypeProperty can be overridden on the SdsStream. For more information, see [Streams](xref:sdsStreams#sdsstreampropertyoverride).

### Supported units of measure
For a list of units of measures that are supported for an SdsTypeProperty, see [Units of measure](xref:unitsOfMeasure#supported-system-defined-units-of-measure).

## SdsTypes in .NET framework

When working in .NET, use the `SdsTypeBuilder` to create SdsTypes. The `SdsTypeBuilder` eliminates 
potential errors that can occur when working with SdsTypes manually.

There are several ways to work with the `SdsTypeBuilder`. One is to use the static methods for convenience:
```csharp
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
    
    [SdsMember(IsQuality = true)]
    public State State { get; set; }
    
    public Double Measurement { get; set; }
}

SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
simpleType.Id = "Simple";
simpleType.Name = "Simple";
simpleType.Description = "Basic sample type";
```

`SdsTypeBuilder` recognizes the ``System.ComponentModel.DataAnnotations.KeyAttribute`` and 
its own ``OSIsoft.Sds.SdsMemberAttribute``. When using the ``SdsMemberAttribute`` to specify 
the primary index, set the ``IsKey`` to true.

The SdsType is created with the following parameters. `SdsTypeBuilder` automatically generates 
unique identifiers. Note that the following table contains only a partial list of fields.

| Field            | Values                  |             |                                      |
|------------------|-------------------------|-------------|--------------------------------------|
| Id               | Simple                                                                       |
| Name             | Simple                                                                       |
| Description      | Basic sample type                                                            |
| Properties       | Count = 3                                                                    |
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


The `SdsTypeBuilder` also supports derived types. Note that you need not add the base types to 
the SDS before using `SdsTypeBuilder`. Base types are maintained within the SdsType.

## SdsTypes outside of .NET framework
You can manually build types when .NET `SdsTypeBuilder` is unavailable. Below, you'll see how types are built and defined in
[Python](https://github.com/osisoft/sample-ocs-waveform-python) and [JavaScript](https://github.com/osisoft/sample-ocs-waveform-nodejs) samples. 
For samples in other languages, go to [OCS code samples in GitHub](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/SDS_WAVEFORM_README.md).

### SdsTypeCode, SdsTypeProperty and SdsType


#### [Python](#tab/tabid-1)

```python
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
```
#### [JavaScript](#tab/tabid-2)

```javascript
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
```
***


### Enum `State` and type `Simple`


#### [Python](#tab/tabid-a)

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

    Measurement = property(getMeasurement, setMeasurement)
    def getMeasurement(self):
        return self.__measurement
    def setMeasurement(self, measurement):
        self.__measurement = measurement
```

#### [JavaScript](#tab/tabid-b)

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
    this.Measurement = null;
}
```

***

### Defining and creating types

#### [Python](#tab/tabid-c)

```python
# Create the properties

# Time is the primary index
time = SdsTypeProperty()
time.Id = "Time"
time.Name = "Time"
time.IsKey = True
time.SdsType = SdsType()
time.SdsType.Id = "DateTime"
time.SdsType.Name = "DateTime"
time.SdsType.SdsTypeCode = SdsTypeCode.DateTime

# State is not a pre-defined type. SdsType must be defined to represent the enum
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
```
#### [JavaScript](#tab/tabid-d)

```javascript
// Time is the primary index
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
```

Working with a derived class is easy. For example, this is a derived class:

```javascript
class Derived(Simple):
    @property
    def Observation(self):
        return self.__observation
    @Observation.setter
    def Observation(self, observation):
        self.__observation = observation
```
***

### Extending the types

#### [Python](#tab/tabid-e)

```python
# Observation property is a simple non-indexed, standard data type
observation = SdsTypeProperty()
observation.Id = "Observation"
observation.Name = "Observation"
observation.SdsType = SdsType()
observation.SdsType.Id = "String"
observation.SdsType.Name = "String"
observation.SdsType.SdsTypeCode = SdsTypeCode.String

# Create the derived SdsType
derived = SdsType()
derived.Id = "Derived"
derived.Name = "Derived"
derived.Description = "Derived sample type"
derived.BaseType = simpleType # Set the base type to the derived type
derived.SdsTypeCode = SdsTypeCode.Object
derived.Properties = [ observation ]
```
#### [JavaScript](#tab/tabid-f)

```javascript
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
```
***
## Type reusability
Types can refer to other types by using their identifiers, which enables type reusability.
For example, if there is a common index and value property for a group of types that 
may have additional properties, a base type can be created with those properties.

```json
{
    "Id": "Simple",
    "Name": "Simple",
    "SdsTypeCode": 1,
    "Properties": [
        {
            "Id": "Time",
            "Name": "Time",
            "IsKey": true,
            "SdsType": {
                "SdsTypeCode": 16
            }
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

If you need to create a new type with properties in addition to the ones shown above,
a reference to the base type can be added by simply specifying the base type's ``Id``.

```json
{
    "Id": "Complex",
    "Name": "Complex",
    "SdsTypeCode": 1,
    "BaseType":{
        "Id":"Simple"
    },
    "Properties": [
        {
            "Id": "Depth",
            "Name": "Depth",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

The new type may also include the full type definition of the reference type instead of specifying only the ``Id`` as shown below:

```json
{
    "Id": "Complex",
    "Name": "Complex",
    "SdsTypeCode": 1,
    "BaseType":{
        "Id": "Simple",
        "Name": "Simple",
        "SdsTypeCode": 1,
        "Properties": [
            {
                "Id": "Time",
                "Name": "Time",
                "IsKey": true,
                "SdsType": {
                    "SdsTypeCode": 16
                }
            },
            {
                "Id": "Measurement",
                "Name": "Measurement",
                "SdsType": {
                    "SdsTypeCode": 14
                }
            }
        ]
    },
    "Properties": [
        {
            "Id": "Depth",
            "Name": "Depth",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

If the full definition is sent, the referenced types (base type "Simple" in the above example)
should match the actual type that was initially created. 
If the full definition is sent and the referenced types do not exist,
a new type will be created automatically by the SDS. 
Further type creations can reference them as shown above.
Note that when trying to get types back from the SDS, the results will also include types that were automatically created by the SDS.

Base types and properties of type `object`, `enum`, or user-defined collections such as `array`, `list` and `dictionary`,
will be treated as referenced types. Note that streams cannot be created using these referenced types.
If a stream of a particular type is to be created, the type should contain at least one property
with a valid index type as described in the [Indexes](xref:sdsIndexes) section. 
The index property may also be in the base type as shown in the example above.

You can do this using any programming languages. Here's an example in .NET:

```csharp

public class Basic
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }

    public double Temperature { get; set; }
}

public class EngineMonitor : Basic
{
    public double PistonSpeed { get; set; }
}

public class WindShieldMonitor : Basic
{
    public double Luminance { get; set; }
}

SdsType engineType = SdsTypeBuilder.CreateSdsType<EngineMonitor>();
engineType.Id = "Engine";
engineType.BaseType.Id = "Basic";

SdsType windShieldType = SdsTypeBuilder.CreateSdsType<WindShieldMonitor>();
windShieldType.Id = "WindShield";
windShieldType.BaseType.Id = "Basic";

```

If needed, the base type's Id can also be changed to be more meaningful.

