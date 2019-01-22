---
uid: sdsViews
---

Stream Views
=========

An SdsStreamView provides a way to map Stream data requests from one data type to another. You can apply 
a Stream View to any read or GET operation. SdsStreamView is used to specify the mapping between source and target types.

Sds attempts to determine how to map Properties from the source to the destination. When the mapping 
is straightforward, such as when the properties are in the same position and of the same data type, 
or when the properties have the same name, SDS will map the properties automatically.

When SDS is unable to determine how to map a source property, the property is removed. If SDS encounters 
a target property that it cannot map to, the property is added and configured with a default value.

To map a property that is beyond the ability of Sds to map on its own, you should define an SdsStreamViewProperty 
and add it to the SdsStreamView’s Properties collection.

The following table shows the required and optional SdsStreamView fields. Fields that are not included are reserved for internal Sds use.

| Property     | Type                   | Optionality | Details |
|--------------|------------------------|-------------|---------|
| Id           | String                 | Required    | Identifier for referencing the stream view |
| Name         | String                 | Optional    | Friendly name |
| Description  | String                 | Optional    | Description text |
| SourceTypeId | String                 | Required    | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String                 | Required    | Identifier of the SdsType to convert events to |
| Properties   | IList<SdsStreamViewProperty> | Optional    | Property level mapping |


**Rules for type identifier**

1. Is not case sensitive
2. Can contain spaces
3. Cannot begin with two underscores ("\_\_")
4. Cannot contain forward slash or backslash characters ("/" or "\\")
5. Can contain a maximum of 100 characters
6. Cannot start or end with a period.
7. Cannot contain consecutive periods.
8. Cannot consist of only periods.


Properties / SdsStreamViewProperty
---------------------------

The SdsStreamView Properties collection provides detailed instructions for specifying the mapping of 
event properties. Each SdsStreamViewProperty in the Properties collection defines the mapping of an 
event’s property. SdsStreamView Properties are required only when property mapping is not straightforward. 
Additionally, if you do not want a type property mapped, it is not necessary to create a SdsStreamView 
property for it.

The following table shows the required and optional SdsStreamViewProperty fields.

| Property | Type    | Optionality | Details |
|----------|---------|-------------|---------|
| SourceId | String  | Required    | Identifier of the SdsTypeProperty from the source SdsType Properties list |
| TargetId | String  | Required    | Identifier of the SdsTypeProperty from the target SdsType Properties list |
| SdsStreamView  | SdsStreamView | Optional    | Additional mapping instructions for derived types |

The SdsStreamView field supports nested Properties.

SdsStreamViewMap
----------

When a SdsStreamView is added, Sds defines a plan mapping. Plan details are retrieved as a SdsStreamViewMap. 
The SdsStreamViewMap provides a detailed Property-by-Property definition of the mapping. 

The following table shows the SdsStreamViewMap fields. The SdsStreamViewMap cannot be written to Sds, 
so required and optional have no meaning.

| Property     | Type                     | Optionality  | Details |
|--------------|--------------------------|--------------|---------|
| SourceTypeId | String                   | Required     | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String                   | Required     | Identifier of the SdsType to convert events to |
| Properties   | IList<SdsStreamViewMapProperty>| Optional     | Property level mapping |

Properties / SdsStreamViewMapProperty
------------------------------

The SdsStreamViewMapProperty is similar a SdsStreamViewProperty but adds a Mode detailing one or more actions taken on 
the Property.

The following table shows the SdsStreamViewMapProperty fields. The SdsStreamViewMap cannot be written; it can only be 
retrieved from Sds, so required and optional have no meaning.

| Property     | Type        | Details |
|--------------|-------------|---------|
| SourceTypeId | String      | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String      | Identifier of the SdsType to convert events to |
| Mode         | SdsStreamViewMode | Aggregate of actions applied to the properties. SdsStreamViewModes are combined via binary arithmetic |
| SdsStreamViewMap   | SdsStreamViewMap  | Mapping for derived types |

The available SdsStreamViewModes are shown in the table below.

