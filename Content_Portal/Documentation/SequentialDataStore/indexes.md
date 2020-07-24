---
uid: sdsIndexes
---

# Indexes
Indexes speed up and order the results of searches. A key uniquely identifies a record within 
a collection of records. Keys are unique within the collection.

In SDS, the key of an SdsType is also an index. The key is often referred to as the *primary index,* 
while all other indexes are referred to as *secondary indexes* or *secondaries*.

An SdsType that is used to define an SdsStream must specify a key. When inserting data into an SdsStream, every 
key value must be unique. SDS will not store more than a single event for a given key; an event with 
a particular key may be deleted or updated, but two events with the same key cannot exist.

In .NET, the SdsType properties that define the primary index are identified using an ``OSIsoft.Sds.SdsMemberAttribute`` 
and setting its ``IsKey`` field to true. If the key consists of only a single property it is permissible to 
use the ``System.ComponentModel.DataAnnotations.KeyAttribute``. In the SdsType, the Property or Properties 
representing the primary index have their ``SdsTypeProperty.IsKey`` field set to true.

Secondary indexes are defined on SdsStreams and are applied to a single property. You can define several 
secondary indexes. Secondary index values need not be unique.

## Supported types for an index
Type                     | SdsTypeCode
-----------------------  | -----
Boolean                  | 3
Byte                     | 6
Char                     | 4
DateTime                 | 16
DateTimeOffset           | 20
Decimal                  | 15
Double                   | 14
Guid                     | 19
Int16                    | 7
Int32                    | 9
Int64                    | 11
SByte                    | 5
Single                   | 13
String                   | 18
TimeSpan                 | 21
UInt16                   | 8
UInt32                   | 10
UInt64                   | 12

## Compound indexes
A single property (such as a `DateTime`) is adequate for defining an index most of the time. 
But for more complex scenarios, SDS allows you to define multiple properties. 
Indexes defined by multiple properties are known as *compound indexes*.
Only the primary index (or key) supports compound indexes.

When defining a compound index within .NET framework, you should apply the ``OSIsoft.Sds.SdsMemberAttribute`` 
on each property field of the SdsType that is combined to define the index.
Set the Property ``IsKey`` to ``true`` and give the ``Order`` field a zero-based index value.
The ``Order`` field defines the precedence of the Property when sorting.
A Property with an order of 0 has highest precedence.

When defining compound indexes outside of .NET framework, specify the ``IsKey`` and ``Order`` fields
on the ``SdsTypeProperty`` object.

You can specify a maximum of three properties to define a compound index.
In read and write operations, specify compound indexes in the URI by ordering each property that composes the index
 separated by the pipe character, ‘|’. 
To help those using compound indexes, .NET client libraries methods also allow the use of tuples for indexes.

