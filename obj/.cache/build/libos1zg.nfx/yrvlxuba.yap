<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Stream Views </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Stream Views ">
    <meta name="generator" content="docfx 2.39.2.0">
    
    <link rel="shortcut icon" href="../../favicon.ico">
    <link rel="stylesheet" href="../../styles/docfx.vendor.css">
    <link rel="stylesheet" href="../../styles/docfx.css">
    <link rel="stylesheet" href="../../styles/main.css">
    <meta property="docfx:navrel" content="../../toc.html">
    <meta property="docfx:tocrel" content="../toc.html">
    
    <meta property="docfx:rel" content="../../">
    
  </head>
  <body data-spy="scroll" data-target="#affix" data-offset="120">
    <div id="wrapper">
      <header>
        
        <nav id="autocollapse" class="navbar navbar-inverse ng-scope" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
              <a class="navbar-brand" href="../../index.html">
                <img id="logo" src="../../images/atlas_icon.png" alt="">
              </a>    </div>
            <div class="collapse navbar-collapse" id="navbar">
              <form class="navbar-form navbar-right" role="search" id="search">
                <div class="form-group">
                  <input type="text" class="form-control" id="search-query" placeholder="Search" autocomplete="off">
                </div>
              </form>
            </div>
          </div>
        </nav>
        
        <div class="subnav navbar navbar-default">
          <div class="container hide-when-search" id="breadcrumb">
            <ul class="breadcrumb">
              <li></li>
            </ul>
          </div>
        </div>
      </header>
      <div class="container body-content">
        
        <div id="search-results">
          <div class="search-list"></div>
          <div class="sr-items">
            <p><i class="glyphicon glyphicon-refresh index-loading"></i></p>
          </div>
          <ul id="pagination"></ul>
        </div>
      </div>
      <div role="main" class="container body-content hide-when-search">
        
        <div class="sidenav hide-when-search">
          <a class="btn toc-toggle collapse" data-toggle="collapse" href="#sidetoggle" aria-expanded="false" aria-controls="sidetoggle">Show / Hide Table of Contents</a>
          <div class="sidetoggle collapse" id="sidetoggle">
            <div id="sidetoc"></div>
          </div>
        </div>
        <div class="article row grid-right">
          <div class="col-md-10">
            <article class="content wrap" id="_content" data-uid="sdsViews">
<h1 id="stream-views" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="5" sourceendlinenumber="6">Stream Views</h1>

