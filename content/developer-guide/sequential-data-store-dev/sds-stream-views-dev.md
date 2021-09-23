---
uid: sdsStreamViews
---

# Stream views
Stream views provide flexibility in the use of types and allow you to expose data as a different type. While you cannot actually change the properties of types themselves, the stream views feature enables you to create a view of a selected stream that appears as if you had changed the type on which it is based. You create a stream view by choosing a source and target type then a set of mappings between properties of those two types. Using a stream view to leverage existing type properties is preferable to creating a new type, because the stream that is based on the type continues to function with its previously archived stream data intact. For more information, see [Update Stream Type](xref:sds-streams#update-stream-type).

## Stream views API
[Stream views API](xref:sds-stream-views)
 
## SdsStreamView fields and properties table
<a name="streamviewpropertiestable"></a>
The following table shows the required and optional SdsStreamView fields. Fields that are not included are reserved for internal SDS use. 
See [Search in SDS](xref:sdsSearching#search-for-stream-views) for limitations on search.

| Property     | Data Type              | Required    | Searchable | Description |
|--------------|------------------------|-------------|------------|---------|
| Id           | String                 | Yes          | Yes		   |Identifier for referencing the stream view |
| Name         | String                 | No        | Yes		   |Friendly name |
| Description  | String                 | No     | Yes		   |Description text |
| SourceTypeId | String                 | Yes    | Yes		   |Identifier of the SdsType of the SdsStream |
| TargetTypeId | String                 | Yes    | Yes		   |Identifier of the SdsType to convert events to |
| Properties   | IList\<SdsStreamViewProperty\> | No    | Yes, with limitations*	  |Property-level mapping |

> [!NOTE]
> SdsStreamViewProperty objects are not searchable.
> Only the SdsStreamViewProperty's SdsStreamView is searchable by its `Id`, `SourceTypeId`, and `TargetTypeId`, which are used to return the top level SdsStreamView object when searching.
> The same is true for nested SdsStreamViewProperties. For more information, see [search for stream views](xref:sdsSearching#search-for-stream-views).

**Rules for the Stream View Identifier (SdsStreamView.Id)**  

1. Is not case sensitive
2. Cannot just be whitespace
3. Cannot contain leading or trailing whitespace
4. Cannot contain forward slash ("/")
5. Can contain a maximum of 100 characters

## SdsStreamView mapping

SDS automatically maps properties from the source to the target type when it is straightforward. For example:
 - The properties are in the same position
 - The properties are of the same data type
 - The properties are of the same name

When SDS is unable to determine how to map a property of the source type, the property is removed. 
If a property of the target type cannot map to the source property, SDS adds a property that is configured with a default value.
To map a property that is beyond the ability of SDS to map on its own, you should define an [SdsStreamViewProperty](#sdsstreamviewproperty) 
and add it to the SdsStreamView’s properties collection.
SDS largely supports mapping within the same data type. 

**Mapping compatibility chart**

| Source type\ Target type    | Numeric types 	| Nullable numeric types 	| Enumeration types 	| Nullable enumeration types 	| Object types    	| 
|----------------------------	|---------------	|------------------------	|-------------------	|----------------------------	|--------------------|
| Numeric types              	| Yes           	| Yes                    	| No                	| No                         	| No                 |
| Nullable numeric types     	| Yes           	| Yes                    	| No                	| No                         	| No                 |
| Enumeration types          	| No            	| No                     	| Yes               	| Yes                        	| No                 |
| Nullable enumeration types 	| No            	| No                     	| Yes               	| Yes                        	| No                 | 
| Object types               	| No            	| No                     	| No                	| No                         	| Yes*               |

\* Mappable if `typeId` matches between the source and the target type  

### SdsStreamViewProperty

The SdsStreamView properties collection provides detailed instructions for specifying the mapping of 
event properties. Each SdsStreamViewProperty in the properties collection defines the mapping of an 
event’s property. SdsStreamView properties are required only when property mapping is not straightforward. 
If you do not want a particular SdsType property in the source type to be mapped, there is no need to create a property for it.

The following table shows the required and optional SdsStreamViewProperty fields.

| Property | Data Type    | Required | Description |
|----------|---------|-------------|---------|
| SourceId | String  | Yes    | Identifier of the SdsTypeProperty from the source SdsType Properties list |
| TargetId | String  | Yes    | Identifier of the SdsTypeProperty from the target SdsType Properties list |
| SdsStreamView  | SdsStreamView | No    | Additional mapping instructions for derived types |

The SdsStreamView field supports nested properties.

### SdsStreamViewMap
When an SdsStreamView is added, SDS defines a plan mapping. Plan details are retrieved as an SdsStreamViewMap. 
The SdsStreamViewMap provides a detailed property-by-property definition of the mapping. 

The table below shows the SdsStreamViewMap fields. The SdsStreamViewMap cannot be written to the SDS, 
so required and optional have no meaning.

| Property     | Data Type                     | Required  | Description |
|--------------|--------------------------|--------------|---------|
| SourceTypeId | String                   | Yes     | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String                   | Yes     | Identifier of the SdsType to convert events to |
| Properties   | IList\<SdsStreamViewMapProperty\>| No     | Property-level mapping |

### SdsStreamViewMapProperty
The SdsStreamViewMapProperty is similar to SdsStreamViewProperty but adds a `mode` detailing one or more actions taken on 
the property.

The table below shows the SdsStreamViewMapProperty fields. The SdsStreamViewMap cannot be written; it can only be 
retrieved from the SDS, so required and optional have no meaning.

| Property     | Data Type        | Description |
|--------------|-------------|---------|
| SourceTypeId | String      | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String      | Identifier of the SdsType to convert events to |
| Mode         | SdsStreamViewMode | Aggregate of actions applied to the properties. SdsStreamViewModes are combined via binary arithmetic |
| SdsStreamViewMap   | SdsStreamViewMap  | Mapping for derived types |

**SdsStreamViewMode table**

| Name                   | Value  | Description |
|------------------------|--------|-------------|
| None                   | 0x0000 | No action   |
| FieldAdd               | 0x0001 | Add a property matching the specified SdsTypeProperty |
| FieldRemove            | 0x0002 | Remove the property matching the specified SdsTypeProperty |
| FieldRename            | 0x0004 | Rename the property matching the source SdsTypeProperty to the target SdsTypeProperty |
| FieldMove              | 0x0008 | Move the property from the location in the source to the location in the target|
| FieldConversion        | 0x0016 | Convert the source property to the target type |
| InvalidFieldConversion | 0x0032 | Cannot perform the specified mapping |

## Getting started with SdsStreamViews

To work with stream views, you first need to have types, streams and streams data defined. 
Here's a simplified procedure for working with the stream view. 
For code examples, see [Work with SdsStreamViews in .NET framework](#work-with-sdsstreamviews-in-net-framework)
 and [Work with SdsStreamViews outside of .NET framework](#work-with-sdsstreamviews-outside-of-net-framework) below. 

1. Create a type that will be the source type. 
2. Create a stream that is of the type defined in step 1.
3. Write data into the stream that was created in step 2.
4. Read data from the stream to verify.
5. Create another type that will be the target type.
6. Create a stream view using the source type (step 1) and the target type (step 5).  
    - The mapping between the source and the target type happens automatically if you do not specify it in [SdsStreamViewProperty](#sdsstreamviewproperty).
7. Get [SdsStreamViewMap](xref:sds-stream-views#get-stream-view-map) to see how properties are mapped.
8. Read data from the stream with the stream view to verify. For more information, see [Reading with SdsStreamViews](xref:sdsReadingData#reading-with-sdsstreamviews).
   

## Work with SdsStreamViews in .NET framework

**Using .NET**

When working in .NET, use the SDS client libraries method `ISdsMetadataService`.

Given the following:
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
    public State State { get; set; }
    public double Measurement { get; set; }
}

SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
simpleType.Id = "Simple";
simpleType.Name = "Simple";
await config.GetOrCreateTypeAsync(simpleType);

SdsStream simpleStream = await config.GetOrCreateStreamAsync(new SdsStream()
{
    Id = "Simple",
    Name = "Simple",
    TypeId = simpleType.Id
});

DateTime start = new DateTime(2017, 4, 1).ToUniversalTime();

for (int i = 0; i < 10; i++)
{
    Simple value = new Simple()
    {
        Time = start + TimeSpan.FromMinutes(i),
        State = State.Warning,
        Measurement = i
    };
    await client.InsertValueAsync(simpleStream.Id, value);
}

IEnumerable<Simple> simpleValues = await client.GetWindowValuesAsync<Simple>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"));
foreach (Simple value in simpleValues)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Measurement}");

// The example displays the following output:
//  4 / 1 / 2017 7:00:00 AM: Warning, 0
//  4 / 1 / 2017 7:01:00 AM: Warning, 1
//  4 / 1 / 2017 7:02:00 AM: Warning, 2
//  4 / 1 / 2017 7:03:00 AM: Warning, 3
//  4 / 1 / 2017 7:04:00 AM: Warning, 4
//  4 / 1 / 2017 7:05:00 AM: Warning, 5
//  4 / 1 / 2017 7:06:00 AM: Warning, 6
//  4 / 1 / 2017 7:07:00 AM: Warning, 7
//  4 / 1 / 2017 7:08:00 AM: Warning, 8
//  4 / 1 / 2017 7:09:00 AM: Warning, 9
```

To map the ``Measurement`` property to a property in the same location of the same type, allow SDS to 
automatically determine mapping.
```csharp
public class Simple1
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public double Value { get; set; }
}

SdsType simple1Type = SdsTypeBuilder.CreateSdsType<Simple1>();
simple1Type.Id = "Simple1";
simple1Type.Name = "Simple1";
simple1Type = await config.GetOrCreateTypeAsync(simple1Type);

SdsStreamView view = new SdsStreamView()
{
    Id = "StreamView",
    Name = "StreamView",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple1Type.Id,
};
view = await config.GetOrCreateStreamViewAsync(view);

SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();

IEnumerable<Simple1> simple1Values = await client.GetWindowValuesAsync<Simple1>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple1 value in simple1Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Value}");

// The example displays the following output:
//    Simple to Simple1
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to Value - FieldRename
//
//  4 / 1 / 2017 7:00:00 AM: Warning, 0
//  4 / 1 / 2017 7:01:00 AM: Warning, 1
//  4 / 1 / 2017 7:02:00 AM: Warning, 2
//  4 / 1 / 2017 7:03:00 AM: Warning, 3
//  4 / 1 / 2017 7:04:00 AM: Warning, 4
//  4 / 1 / 2017 7:05:00 AM: Warning, 5
//  4 / 1 / 2017 7:06:00 AM: Warning, 6
//  4 / 1 / 2017 7:07:00 AM: Warning, 7
//  4 / 1 / 2017 7:08:00 AM: Warning, 8
//  4 / 1 / 2017 7:09:00 AM: Warning, 9
```

A quick look at the SdsStreamViewMap shows that SDS was able to determine that mapping from `Measurement` 
to `Value` resulted in renaming.

SDS can also determine mapping of properties of the same name but different type. Note that the 
location of the `Measurement` property is also different yet it is still mapped.
```csharp
public class Simple2
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public int Measurement { get; set; }
    public State State { get; set; }
}

SdsType simple2Type = SdsTypeBuilder.CreateSdsType<Simple2>();
simple2Type.Id = "Simple2";
simple2Type.Name = "Simple2";
simple2Type = await config.GetOrCreateTypeAsync(simple2Type);

SdsStreamView view = new SdsStreamView() 
{
    Id = "StreamView1",
    Name = "StreamView1",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple2Type.Id,
};
view = await config.GetOrCreateStreamViewAsync(view);

SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();

IEnumerable<Simple2> simple2Values = await client.GetWindowValuesAsync<Simple2>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple2 value in simple2Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Measurement}");

//The example displays the following output:
//    Simple to Simple2
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to Measurement - FieldConversion
//
//    4 / 1 / 2017 7:00:00 AM: Warning, 0
//    4 / 1 / 2017 7:01:00 AM: Warning, 1
//    4 / 1 / 2017 7:02:00 AM: Warning, 2
//    4 / 1 / 2017 7:03:00 AM: Warning, 3
//    4 / 1 / 2017 7:04:00 AM: Warning, 4
//    4 / 1 / 2017 7:05:00 AM: Warning, 5
//    4 / 1 / 2017 7:06:00 AM: Warning, 6
//    4 / 1 / 2017 7:07:00 AM: Warning, 7
//    4 / 1 / 2017 7:08:00 AM: Warning, 8
//    4 / 1 / 2017 7:09:00 AM: Warning, 9
```

The SdsStreamViewMap shows that the source `Measurement` floating point is converted to integer in the target.

When neither the field name, the field type or location matches, SDS does not determine mapping. 
The source is eliminated, target is added and assigned the default value.
```csharp
public class Simple3
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public int Value { get; set; }
}

SdsType simple3Type = SdsTypeBuilder.CreateSdsType<Simple3>();
simple3Type.Id = "Simple3";
simple3Type.Name = "Simple3";
simple3Type = await config.GetOrCreateTypeAsync(simple3Type);

SdsStreamView view = new SdsStreamView()
{
    Id = "StreamView2",
    Name = "StreamView2",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple3Type.Id,
};
view = await config.GetOrCreateStreamViewAsync(view);

SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();

IEnumerable<Simple3> simple3Values = await client.GetWindowValuesAsync<Simple3>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple3 value in simple3Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Value}");

//The example displays the following output:
//    Simple to Simple3
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to  -FieldRemove
//        3)  to Value -FieldAdd
//
// 4 / 1 / 2017 7:00:00 AM: Warning, 0
// 4 / 1 / 2017 7:01:00 AM: Warning, 0
// 4 / 1 / 2017 7:02:00 AM: Warning, 0
// 4 / 1 / 2017 7:03:00 AM: Warning, 0
// 4 / 1 / 2017 7:04:00 AM: Warning, 0
// 4 / 1 / 2017 7:05:00 AM: Warning, 0
// 4 / 1 / 2017 7:06:00 AM: Warning, 0
// 4 / 1 / 2017 7:07:00 AM: Warning, 0
// 4 / 1 / 2017 7:08:00 AM: Warning, 0
// 4 / 1 / 2017 7:09:00 AM: Warning, 0
```

To map when SDS cannot determine mapping, use SdsStreamView `Properties`.
```csharp
SdsStreamView view = new SdsStreamView()
{
    Id = "SteamView3",
    Name = "StreamView3",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple3Type.Id,
    Properties = new List<SdsStreamViewProperty>()
    {
        new SdsStreamViewProperty()
        {
            SourceId = "Time",
            TargetId = "Time"
        },
        new SdsStreamViewProperty()
        {
            SourceId = "State",
            TargetId = "State"
        },
        new SdsStreamViewProperty()
        {
            SourceId = "Measurement",
            TargetId = "Value"
        }
    }
};
view = await config.GetOrCreateStreamViewAsync(view);

SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();

IEnumerable<Simple3> simple3Values = await client.GetWindowValuesAsync<Simple3>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple3 value in simple3Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Value}");