| Name                   | Value  | Description |
|------------------------|--------|-------------|
| None                   | 0x0000 | No action   |
| FieldAdd               | 0x0001 | Add a property matching the specified SdsTypeProperty |
| FieldRemove            | 0x0002 | Remove the property matching the specified SdsTypeProperty |
| FieldRename            | 0x0004 | Rename the property matching the source SdsTypeProperty to the target SdsTypeProperty |
| FieldMove              | 0x0008 | Move the property from the location in the source to the location in the target|
| FieldConversion        | 0x0016 | Converts the source property to the target type |
| InvalidFieldConversion | 0x0032 | Cannot perform the specified mapping |

Changing Stream Type
--------------------

Stream Views can be used to change the Type defining a Stream. You cannot modify the SdsType; types are immutable. 
But you can map a stream from its current type to a new type.

To update a Stream Type, define an SdsStreamView and PUT the stream view to the following:

       api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Type?streamViewId={streamViewId}


For details, see [SdsStreamView API](#sds-views). 

Working with Stream Views when using .NET
------------------------------------

**Using .Net**

When working in .NET, use the Sds Client libraries’ ISdsMetadataService.

Given the following:

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
    await config.GetOrCreateTypeAsync(simpleType);//.CreateOrUpdateTypeAsync(simpleType);//.GetOrCreateTypeAsync(simpleType);

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


To map the Measurement property to a property in the same location of the same type, allow Sds to 
automatically determine mapping.

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

A quick look at the SdsStreamViewMap shows that Sds was able to determine that mapping from Measurement 
to Value involved a rename.

Sds can also determine mapping of properties of the same name but different type. Note that the 
location of the Measurement property is also different yet it is still mapped.

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

    view = new SdsStreamView() 
    {
        Id = "StreamView1",
        Name = "StreamView1",
        SourceTypeId = simpleType.Id,
        TargetTypeId = simple2Type.Id,
    };
    view = await config.GetOrCreateStreamViewAsync(view);

    map = await config.GetStreamViewMapAsync(view.Id);
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

The SdsStreamViewMap shows that the source, floating point Measurement is converted to the target, integer Measurement.

When neither the field name nor field type and location match, Sds does not determine mapping. 
The source is eliminated and target is added and assigned the default value.

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

    view = new SdsStreamView()
    {
        Id = "StreamView2",
        Name = "StreamView2",
        SourceTypeId = simpleType.Id,
        TargetTypeId = simple3Type.Id,
    };
    view = await config.GetOrCreateStreamViewAsync(view);

    map = await config.GetStreamViewMapAsync(view.Id);
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


To map when Sds cannot determine mapping, use SdsStreamView Properties.

    view = new SdsStreamView()
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
                SourceId = "Status",
                TargetId = "Status"
            },
            new SdsStreamViewProperty()
            {
                SourceId = "Measurement",
                TargetId = "Value"
            }
        }
    };
    view = await config.GetOrCreateStreamViewAsync(view);

    map = await config.GetStreamViewMapAsync(view.Id);
    Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
    for (int i = 0; i < map.Properties.Count; i++)
        Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
    Console.WriteLine();

    simple3Values = await client.GetWindowValuesAsync<Simple3>(simpleStream.Id, start.ToString("o"),
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


Working with SdsStreamViews when not using .NET
----------------------------------------

When working with Stream Views and not using .NET, either invoke HTTP directly or use some of 
the sample code. Both Python and JavaScript samples have SdsStreamView definitions.

The JSON for a simple mapping between a source type with identifier Sample and a target 
type with identifier Sample1 would appear as follows.

    {  
      "Id":"StreamView",
      "Name":"StreamView",
      "SourceTypeId":"Simple",
      "TargetTypeId":"Simple1"
    }

The SdsStreamViewMap would appear as follows.


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


SdsStreamView API
-----------


The REST APIs provide programmatic access to read and write Sds data. The APIs in this section interact 
with SdsStreamViews. When working in .NET convenient Sds Client libraries are available. The ISdsMetadataService 
interface, accessed using the ``SdsService.GetMetadataService()`` helper, defines the available functions. 
See [SdsStreamView information](https://ocs-docs.osisoft.com/Documentation/SequentialDataStore/SDS_Views.html) for general SdsStreamView information.

***********************

``Get Stream View``
--------------

Returns the stream view corresponding to the specified streamViewId within a given namespace.


**Request**

        GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamViewId``
  The stream view identifier


**Response**

  The response includes a status code and a response body.


**Response body**

  The requested SdsStreamView.

  Sample response body:

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "Id":"StreamView",
         "Name":"StreamView",
         "SourceTypeId":"Simple",
         "TargetTypeId":"Simple3",
         "Properties":[  
            {  
               "SourceId":"Time",
               "TargetId":"Time"
            },
            {  
               "SourceId":"Status",
               "TargetId":"Status"
            },
            {  
               "SourceId":"Measurement",
               "TargetId":"Value"
            }
         ]
      }



**.NET Library**

      Task<SdsStreamView> GetStreamViewAsync(string streamViewId);


**Security**

  Allowed for administrator and user accounts


***********************

``Get Stream View Map``
--------------

Returns the stream view map corresponding to the specified streamViewId within a given namespace.


**Request**

        GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/Map


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamViewId``
  The stream view identifier


**Response**

  The response includes a status code and a response body.


**Response body**

  The requested SdsStreamView.

  Sample response body:

      HTTP/1.1 200
      Content-Type: application/json

      {  
         "SourceTypeId":"Simple",
         "TargetTypeId":"Simple3",
         "Properties":[  
            {  
               "SourceId":"Time",
               "TargetId":"Time"
            },
            {  
               "SourceId":"Measurement",
               "TargetId":"Value",
               "Mode":20
            },
            {  
               "SourceId":"State",
               "Mode":2
            },
            {  
               "TargetId":"State",
               "Mode":1 
            }
         ]
      }



**.NET Library**

      Task<SdsStreamViewMap> GetStreamViewMapAsync(string streamViewId);


**Security**

  Allowed for administrator and user accounts


***********************

``Get Stream Views``
--------------

Returns a list of stream views within a given namespace.


**Request**

        GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews?skip={skip}&count={count}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``int skip``
  An optional value representing the zero-based offset of the first SdsStreamView to retrieve. 
  If not specified, a default value of 0 is used.
``int count``  
  An optional value representing the maximum number of SdsStreamViews to retrieve. If not specified, 
  a default value of 100 is used.

**Response**

  The response includes a status code and a response body.


**Response body**

  A collection of zero or more SdsStreamViews.


**.NET Library**

      Task<IEnumerable<SdsStreamView>> GetStreamViewsAsync(int skip = 0, int count = 100);


**Security**

  Allowed for administrator and user accounts


***********************

``Get or Create Stream View``
--------------

If a stream view with a matching identifier already exists, the stream view passed in is compared with the existing stream view.
If the stream views are identical, the stream view is returned. If the stream views are different, the Found (302) error is returned.

If no matching identifier is found, the specified stream view is created.  

**Request**

        POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamViewId``
  The stream view identifier. The identifier must match the ``SdsStreamView.Id`` field. 

The request content is the serialized SdsStreamView. If you are not using the Sds client libraries, using JSON is recommended.

**Response**

  The response includes a status code and a response body.


**Response body**

 The newly created or matching SdsStreamView.


**.NET Library**

      Task<SdsStreamView> GetOrCreateStreamViewAsync(SdsStreamView SdsStreamView);


**Security**

  Allowed for administrator accounts


***********************

``Create or Update Stream View``
--------------

Creates or updates the definition of a stream view. 

**Request**

        PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamViewId``
  The stream view identifier


**Response**

  The response includes a status code and a response body.


**Response body**

  The content is set to true on success.


**.NET Library**

      Task CreateOrUpdateStreamViewAsync(SdsStreamView SdsStreamView);


**Security**

  Allowed for administrator accounts



***********************

``Delete Stream View``
--------------

Deletes a stream view from the specified tenant and namespace.


**Request**

        GET	api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}


**Parameters**

``string tenantId``
  The tenant identifier
``string namespaceId``
  The namespace identifier
``string streamViewId``
  The stream view identifier


**Response**

  The response includes a status code.


**.NET Library**

      Task DeleteStreamViewAsync(string streamViewId);

**Security**

  Allowed for administrator accounts