<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="8" sourceendlinenumber="9">An SdsView provides a way to map Stream data requests from one data type to another. You can apply 
a Stream View to any read or GET operation. SdsView is used to specify the mapping between source and target types.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="11" sourceendlinenumber="13">Sds attempts to determine how to map Properties from the source to the destination. When the mapping 
is straightforward, such as when the properties are in the same position and of the same data type, 
or when the properties have the same name, SDS will map the properties automatically.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="15" sourceendlinenumber="16">When SDS is unable to determine how to map a source property, the property is removed. If SDS encounters 
a target property that it cannot map to, the property is added and configured with a default value.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="18" sourceendlinenumber="19">To map a property that is beyond the ability of Sds to map on its own, you should define an SdsViewProperty 
and add it to the SdsView’s Properties collection.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="21" sourceendlinenumber="21">The following table shows the required and optional SdsView fields. Fields that are not included are reserved for internal Sds use.</p>
<table sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="23" sourceendlinenumber="30">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Optionality</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>Id</td>
<td>String</td>
<td>Required</td>
<td>Identifier for referencing the stream view</td>
</tr>
<tr>
<td>Name</td>
<td>String</td>
<td>Optional</td>
<td>Friendly name</td>
</tr>
<tr>
<td>Description</td>
<td>String</td>
<td>Optional</td>
<td>Description text</td>
</tr>
<tr>
<td>SourceTypeId</td>
<td>String</td>
<td>Required</td>
<td>Identifier of the SdsType of the SdsStream</td>
</tr>
<tr>
<td>TargetTypeId</td>
<td>String</td>
<td>Required</td>
<td>Identifier of the SdsType to convert events to</td>
</tr>
<tr>
<td>Properties</td>
<td>IList<sdsviewproperty></sdsviewproperty></td>
<td>Optional</td>
<td>Property level mapping</td>
</tr>
</tbody>
</table>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="33" sourceendlinenumber="33"><strong>Rules for type identifier</strong></p>
<ol sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="35" sourceendlinenumber="42">
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="35" sourceendlinenumber="35">Is not case sensitive</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="36" sourceendlinenumber="36">Can contain spaces</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="37" sourceendlinenumber="37">Cannot begin with two underscores (&quot;__&quot;)</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="38" sourceendlinenumber="38">Cannot contain forward slash or backslash characters (&quot;/&quot; or &quot;\&quot;)</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="39" sourceendlinenumber="39">Can contain a maximum of 260 characters</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="40" sourceendlinenumber="40">Cannot start or end with a period.</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="41" sourceendlinenumber="41">Cannot contain consecutive periods.</li>
<li sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="42" sourceendlinenumber="42">Cannot consist of only periods.</li>
</ol>
<h2 id="properties--sdsviewproperty" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="45" sourceendlinenumber="46">Properties / SdsViewProperty</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="48" sourceendlinenumber="52">The SdsView Properties collection provides detailed instructions for specifying the mapping of 
event properties. Each SdsViewProperty in the Properties collection defines the mapping of an 
event’s property. SdsView Properties are required only when property mapping is not straightforward. 
Additionally, if you do not want a type property mapped, it is not necessary to create a SdsView 
property for it.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="54" sourceendlinenumber="54">The following table shows the required and optional SdsViewProperty fields.</p>
<table sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="56" sourceendlinenumber="60">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Optionality</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>SourceId</td>
<td>String</td>
<td>Required</td>
<td>Identifier of the SdsTypeProperty from the source SdsType Properties list</td>
</tr>
<tr>
<td>TargetId</td>
<td>String</td>
<td>Required</td>
<td>Identifier of the SdsTypeProperty from the target SdsType Properties list</td>
</tr>
<tr>
<td>SdsView</td>
<td>SdsView</td>
<td>Optional</td>
<td>Additional mapping instructions for derived types</td>
</tr>
</tbody>
</table>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="62" sourceendlinenumber="62">The SdsView field supports nested Properties.</p>
<h2 id="sdsviewmap" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="64" sourceendlinenumber="65">SdsViewMap</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="67" sourceendlinenumber="68">When a SdsView is added, Sds defines a plan mapping. Plan details are retrieved as a SdsViewMap. 
The SdsViewMap provides a detailed Property-by-Property definition of the mapping. </p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="70" sourceendlinenumber="71">The following table shows the SdsViewMap fields. The SdsViewMap cannot be written to Sds, 
so required and optional have no meaning.</p>
<table sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="73" sourceendlinenumber="77">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Optionality</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>SourceTypeId</td>
<td>String</td>
<td>Required</td>
<td>Identifier of the SdsType of the SdsStream</td>
</tr>
<tr>
<td>TargetTypeId</td>
<td>String</td>
<td>Required</td>
<td>Identifier of the SdsType to convert events to</td>
</tr>
<tr>
<td>Properties</td>
<td>IList<sdsviewmapproperty></sdsviewmapproperty></td>
<td>Optional</td>
<td>Property level mapping</td>
</tr>
</tbody>
</table>
<h2 id="properties--sdsviewmapproperty" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="79" sourceendlinenumber="80">Properties / SdsViewMapProperty</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="82" sourceendlinenumber="83">The SdsViewMapProperty is similar a SdsViewProperty but adds a Mode detailing one or more actions taken on 
the Property.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="85" sourceendlinenumber="86">The following table shows the SdsViewMapProperty fields. The SdsViewMap cannot be written; it can only be 
retrieved from Sds, so required and optional have no meaning.</p>
<table sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="88" sourceendlinenumber="93">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>SourceTypeId</td>
<td>String</td>
<td>Identifier of the SdsType of the SdsStream</td>
</tr>
<tr>
<td>TargetTypeId</td>
<td>String</td>
<td>Identifier of the SdsType to convert events to</td>
</tr>
<tr>
<td>Mode</td>
<td>SdsViewMode</td>
<td>Aggregate of actions applied to the properties. SdsViewModes are combined via binary arithmetic</td>
</tr>
<tr>
<td>SdsViewMap</td>
<td>SdsViewMap</td>
<td>Mapping for derived types</td>
</tr>
</tbody>
</table>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="95" sourceendlinenumber="95">The available SdsViewModes are shown in the table below.</p>
<table sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="97" sourceendlinenumber="105">
<thead>
<tr>
<th>Name</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>None</td>
<td>0x0000</td>
<td>No action</td>
</tr>
<tr>
<td>FieldAdd</td>
<td>0x0001</td>
<td>Add a property matching the specified SdsTypeProperty</td>
</tr>
<tr>
<td>FieldRemove</td>
<td>0x0002</td>
<td>Remove the property matching the specified SdsTypeProperty</td>
</tr>
<tr>
<td>FieldRename</td>
<td>0x0004</td>
<td>Rename the property matching the source SdsTypeProperty to the target SdsTypeProperty</td>
</tr>
<tr>
<td>FieldMove</td>
<td>0x0008</td>
<td>Move the property from the location in the source to the location in the target</td>
</tr>
<tr>
<td>FieldConversion</td>
<td>0x0016</td>
<td>Converts the source property to the target type</td>
</tr>
<tr>
<td>InvalidFieldConversion</td>
<td>0x0032</td>
<td>Cannot perform the specified mapping</td>
</tr>
</tbody>
</table>
<h2 id="changing-stream-type" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="107" sourceendlinenumber="108">Changing Stream Type</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="110" sourceendlinenumber="111">Stream Views can be used to change the Type defining a Stream. You cannot modify the SdsType; types are immutable. 
But you can map a stream from its current type to a new type.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="113" sourceendlinenumber="113">To update a Stream Type, define an SdsView and PUT the stream view to the following:</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="115" sourceendlinenumber="115"><code>   api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Type?viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="118" sourceendlinenumber="118">For details, see <a href="#sds-views" data-raw-source="[SdsView API](#sds-views)" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="118" sourceendlinenumber="118">SdsView API</a>. </p>
<h2 id="working-with-stream-views-when-using-net" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="120" sourceendlinenumber="121">Working with Stream Views when using .NET</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="123" sourceendlinenumber="123"><strong>Using .Net</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="125" sourceendlinenumber="125">When working in .NET, use the Sds Client libraries’ ISdsMetadataService.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="127" sourceendlinenumber="127">Given the following:</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="129" sourceendlinenumber="184"><code>public enum State
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