//The example displays the following output:
//    Simple to Simple3
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to Value - FieldRename, FieldConversion
//
//    4 / 1 / 2017 7:00:00 AM: Warning, 0
//    4 / 1 / 2017 7:01:00 AM: Warning, 1
//    4 / 1 / 2017 7:02:00 AM: Warning, 2
//    4 / 1 / 2017 7:03:00 AM: Warning, 3
//    4 / 1 / 2017 7:04:00 AM: Warning, 4
//    4 / 1 / 2017 7:05:00 AM: Warning, 5
//    4 / 1 / 2017 7:06:00 AM: Warning, 6
//    4 / 1 / 2017 7:07:00 AM: Warning, 7
//    4 / 1 / 2017 7:08:00 AM: Warning, 8
//    4 / 1 / 2017 7:09:00 AM: Warning, 9
```

## Work with SdsStreamViews outside of .NET framework

When working with SdsStreamViews and not using .NET, either invoke HTTP methods directly or use the code samples. Both Python and JavaScript samples have SdsStreamView definitions.

JSON representation for a simple mapping between a source type with identifier `Simple` and a target 
type with identifier `Simple1` would appear as follows:
```json
{  
  "Id":"StreamView",
  "Name":"StreamView",
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1"
}
```

The SdsStreamViewMap would appear as follows:

```json
{  
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1",
  "Properties":[  
      {  
        "SourceId":"Time",
        "TargetId":"Time"
      },
      {  
        "SourceId":"State",
        "TargetId":"State"
      },
      {  
        "SourceId":"Measurement",
        "TargetId":"Value",
        "Mode":4
      }
  ]
}
```