**Notes:** 
- Compound indexing only applies to SdsTypes. In other words, there is no compound indexing for secondary indexes that are on SdsStreams. For more information, see [SdsStreams](xref:sdsStreams#indexes).  
- The examples below are for compound indexes on SdsTypes and not of secondary indexes on SdsStreams.


**REST API**
```text
// Read data located between two compound indexes:
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data?startIndex={firstIndex|secondIndex|thirdIndex}&endIndex={firstIndex|secondIndex|thirdIndex}
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data?startIndex={firstIndex|secondIndex}&endIndex={firstIndex|secondIndex}

// Delete data with a compound index:
DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data?index={firstIndex|secondIndex}
DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data?startIndex={firstIndex|secondIndex|thirdIndex}&endIndex={firstIndex|secondIndex|thirdIndex}
```
**.NET examples**
```csharp
// Read data located between two compound indexes:
IEnumerable<DerivedCompoundIndex> compoundValues = await client.GetWindowValuesAsync<DerivedCompoundIndex>(compoundStream.Id, 1/20/2017 01:00|1/20/2017 00:00, 1/20/2017 02:00|1/20/2017 14:00);

// Remove data with a compound index:
Task RemoveValueAsync(compoundStream.Id, 1/20/2017 01:00|1/20/2017 00:00);
```


## Work with indexes
### Indexes in .NET framework
#### Simple indexes

When working in .NET, use the `SdsTypeBuilder` together with either the ``OSIsoft.Sds.SdsMemberAttribute`` (preferred) or the
``System.ComponentModel.DataAnnotations.KeyAttribute`` to identify the Property that defines the simple index. 
Using the `SdsTypeBuilder` eliminates potential errors that might occur when working with SdsTypes manually.

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

      SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();


To read data that is located between two indexes, define both a start index and 
an end index. For `DateTime`, use the ISO 8601 representation of dates and times. For example, to query 
for a window of simple values between January 1, 2010 and February 1, 2010, you can define indexes 
and query as follows:

      IEnumerable<Simple> values = await
      client.GetWindowValuesAsync<Simple>(simpleStream.Id,
      "2010-01-01T08:00:00.000Z","2010-02-01T08:00:00.000Z");


For more information about querying data, see [Read data](xref:sdsReadingData).

#### Secondary indexes
Secondary indexes are defined at the SdsStream. To add indexes to an SdsStream, you add them to the SdsStream’s `Indexes` field.

For example, to add a second index on `Measurement`, use the following code:

      SdsStreamIndex measurementIndex = new SdsStreamIndex()
      {
          SdsTypePropertyId = simpleType.Properties.First(p => p.Id.Equals("Measurement")).Id
      };
      SdsStream secondary = new SdsStream()
      {
          Id = "Simple with Secondary",
          TypeId = simpleType.Id,
          Indexes = new List<SdsStreamIndex>()
          {
              measurementIndex
          }
      };
      secondary = await config.GetOrCreateStreamAsync(secondary);


To read data indexed by a secondary index, use a filtered `Get` call, as in the following:

      await client.UpdateValuesAsync<Simple>(secondary.Id, new List<Simple>()
        {
            new Simple()
            {
                Time = time,
                State = State.Ok,
                Measurement = 5
            },
            new Simple()
            {
                Time = time + TimeSpan.FromSeconds(1),
                State = State.Ok,
                Measurement = 4
            },
            new Simple()
            {
                Time = time + TimeSpan.FromSeconds(2),
                State = State.Ok,
                Measurement = 3
            },
            new Simple()
            {
                Time  = time + TimeSpan.FromSeconds(3),
                State = State.Ok,
                Measurement = 2
            },
            new Simple()
            {
                Time = time + TimeSpan.FromSeconds(4),
                State = State.Ok,
                Measurement = 1
            },
        });

      IEnumerable<Simple> orderedByKey = await client.GetWindowValuesAsync<Simple>(secondary.Id, 
          time.ToString("o"), time.AddSeconds(4).ToString("o"));
      foreach (Simple value in orderedByKey)
          Console.WriteLine("{0}: {1}", value.Time, value.Measurement);

      Console.WriteLine();

      IEnumerable<Simple> orderedBySecondary = await client.GetFilteredValuesAsync<Simple>(secondary.Id, 
      "Measurement gt 0 and Measurement lt 6");
      foreach (Simple value in orderedBySecondary)
          Console.WriteLine("{0}: {1}", value.Time, value.Measurement);
      Console.WriteLine();

      // Output:
      // 1/20/2017 12:00:00 AM: 5
      // 1/20/2017 12:00:01 AM: 4
      // 1/20/2017 12:00:02 AM: 3
      // 1/20/2017 12:00:03 AM: 2
      // 1/20/2017 12:00:04 AM: 1
      //
      // 1/20/2017 12:00:04 PM: 1
      // 1/20/2017 12:00:03 PM: 2
      // 1/20/2017 12:00:02 PM: 3
      // 1/20/2017 12:00:01 PM: 4
      // 1/20/2017 12:00:00 PM: 5


#### Compound indexes
Compound indexes are defined using the `SdsMemberAttribute` as follows:

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


Events of type `DerivedCompoundIndex` are sorted first by the `Time` parameter and then by the `Recorded` parameter.
A collection of times would be sorted as follows:


| **Time**   | **Recorded**   | **Measurement**   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 01:00      | 01:00          | 2                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 00:00          | 1                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 02:00      | 14:00          | 6                 |

If the `Order` parameter was reversed, with `Recorded` set to 0 and `Time` set to 1, the results would be sorted as follows:

| **Time**   | **Recorded**   | **Measurement**   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 02:00      | 00:00          | 1                 |
| 01:00      | 01:00          | 2                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 14:00          | 6                 |

      // estimates at 1/20/2017 00:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 01:00"),
                Recorded = DateTime.Parse("1/20/2017 00:00"),
                State = State.Ok,
                Measurement = 0
            },
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 00:00"),
                State = State.Ok,
                Measurement = 1
            },
        });

      // measure and estimates at 1/20/2017 01:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 01:00"),
                Recorded = DateTime.Parse("1/20/2017 01:00"),
                State = State.Ok,
                Measurement = 2
            },
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 01:00"),
                State = State.Ok,
                Measurement = 3
            },
        });

      // measure at 1/20/2017 02:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 02:00"),
                State = State.Ok,
                Measurement = 4
            },
        });

      // adjust earlier values at 1/20/2017 14:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 01:00"),
                Recorded = DateTime.Parse("1/20/2017 14:00"),
                State = State.Ok,
                Measurement = 5
            },
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 14:00"),
                State = State.Ok,
                Measurement = 6
            },
        });

      var from = new Tuple<DateTime, DateTime>(DateTime.Parse("1/20/2017 01:00"), DateTime.Parse("1/20/2017 00:00"));
      var to = new Tuple<DateTime, DateTime>(DateTime.Parse("1/20/2017 02:00"), DateTime.Parse("1/20/2017 14:00"));

      var compoundValues = await client.GetWindowValuesAsync<DerivedCompoundIndex, DateTime, DateTime>(compoundStream.Id, from, to);

      foreach (DerivedCompoundIndex value in compoundValues)
         Console.WriteLine("{0}:{1} {2}", value.Time, value.Recorded, value.Measurement);

      // Output:
      // 1/20/2017 1:00:00 AM:1/20/2017 12:00:00 AM 0
      // 1/20/2017 1:00:00 AM:1/20/2017 1:00:00 AM 2
      // 1/20/2017 1:00:00 AM:1/20/2017 2:00:00 PM 5
      // 1/20/2017 2:00:00 AM:1/20/2017 12:00:00 AM 1
      // 1/20/2017 2:00:00 AM:1/20/2017 1:00:00 AM 3
      // 1/20/2017 2:00:00 AM:1/20/2017 2:00:00 AM 4
      // 1/20/2017 2:00:00 AM:1/20/2017 2:00:00 PM 6