SdsType simpleType = SdsTypeBuilder.CreateSdsType&lt;Simple&gt;();
simpleType.Id = &quot;Simple&quot;;
simpleType.Name = &quot;Simple&quot;;
await config.GetOrCreateTypeAsync(simpleType);//.CreateOrUpdateTypeAsync(simpleType);//.GetOrCreateTypeAsync(simpleType);

SdsStream simpleStream = await config.GetOrCreateStreamAsync(new SdsStream()
{
    Id = &quot;Simple&quot;,
    Name = &quot;Simple&quot;,
    TypeId = simpleType.Id
});

DateTime start = new DateTime(2017, 4, 1).ToUniversalTime();

for (int i = 0; i &lt; 10; i++)
{
    Simple value = new Simple()
    {
        Time = start + TimeSpan.FromMinutes(i),
        State = State.Warning,
        Measurement = i
    };
    await client.InsertValueAsync(simpleStream.Id, value);
}

IEnumerable&lt;Simple&gt; simpleValues = await client.GetWindowValuesAsync&lt;Simple&gt;(simpleStream.Id, start.ToString(&quot;o&quot;),
    start.Add(TimeSpan.FromMinutes(10)).ToString(&quot;o&quot;));
foreach (Simple value in simpleValues)
    Console.WriteLine($&quot;{value.Time}: {value.State}, {value.Measurement}&quot;);

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
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="187" sourceendlinenumber="188">To map the Measurement property to a property in the same location of the same type, allow Sds to 
automatically determine mapping.</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="190" sourceendlinenumber="238"><code>public class Simple1
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public double Value { get; set; }
}

SdsType simple1Type = SdsTypeBuilder.CreateSdsType&lt;Simple1&gt;();
simple1Type.Id = &quot;Simple1&quot;;
simple1Type.Name = &quot;Simple1&quot;;
simple1Type = await config.GetOrCreateTypeAsync(simple1Type);

SdsView view = new SdsView()
{
    Id = &quot;View&quot;,
    Name = &quot;View&quot;,
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple1Type.Id,
};
view = await config.GetOrCreateViewAsync(view);

SdsViewMap map = await config.GetViewMapAsync(view.Id);
Console.WriteLine($&quot;{map.SourceTypeId} to {map.TargetTypeId}&quot;);
for (int i = 0; i &lt; map.Properties.Count; i++)
    Console.WriteLine($&quot;\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}&quot;);
Console.WriteLine();

IEnumerable&lt;Simple1&gt; simple1Values = await client.GetWindowValuesAsync&lt;Simple1&gt;(simpleStream.Id, start.ToString(&quot;o&quot;),
    start.Add(TimeSpan.FromMinutes(10)).ToString(&quot;o&quot;), view.Id);
foreach (Simple1 value in simple1Values)
    Console.WriteLine($&quot;{value.Time}: {value.State}, {value.Value}&quot;);

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
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="240" sourceendlinenumber="241">A quick look at the SdsViewMap shows that Sds was able to determine that mapping from Measurement 
to Value involved a rename.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="243" sourceendlinenumber="244">Sds can also determine mapping of properties of the same name but different type. Note that the 
location of the Measurement property is also different yet it is still mapped.</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="246" sourceendlinenumber="294"><code>public class Simple2
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public int Measurement { get; set; }
    public State State { get; set; }
}

SdsType simple2Type = SdsTypeBuilder.CreateSdsType&lt;Simple2&gt;();
simple2Type.Id = &quot;Simple2&quot;;
simple2Type.Name = &quot;Simple2&quot;;
simple2Type = await config.GetOrCreateTypeAsync(simple2Type);

view = new SdsView() 
{
    Id = &quot;View1&quot;,
    Name = &quot;View1&quot;,
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple2Type.Id,
};
view = await config.GetOrCreateViewAsync(view);

map = await config.GetViewMapAsync(view.Id);
Console.WriteLine($&quot;{map.SourceTypeId} to {map.TargetTypeId}&quot;);
for (int i = 0; i &lt; map.Properties.Count; i++)
    Console.WriteLine($&quot;\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}&quot;);
Console.WriteLine();

IEnumerable&lt;Simple2&gt; simple2Values = await client.GetWindowValuesAsync&lt;Simple2&gt;(simpleStream.Id, start.ToString(&quot;o&quot;),
    start.Add(TimeSpan.FromMinutes(10)).ToString(&quot;o&quot;), view.Id);
foreach (Simple2 value in simple2Values)
    Console.WriteLine($&quot;{value.Time}: {value.State}, {value.Measurement}&quot;);

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
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="296" sourceendlinenumber="296">The SdsViewMap shows that the source, floating point Measurement is converted to the target, integer Measurement.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="298" sourceendlinenumber="299">When neither the field name nor field type and location match, Sds does not determine mapping. 
The source is eliminated and target is added and assigned the default value.</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="301" sourceendlinenumber="350"><code>public class Simple3
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public int Value { get; set; }
}

SdsType simple3Type = SdsTypeBuilder.CreateSdsType&lt;Simple3&gt;();
simple3Type.Id = &quot;Simple3&quot;;
simple3Type.Name = &quot;Simple3&quot;;
simple3Type = await config.GetOrCreateTypeAsync(simple3Type);

view = new SdsView()
{
    Id = &quot;View2&quot;,
    Name = &quot;View2&quot;,
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple3Type.Id,
};
view = await config.GetOrCreateViewAsync(view);

map = await config.GetViewMapAsync(view.Id);
Console.WriteLine($&quot;{map.SourceTypeId} to {map.TargetTypeId}&quot;);
for (int i = 0; i &lt; map.Properties.Count; i++)
    Console.WriteLine($&quot;\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}&quot;);
Console.WriteLine();

IEnumerable&lt;Simple3&gt; simple3Values = await client.GetWindowValuesAsync&lt;Simple3&gt;(simpleStream.Id, start.ToString(&quot;o&quot;),
    start.Add(TimeSpan.FromMinutes(10)).ToString(&quot;o&quot;), view.Id);
foreach (Simple3 value in simple3Values)
    Console.WriteLine($&quot;{value.Time}: {value.State}, {value.Value}&quot;);

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
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="353" sourceendlinenumber="353">To map when Sds cannot determine mapping, use SdsView Properties.</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="355" sourceendlinenumber="408"><code>view = new SdsView()
{
    Id = &quot;View3&quot;,
    Name = &quot;View3&quot;,
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple3Type.Id,
    Properties = new List&lt;SdsViewProperty&gt;()
    {
        new SdsViewProperty()
        {
            SourceId = &quot;Time&quot;,
            TargetId = &quot;Time&quot;
        },
        new SdsViewProperty()
        {
            SourceId = &quot;Status&quot;,
            TargetId = &quot;Status&quot;
        },
        new SdsViewProperty()
        {
            SourceId = &quot;Measurement&quot;,
            TargetId = &quot;Value&quot;
        }
    }
};
view = await config.GetOrCreateViewAsync(view);