Note that the ``GetWindowValuesAsync()`` call specifies an expected return type and the index types as generic parameters.

### Indexes outside of .NET framework
#### Simple indexes
When the .NET `SdsTypeBuilder` is unavailable, indexes must be built manually.

Below, SdsTypes defined in the [Python](https://github.com/osisoft/OSI-Samples-OCS/tree/master/basic_samples/SDS/Python)
and [Java Script](https://github.com/osisoft/OSI-Samples-OCS/tree/master/basic_samples/SDS/JavaScript)
samples are shown. For samples in other languages, go to [OCS code samples in GitHub](https://github.com/osisoft/OSI-Samples-OCS/tree/master/basic_samples/SDS).

To build an SdsType representation of sample classes in Python and Java Script, see [Sample](#sample) below:

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
        Alarm: 2
      }

      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }

##### **Sample**
The following code is used to build an SdsType representation of the sample class above:

**Python**


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

      # State is not a pre-defined type. An SdsType must be defined to represent the enum
      stateTypePropertyOk = SdsTypeProperty()
      stateTypePropertyOk.Id = "Ok"
      stateTypePropertyOk.Measurement = State.Ok
      stateTypePropertyWarning = SdsTypeProperty()
      stateTypePropertyWarning.Id = "Warning"
      stateTypePropertyWarning.Measurement = State.Warning
      stateTypePropertyAlarm = SdsTypeProperty()
      stateTypePropertyAlarm.Id = "Alarm"
      stateTypePropertyAlarm.Measurement = State.Alarm

      stateType = SdsType()
      stateType.Id = "State"
      stateType.Name = "State"
      stateType.Properties = [ stateTypePropertyOk, stateTypePropertyWarning,\
                             stateTypePropertyAlarm ]
      state = SdsTypeProperty()
      state.Id = "State"
      state.Name = "State"
      state.SdsType = stateType

      # Measurement property is a simple non-indexed, pre-defined type
      measurement = SdsTypeProperty()
      measurement.Id = "Measurement"
      measurement.Name = "Measurement"
      measurement.SdsType = SdsType()
      measurement.SdsType.Id = "Double"
      measurement.SdsType.Name = "Double"

      # Create the Simple SdsType
      simple = SdsType()
      simple.Id = str(uuid.uuid4())
      simple.Name = "Simple"
      simple.Description = "Basic sample type"
      simple.SdsTypeCode = SdsTypeCode.Object
      simple.Properties = [ time, state, measurement ]


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

      // State is not a pre-defined type. A SdsType must be defined to represent the enum
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

      // Value property is a simple non-indexed, pre-defined type
      var valueProperty = new SdsObjects.SdsTypeProperty({
        "Id": "Value",
        "SdsType": new SdsObjects.SdsType({
          "Id": "doubleType",
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Double
        })
      });

      // Create the Simple SdsType
      var simpleType = new SdsObjects.SdsType({
        "Id": "Simple",
        "Name": "Simple",
        "Description": "This is a simple Sds type",
        "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
        "Properties": [timeProperty, stateProperty, valueProperty]
      });


The `Time` property is identified as the primary index by defining its SdsTypeProperty as follows:

**Python**


      # Time is the primary index
      time = SdsTypeProperty()
      time.Id = "Time"
      time.Name = "Time"
      time.IsKey = True
      time.SdsType = SdsType()
      time.SdsType.Id = "DateTime"
      time.SdsType.Name = "DateTime"
      time.SdsType.SdsTypeCode = SdsTypeCode.DateTime

**JavaScript**


      // Time is the primary index
      var timeProperty = new SdsObjects.SdsTypeProperty({
        "Id": "Time",
        "IsKey": true,
        "SdsType": new SdsObjects.SdsType({
          "Id": "dateType",
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
        })
      });



Note that the `time.IsKey` field is set to true.

To read data using the index, you define a start index and an end index. For `DateTime`, use 
the ISO 8601 representation of dates and times. To query for a window of values between January 1, 
2010 and February 1, 2010, you would define indexes as “2010-01-01T08:00:00.000Z” and 
“2010-02-01T08:00:00.000Z”, respectively.

For additional information, see [Read data](xref:sdsReadingData).

#### Secondary indexes
Secondary indexes are defined at the SdsStream. To create an SdsStream 
using the `Simple` class and adding a secondary index on the `Measurement`, 
you use the previously defined SdsType. Then you create `SdsStreamIndex` 
specifying the `Measurement` property and define an SdsStream identifying the 
`Measurement` as the secondary index as shown below:


**Python**


      # Create the properties

      measurementIndex = SdsStreamIndex()
      measurementIndex.SdsTypePropertyId = measurement.Id

      stream = SdsStream()
      stream.Id = str(uuid.uuid4())
      stream.Name = "SimpleWithSecond"
      stream.Description = "Simple with secondary index"
      stream.TypeId = simple.Id
      stream.Indexes = [ measurementIndex ]



**JavaScript**


      var measurementIndex = new SdsObjects.SdsStreamIndex({
        "SdsTypePropertyId": valueProperty.Id
      });

      var stream = new SdsObjects.SdsStream({
        "Id": "SimpleWithSecond",
        "Name": "SimpleWithSecond",
        "Description": "Simple with secondary index",
        "TypeId": simpleTypeId,
        "Indexes": [ measurementIndex ]
      });


#### Compound indexes
Consider the following Python and JavaScript types:

**Python**


      class Simple(object):
      # First-order index property
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
      # Second-order index property
      @property
      def Recorded(self):
        return self.__recorded
      @Recorded.setter
      def Recorded(self, recorded):
        self.__recorded = recorded


**JavaScript**


      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }

      var DerivedCompoundIndex = function() {
        Simple.call(this);
        this.Recorded = null;
      }


To turn the simple SdsType shown in the example into a type supporting the `DerivedCompoundIndex` 
type with a compound index based on the ``Simple.Time`` and ``DerivedCompoundIndex.Recorded``, 
extend the SdsType as follows:

**Python**


      # We set the order for this property. The order of the first property defaulted to 0
      recorded = SdsTypeProperty()
      recorded.Id = "Recorded"
      recorded.Name = "Recorded"
      recorded.IsKey = True
      recorded.Order = 1
      recorded.SdsType = SdsType()
      recorded.SdsType.Id = "DateTime"
      recorded.SdsType.Name = "DateTime"
      recorded.SdsType.SdsTypeCode = SdsTypeCode.DateTime

      # Create the Derived SdsType
      derived = SdsType()
      derived.Id = str(uuid.uuid4())
      derived.Name = "Compound"
      derived.Description = "Derived compound index sample type"
      derived.BaseType = simple
      derived.SdsTypeCode = SdsTypeCode.Object
      derived.Properties = [ recorded ]



**JavaScript**  

      // We set the order for this property. The order of the first property defaulted to 0
      var recordedProperty = new SdsObjects.SdsTypeProperty({
        "Id": "Recorded",
        "Name": "Recorded",
        "IsKey": true,
        "Order": 1,
        "SdsType": new SdsObjects.SdsType({
          "Id": "DateTime",
          "Name": "DateTime",
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
        })
      });

      // Create the Derived SdsType
      var derivedType = new SdsObjects.SdsTyp({
        "Id": "Compound",
        "Name": "Compound",
        "Description": "Derived compound index sample type",
        "BaseType": simpleType,
        "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
        "Properties": [recordedProperty]
      });


Data in the SdsStream will be ordered as follows:

| **Time**   | **Recorded**   | **Measurement**   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 01:00      | 01:00          | 2                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 00:00          | 1                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 02:00      | 14:00          | 6                 |

If the `Order` parameters were reversed with `Recorded` set to 0 and `Time` set to 1, the results would be sorted as follows:

| **Time**   | **Recorded**   | **Measurement**   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 02:00      | 00:00          | 1                 |
| 01:00      | 01:00          | 2                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 14:00          | 6                 |