map = await config.GetViewMapAsync(view.Id);
Console.WriteLine($&quot;{map.SourceTypeId} to {map.TargetTypeId}&quot;);
for (int i = 0; i &lt; map.Properties.Count; i++)
    Console.WriteLine($&quot;\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}&quot;);
Console.WriteLine();

simple3Values = await client.GetWindowValuesAsync&lt;Simple3&gt;(simpleStream.Id, start.ToString(&quot;o&quot;),
    start.Add(TimeSpan.FromMinutes(10)).ToString(&quot;o&quot;), view.Id);
foreach (Simple3 value in simple3Values)
    Console.WriteLine($&quot;{value.Time}: {value.State}, {value.Value}&quot;);

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
</code></pre><h2 id="working-with-sdsviews-when-not-using-net" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="411" sourceendlinenumber="412">Working with SdsViews when not using .NET</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="414" sourceendlinenumber="415">When working with Stream Views and not using .NET, either invoke HTTP directly or use some of 
the sample code. Both Python and JavaScript samples have SdsView definitions.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="417" sourceendlinenumber="418">The JSON for a simple mapping between a source type with identifier Sample and a target 
type with identifier Sample1 would appear as follows.</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="420" sourceendlinenumber="425"><code>{  
  &quot;Id&quot;:&quot;View&quot;,
  &quot;Name&quot;:&quot;View&quot;,
  &quot;SourceTypeId&quot;:&quot;Simple&quot;,
  &quot;TargetTypeId&quot;:&quot;Simple1&quot;
}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="427" sourceendlinenumber="427">The SdsViewMap would appear as follows.</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="430" sourceendlinenumber="448"><code>{  
  &quot;SourceTypeId&quot;:&quot;Simple&quot;,
  &quot;TargetTypeId&quot;:&quot;Simple1&quot;,
  &quot;Properties&quot;:[  
      {  
        &quot;SourceId&quot;:&quot;Time&quot;,
        &quot;TargetId&quot;:&quot;Time&quot;
      },
      {  
        &quot;SourceId&quot;:&quot;State&quot;,
        &quot;TargetId&quot;:&quot;State&quot;
      },
      {  
        &quot;SourceId&quot;:&quot;Measurement&quot;,
        &quot;TargetId&quot;:&quot;Value&quot;,
        &quot;Mode&quot;:4
      }
  ]
}
</code></pre><h2 id="sdsview-api" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="451" sourceendlinenumber="452">SdsView API</h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="455" sourceendlinenumber="458">The REST APIs provide programmatic access to read and write Sds data. The APIs in this section interact 
with SdsViews. When working in .NET convenient Sds Client libraries are available. The ISdsMetadataService 
interface, accessed using the <code>SdsService.GetMetadataService()</code> helper, defines the available functions. 
See <a href="https://ocs-docs.osisoft.com/Documentation/SequentialDataStore/SDS_Views.html" data-raw-source="[Sds View information](https://ocs-docs.osisoft.com/Documentation/SequentialDataStore/SDS_Views.html)" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="458" sourceendlinenumber="458">Sds View information</a> for general SdsView information.</p>
<hr>
<h2 id="get-stream-view" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="462" sourceendlinenumber="463"><code>Get Stream View</code></h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="465" sourceendlinenumber="465">Returns the stream view corresponding to the specified viewId within a given namespace.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="468" sourceendlinenumber="468"><strong>Request</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="470" sourceendlinenumber="470"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="473" sourceendlinenumber="473"><strong>Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="475" sourceendlinenumber="480"><code>string tenantId</code>
  The tenant identifier
<code>string namespaceId</code>
  The namespace identifier
<code>string viewId</code>
  The stream view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="483" sourceendlinenumber="483"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="485" sourceendlinenumber="485">  The response includes a status code and a response body.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="488" sourceendlinenumber="488"><strong>Response body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="490" sourceendlinenumber="490">  The requested SdsView.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="492" sourceendlinenumber="492">  Sample response body:</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="494" sourceendlinenumber="516"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Id&quot;:&quot;View&quot;,
     &quot;Name&quot;:&quot;View&quot;,
     &quot;SourceTypeId&quot;:&quot;Simple&quot;,
     &quot;TargetTypeId&quot;:&quot;Simple3&quot;,
     &quot;Properties&quot;:[  
        {  
           &quot;SourceId&quot;:&quot;Time&quot;,
           &quot;TargetId&quot;:&quot;Time&quot;
        },
        {  
           &quot;SourceId&quot;:&quot;Status&quot;,
           &quot;TargetId&quot;:&quot;Status&quot;
        },
        {  
           &quot;SourceId&quot;:&quot;Measurement&quot;,
           &quot;TargetId&quot;:&quot;Value&quot;
        }
     ]
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="520" sourceendlinenumber="520"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="522" sourceendlinenumber="522"><code>  Task&lt;SdsView&gt; GetViewAsync(string viewId);
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="525" sourceendlinenumber="525"><strong>Security</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="527" sourceendlinenumber="527">  Allowed for administrator and user accounts</p>
<hr>
<h2 id="get-stream-view-map" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="532" sourceendlinenumber="533"><code>Get Stream View Map</code></h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="535" sourceendlinenumber="535">Returns the stream view map corresponding to the specified viewId within a given namespace.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="538" sourceendlinenumber="538"><strong>Request</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="540" sourceendlinenumber="540"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{viewId}/Map
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="543" sourceendlinenumber="543"><strong>Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="545" sourceendlinenumber="550"><code>string tenantId</code>
  The tenant identifier
<code>string namespaceId</code>
  The namespace identifier
<code>string viewId</code>
  The stream view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="553" sourceendlinenumber="553"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="555" sourceendlinenumber="555">  The response includes a status code and a response body.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="558" sourceendlinenumber="558"><strong>Response body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="560" sourceendlinenumber="560">  The requested SdsView.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="562" sourceendlinenumber="562">  Sample response body:</p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="564" sourceendlinenumber="589"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;SourceTypeId&quot;:&quot;Simple&quot;,
     &quot;TargetTypeId&quot;:&quot;Simple3&quot;,
     &quot;Properties&quot;:[  
        {  
           &quot;SourceId&quot;:&quot;Time&quot;,
           &quot;TargetId&quot;:&quot;Time&quot;
        },
        {  
           &quot;SourceId&quot;:&quot;Measurement&quot;,
           &quot;TargetId&quot;:&quot;Value&quot;,
           &quot;Mode&quot;:20
        },
        {  
           &quot;SourceId&quot;:&quot;State&quot;,
           &quot;Mode&quot;:2
        },
        {  
           &quot;TargetId&quot;:&quot;State&quot;,
           &quot;Mode&quot;:1 
        }
     ]
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="593" sourceendlinenumber="593"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="595" sourceendlinenumber="595"><code>  Task&lt;SdsViewMap&gt; GetViewMapAsync(string viewId);
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="598" sourceendlinenumber="598"><strong>Security</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="600" sourceendlinenumber="600">  Allowed for administrator and user accounts</p>
<hr>
<h2 id="get-stream-views" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="605" sourceendlinenumber="606"><code>Get Stream Views</code></h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="608" sourceendlinenumber="608">Returns a list of stream views within a given namespace.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="611" sourceendlinenumber="611"><strong>Request</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="613" sourceendlinenumber="613"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews?skip={skip}&amp;count={count}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="616" sourceendlinenumber="616"><strong>Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="618" sourceendlinenumber="627"><code>string tenantId</code>
  The tenant identifier
<code>string namespaceId</code>
  The namespace identifier
<code>int skip</code>
  An optional value representing the zero-based offset of the first SdsView to retrieve. 
  If not specified, a default value of 0 is used.
<code>int count</code><br>  An optional value representing the maximum number of SdsViews to retrieve. If not specified, 
  a default value of 100 is used.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="629" sourceendlinenumber="629"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="631" sourceendlinenumber="631">  The response includes a status code and a response body.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="634" sourceendlinenumber="634"><strong>Response body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="636" sourceendlinenumber="636">  A collection of zero or more SdsViews.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="639" sourceendlinenumber="639"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="641" sourceendlinenumber="641"><code>  Task&lt;IEnumerable&lt;SdsView&gt;&gt; GetViewsAsync(int skip = 0, int count = 100);
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="644" sourceendlinenumber="644"><strong>Security</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="646" sourceendlinenumber="646">  Allowed for administrator and user accounts</p>
<hr>
<h2 id="get-or-create-stream-view" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="651" sourceendlinenumber="652"><code>Get or Create Stream View</code></h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="654" sourceendlinenumber="655">If a stream view with a matching identifier already exists, the stream view passed in is compared with the existing stream view.
If the stream views are identical, the stream view is returned. If the stream views are different, the Found (302) error is returned.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="657" sourceendlinenumber="657">If no matching identifier is found, the specified stream view is created.  </p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="659" sourceendlinenumber="659"><strong>Request</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="661" sourceendlinenumber="661"><code>    POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="664" sourceendlinenumber="664"><strong>Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="666" sourceendlinenumber="671"><code>string tenantId</code>
  The tenant identifier
<code>string namespaceId</code>
  The namespace identifier
<code>string viewId</code>
  The stream view identifier. The identifier must match the <code>SdsView.Id</code> field. </p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="673" sourceendlinenumber="673">The request content is the serialized SdsView. If you are not using the Sds client libraries, using JSON is recommended.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="675" sourceendlinenumber="675"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="677" sourceendlinenumber="677">  The response includes a status code and a response body.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="680" sourceendlinenumber="680"><strong>Response body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="682" sourceendlinenumber="682"> The newly created or matching SdsView.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="685" sourceendlinenumber="685"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="687" sourceendlinenumber="687"><code>  Task&lt;SdsView&gt; GetOrCreateViewAsync(SdsView SdsView);
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="690" sourceendlinenumber="690"><strong>Security</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="692" sourceendlinenumber="692">  Allowed for administrator accounts</p>
<hr>
<h2 id="create-or-update-stream-view" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="697" sourceendlinenumber="698"><code>Create or Update Stream View</code></h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="700" sourceendlinenumber="700">Creates or updates the definition of a stream view. </p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="702" sourceendlinenumber="702"><strong>Request</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="704" sourceendlinenumber="704"><code>    PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="707" sourceendlinenumber="707"><strong>Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="709" sourceendlinenumber="714"><code>string tenantId</code>
  The tenant identifier
<code>string namespaceId</code>
  The namespace identifier
<code>string viewId</code>
  The stream view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="717" sourceendlinenumber="717"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="719" sourceendlinenumber="719">  The response includes a status code and a response body.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="722" sourceendlinenumber="722"><strong>Response body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="724" sourceendlinenumber="724">  The content is set to true on success.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="727" sourceendlinenumber="727"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="729" sourceendlinenumber="729"><code>  Task CreateOrUpdateViewAsync(SdsView SdsView);
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="732" sourceendlinenumber="732"><strong>Security</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="734" sourceendlinenumber="734">  Allowed for administrator accounts</p>
<hr>
<h2 id="delete-stream-view" sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="740" sourceendlinenumber="741"><code>Delete Stream View</code></h2>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="743" sourceendlinenumber="743">Deletes a stream view from the specified tenant and namespace.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="746" sourceendlinenumber="746"><strong>Request</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="748" sourceendlinenumber="748"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="751" sourceendlinenumber="751"><strong>Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="753" sourceendlinenumber="758"><code>string tenantId</code>
  The tenant identifier
<code>string namespaceId</code>
  The namespace identifier
<code>string viewId</code>
  The stream view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="761" sourceendlinenumber="761"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="763" sourceendlinenumber="763">  The response includes a status code.</p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="766" sourceendlinenumber="766"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="768" sourceendlinenumber="768"><code>  Task DeleteViewAsync(string viewId);
</code></pre><p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="770" sourceendlinenumber="770"><strong>Security</strong></p>
<p sourcefile="Documentation/SequentialDataStore/SDS_Views.md" sourcestartlinenumber="772" sourceendlinenumber="772">  Allowed for administrator accounts</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/OCS-Docs/blob/master/Documentation/SequentialDataStore/SDS_Views.md/#L1" class="contribution-link">Improve this Doc</a>
                  </li>
                </ul>
              </div>
              <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix" id="affix">
              <!-- <p><a class="back-to-top" href="#top">Back to top</a><p> -->
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <footer>
        <div class="grad-bottom"></div>
        <div class="footer">
            <span id='copyright-text'>© 2018 - OSIsoft, LLC.<span>
        </span></span></div>
      </footer>
    </div>
    
    <script type="text/javascript" src="../../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../../styles/docfx.js"></script>
    <script type="text/javascript" src="../../styles/main.js"></script>
  </body>
</html>
