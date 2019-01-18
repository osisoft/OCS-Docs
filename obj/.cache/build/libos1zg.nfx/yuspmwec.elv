<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>API calls for reading data </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="API calls for reading data ">
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
            <article class="content wrap" id="_content" data-uid="sdsReadingDataApi">
<h1 id="api-calls-for-reading-data" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="4" sourceendlinenumber="4">API calls for reading data</h1>

<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="5" sourceendlinenumber="5">Reading and writing data with the Sds Client Libraries is performed through the <code>ISdsDataService</code> interface, which can be accessed with the <code>SdsService.GetDataService( )</code> helper.</p>
<hr>
<h2 id="sample-types" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="8" sourceendlinenumber="8">Sample Types</h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="9" sourceendlinenumber="9">Many of the API methods described below contain sample JSON and sample code. </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="11" sourceendlinenumber="12">When specifying a parameter of type enum, the API accepts both the name of the field and the numeric value of the field. 
Samples vary to highlight enum flexibility.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="14" sourceendlinenumber="14">Samples use the following types:</p>
<h3 id="type-with-a-simple-index-named-simple" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="16" sourceendlinenumber="16">Type with a simple index, named <em>Simple</em>:</h3>
<h4 id="net" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="18" sourceendlinenumber="18">.NET</h4>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="19" sourceendlinenumber="35"><code class="lang-csharp">      public enum State
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
        [SdsMember(Uom = &quot;meter&quot;)]
        public Double Measurement { get; set; }
      }
</code></pre><h4 id="python" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="36" sourceendlinenumber="36">Python</h4>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="37" sourceendlinenumber="61"><code class="lang-python">      class State(Enum):
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
</code></pre><h4 id="javascript" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="62" sourceendlinenumber="62">JavaScript</h4>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="63" sourceendlinenumber="76"><code class="lang-javascript">      var State =
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
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="77" sourceendlinenumber="77">Has values as follows:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="79" sourceendlinenumber="83"><code>  11/23/2017 12:00:00 PM: Ok  0
  11/23/2017  1:00:00 PM: Ok 10
  11/23/2017  2:00:00 PM: Ok 20
  11/23/2017  3:00:00 PM: Ok 30
  11/23/2017  4:00:00 PM: Ok 40
</code></pre><h3 id="type-with-compound-index-named-derivedcompoundindex" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="85" sourceendlinenumber="85">Type with Compound Index, named <code>DerivedCompoundIndex</code></h3>
<h4 id="net-1" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="87" sourceendlinenumber="87">.NET</h4>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="88" sourceendlinenumber="102"><code class="lang-csharp">      public class Simple
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
</code></pre><h4 id="python-1" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="103" sourceendlinenumber="103">Python</h4>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="104" sourceendlinenumber="133"><code class="lang-python">      class Simple(object):
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
</code></pre><h4 id="javascript-1" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="134" sourceendlinenumber="134">JavaScript</h4>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="135" sourceendlinenumber="146"><code class="lang-javascript">      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }

      var DerivedCompoundIndex = function() {
        Simple.call(this);
        this.Recorded = null;
      }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="147" sourceendlinenumber="147">Has values as follows:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="149" sourceendlinenumber="155"><code>  1/20/2017 1:00:00 AM : 1/20/2017 12:00:00 AM  0
  1/20/2017 1:00:00 AM : 1/20/2017  1:00:00 AM  2
  1/20/2017 1:00:00 AM : 1/20/2017  2:00:00 PM  5
  1/20/2017 2:00:00 AM : 1/20/2017 12:00:00 AM  1
  1/20/2017 2:00:00 AM : 1/20/2017  1:00:00 AM  3
  1/20/2017 2:00:00 AM : 1/20/2017  2:00:00 AM  4
  1/20/2017 2:00:00 AM : 1/20/2017  2:00:00 PM  6
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="157" sourceendlinenumber="157">All times are represented at offset 0, GMT.</p>
<hr>
<h2 id="get-value" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="161" sourceendlinenumber="161"><code>Get Value</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="163" sourceendlinenumber="163">Get Value supports two ways to retrieve an event:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="164" sourceendlinenumber="165">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="164" sourceendlinenumber="164"><a href="#getvaluestandard" data-raw-source="[Standard](#getvaluestandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="164" sourceendlinenumber="164">Standard</a>: Returns the value at the specified index. If no stored event exists at the specified index, the stream’s read characteristics determines how the returned event is calculated.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="165" sourceendlinenumber="165"><a href="#getvalueuomconversion" data-raw-source="[Uom Conversion](#getvalueuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="165" sourceendlinenumber="165">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="165" sourceendlinenumber="165">Units of Measure</a> for additional information </li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="167" sourceendlinenumber="167"><a name="getvaluestandard"></a></p>
<h3 id="request-standard" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="169" sourceendlinenumber="169">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="171" sourceendlinenumber="172"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValue
     ?index={index}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="174" sourceendlinenumber="174"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="176" sourceendlinenumber="177"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="179" sourceendlinenumber="180"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="182" sourceendlinenumber="183"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="185" sourceendlinenumber="186"><code>string index</code><br>The index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="188" sourceendlinenumber="189"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="192" sourceendlinenumber="192"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="194" sourceendlinenumber="196">  The response includes a status code and a response body containing a serialized event.
  Consider a stream of type Simple with the default InterpolationMode of Continuous and 
  ExtrapolationMode of All. In the following request, the specified index matches an existing stored event:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="198" sourceendlinenumber="199"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValue 
     ?index=2017-11-23T13:00:00Z
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="201" sourceendlinenumber="201">The response will contain the event stored at the specified index:</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="203" sourceendlinenumber="203"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="205" sourceendlinenumber="211"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
     &quot;Measurement&quot;:10.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="213" sourceendlinenumber="213">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="215" sourceendlinenumber="215">The following request specifies an index for which no stored event exists:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="217" sourceendlinenumber="218"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValue 
      ?index=2017-11-23T13:30:00Z
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="220" sourceendlinenumber="221">Because the index is a valid type for interpolation and the stream type specifies a mode of interpolate, 
this request receives a response with an event interpolated at the specified index:</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="223" sourceendlinenumber="223"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="225" sourceendlinenumber="231"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Time&quot;:&quot;2017-11-23T13:30:00Z&quot;,
     &quot;Measurement&quot;:15.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="233" sourceendlinenumber="233"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="235" sourceendlinenumber="240"><code>  Task&lt;T&gt; GetValueAsync&lt;T&gt;(string streamId, string index, 
  string viewId = null);
  Task&lt;T&gt; GetValueAsync&lt;T, T1&gt;(string streamId, Tuple&lt;T1&gt; index, 
  string viewId = null);
  Task&lt;T&gt; GetValueAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; index, 
  string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="242" sourceendlinenumber="242"><a name="getvalueuomconversion"></a></p>
<h3 id="request-uom-conversion" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="244" sourceendlinenumber="244">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="246" sourceendlinenumber="247"><code>    POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValue
        ?index={index}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="249" sourceendlinenumber="249"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="251" sourceendlinenumber="252"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="254" sourceendlinenumber="255"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="257" sourceendlinenumber="258"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="260" sourceendlinenumber="261"><code>string index</code><br>The index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="263" sourceendlinenumber="264"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="266" sourceendlinenumber="266"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="268" sourceendlinenumber="268">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="269" sourceendlinenumber="276"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="278" sourceendlinenumber="278"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="280" sourceendlinenumber="280">The response includes a status code and response body containing a serialized event similar to the standard request above (without Uom conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="282" sourceendlinenumber="282"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="284" sourceendlinenumber="290"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
     &quot;Measurement&quot;:1000.0 
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="292" sourceendlinenumber="292"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="294" sourceendlinenumber="296"><code>  Task&lt;T&gt; GetValueAsync&lt;T&gt;(string streamId, string index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
  Task&lt;T&gt; GetValueAsync&lt;T, T1&gt;(string streamId, Tuple&lt;T1&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
  Task&lt;T&gt; GetValueAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
</code></pre><hr>
<h2 id="get-first-value" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="300" sourceendlinenumber="300"><code>Get First Value</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="301" sourceendlinenumber="301">Get First Value supports two ways to retrieve an event:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="303" sourceendlinenumber="304">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="303" sourceendlinenumber="303"><a href="#getfirstvaluestandard" data-raw-source="[Standard](#getfirstvaluestandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="303" sourceendlinenumber="303">Standard</a>: Returns the first value in the stream. If no values exist in the stream, null is returned.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="304" sourceendlinenumber="304"><a href="#getfirstvalueuomconversion" data-raw-source="[Uom Conversion](#getfirstvalueuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="304" sourceendlinenumber="304">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="304" sourceendlinenumber="304">Units of Measure</a> for additional information</li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="306" sourceendlinenumber="306"><a name="getfirstvaluestandard"></a></p>
<h3 id="request-standard-1" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="307" sourceendlinenumber="307">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="309" sourceendlinenumber="310"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetFirstValue
        ?viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="312" sourceendlinenumber="312"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="314" sourceendlinenumber="315"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="317" sourceendlinenumber="318"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="320" sourceendlinenumber="321"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="323" sourceendlinenumber="324"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="326" sourceendlinenumber="326"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="328" sourceendlinenumber="328">  The response includes a status code and a response body containing a serialized event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="330" sourceendlinenumber="330"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="332" sourceendlinenumber="332"><code>  Task&lt;T&gt; GetFirstValueAsync&lt;T&gt;(string streamId, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="334" sourceendlinenumber="334"><a name="getfirstvalueuomconversion"></a></p>
<h3 id="request-uom-conversion-1" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="335" sourceendlinenumber="335">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="337" sourceendlinenumber="338"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetFirstValue
     ?viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="340" sourceendlinenumber="340"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="342" sourceendlinenumber="343"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="345" sourceendlinenumber="346"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="348" sourceendlinenumber="349"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="351" sourceendlinenumber="352"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="354" sourceendlinenumber="354"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="356" sourceendlinenumber="356">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="357" sourceendlinenumber="364"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="366" sourceendlinenumber="366"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="368" sourceendlinenumber="368">  The response includes a status code and a response body containing a serialized event with unit conversions applied.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="370" sourceendlinenumber="370"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="372" sourceendlinenumber="372"><code>  Task&lt;T&gt; GetFirstValueAsync&lt;T&gt;(string streamId, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
</code></pre><hr>
<h2 id="get-last-value" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="376" sourceendlinenumber="376"><code>Get Last Value</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="378" sourceendlinenumber="378">Get Last Value supports two ways to retrieve an event:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="379" sourceendlinenumber="380">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="379" sourceendlinenumber="379"><a href="#getlastvaluestandard" data-raw-source="[Standard](#getlastvaluestandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="379" sourceendlinenumber="379">Standard</a>: Returns the last value in the stream. If no values exist in the stream, null is returned.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="380" sourceendlinenumber="380"><a href="#getlastvalueuomconversion" data-raw-source="[Uom Conversion](#getlastvalueuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="380" sourceendlinenumber="380">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="380" sourceendlinenumber="380">Units of Measure</a> for additional information</li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="382" sourceendlinenumber="382"><a name="getlastvaluestandard"></a></p>
<h3 id="request-standard-2" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="383" sourceendlinenumber="383">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="384" sourceendlinenumber="385"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetLastValue
        ?viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="388" sourceendlinenumber="388"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="390" sourceendlinenumber="391"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="393" sourceendlinenumber="394"><code>string namespaceId</code><br>The namespace identifier </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="396" sourceendlinenumber="397"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="399" sourceendlinenumber="400"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="403" sourceendlinenumber="403"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="405" sourceendlinenumber="405">  The response includes a status code and a response body containing a serialized event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="408" sourceendlinenumber="408"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="410" sourceendlinenumber="410"><code>  Task&lt;T&gt; GetLastValueAsync&lt;T&gt;(string streamId, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="412" sourceendlinenumber="412"><a name="getlastvalueuomconversion"></a></p>
<h3 id="request-uom-conversion-2" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="413" sourceendlinenumber="413">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="414" sourceendlinenumber="415"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetLastValue
        ?viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="417" sourceendlinenumber="417"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="419" sourceendlinenumber="420"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="422" sourceendlinenumber="423"><code>string namespaceId</code><br>The namespace identifier </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="425" sourceendlinenumber="426"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="428" sourceendlinenumber="429"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="431" sourceendlinenumber="431"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="433" sourceendlinenumber="433">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="434" sourceendlinenumber="441"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="443" sourceendlinenumber="443"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="445" sourceendlinenumber="445">The response includes a status code and a response body containing a serialized event with unit conversions applied.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="447" sourceendlinenumber="447"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="448" sourceendlinenumber="450"><code class="lang-csharp">   Task&lt;T&gt; GetLastValueAsync&lt;T&gt;(string streamId, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
</code></pre><hr>
<h2 id="get-distinct-value" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="453" sourceendlinenumber="453"><code>Get Distinct Value</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="455" sourceendlinenumber="455">Get Distinct Value supports two ways to retrieve an event:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="456" sourceendlinenumber="459">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="456" sourceendlinenumber="458"><a href="#getdistinctvaluestandard" data-raw-source="[Standard](#getdistinctvaluestandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="456" sourceendlinenumber="456">Standard</a>: Returns the value at the specified index. If no value exists at the specified index, 
Get Distinct Value returns HTTP Status Code Not Found, 404.  The stream’s read characteristics 
do not affect Get Distinct Value.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="459" sourceendlinenumber="459"><a href="#getdistinctvalueuomconversion" data-raw-source="[Uom Conversion](#getdistinctvalueuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="459" sourceendlinenumber="459">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="459" sourceendlinenumber="459">Units of Measure</a> for additional information</li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="461" sourceendlinenumber="461"><a name="getdistinctvaluestandard"></a></p>
<h3 id="request-standard-3" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="462" sourceendlinenumber="462">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="464" sourceendlinenumber="465"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetDistinctValue
     ?index={index}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="468" sourceendlinenumber="468"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="470" sourceendlinenumber="471"><code>string tenantId</code><br>  The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="473" sourceendlinenumber="474"><code>string namespaceId</code><br>  The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="476" sourceendlinenumber="477"><code>string streamId</code><br>  The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="479" sourceendlinenumber="480"><code>string index</code><br>  The index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="482" sourceendlinenumber="483"><code>string viewId</code><br>  Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="486" sourceendlinenumber="486"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="488" sourceendlinenumber="488">  The response includes a status code and a response body containing a serialized event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="490" sourceendlinenumber="490">  For a stream of type Simple, when making a Get Distinct Value request at an existing stored index: </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="492" sourceendlinenumber="492"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetDistinctValue?index=2017-11-23T13:00:00Z 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="494" sourceendlinenumber="494">The event at that index is returned in the response:</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="496" sourceendlinenumber="496"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="498" sourceendlinenumber="504"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
     &quot;Measurement&quot;:10.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="506" sourceendlinenumber="506">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="508" sourceendlinenumber="508">For a request at an index for which no stored event exists:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="510" sourceendlinenumber="511"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
    GetDistinctValue?index=2017-11-23T13:30:00Z
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="513" sourceendlinenumber="513">No distinct value is found at the specified index, and an error response is returned:</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="515" sourceendlinenumber="515"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="517" sourceendlinenumber="522"><code>  HTTP/1.1 404
  Content-Type: application/json

  {  
     &quot;Message&quot;:&quot;Resource not found&quot; 
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="525" sourceendlinenumber="525"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="526" sourceendlinenumber="533"><code class="lang-csharp">   Task&lt;T&gt; GetDistinctValueAsync&lt;T&gt;(string streamId, string index, 
      string viewId = null);
   Task&lt;T&gt; GetDistinctValueAsync&lt;T, T1&gt;(string streamId, Tuple&lt;T1&gt; index, 
      string viewId = null);
   Task&lt;T&gt; GetDistinctValueAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; index, 
      string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="535" sourceendlinenumber="535"><a name="getdistinctvalueuomconversion"></a></p>
<h3 id="request-uom-conversion-3" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="536" sourceendlinenumber="536">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="538" sourceendlinenumber="539"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetDistinctValue
     ?index={index}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="541" sourceendlinenumber="541"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="543" sourceendlinenumber="544"><code>string tenantId</code><br>  The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="546" sourceendlinenumber="547"><code>string namespaceId</code><br>  The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="549" sourceendlinenumber="550"><code>string streamId</code><br>  The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="552" sourceendlinenumber="553"><code>string index</code><br>  The index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="555" sourceendlinenumber="556"><code>string viewId</code><br>  Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="558" sourceendlinenumber="558"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="560" sourceendlinenumber="560">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="561" sourceendlinenumber="568"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="570" sourceendlinenumber="570"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="572" sourceendlinenumber="572">The response includes a status code and response body containing a serialized event similar to the standard request above (without Uom conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the Measurement property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="574" sourceendlinenumber="574"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="576" sourceendlinenumber="582"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
     &quot;Measurement&quot;:1000.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="584" sourceendlinenumber="584"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="585" sourceendlinenumber="592"><code class="lang-csharp">   Task&lt;T&gt; GetDistinctValueAsync&lt;T&gt;(string streamId, string index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
      string viewId = null);
   Task&lt;T&gt; GetDistinctValueAsync&lt;T, T1&gt;(string streamId, Tuple&lt;T1&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
      string viewId = null);
   Task&lt;T&gt; GetDistinctValueAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
      string viewId = null);
</code></pre><hr>
<h2 id="find-distinct-value" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="595" sourceendlinenumber="595"><code>Find Distinct Value</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="596" sourceendlinenumber="596">Get Last Value supports two ways to retrieve an event:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="597" sourceendlinenumber="598">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="597" sourceendlinenumber="597"><a href="#finddistinctvaluestandard" data-raw-source="[Standard](#finddistinctvaluestandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="597" sourceendlinenumber="597">Standard</a>: Returns a stored event found based on the specified SdsSearchMode and index. </li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="598" sourceendlinenumber="598"><a href="#finddistinctvalueuomconversion" data-raw-source="[Uom Conversion](#finddistinctvalueuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="598" sourceendlinenumber="598">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="598" sourceendlinenumber="598">Units of Measure</a> for additional information</li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="600" sourceendlinenumber="600"><a name="finddistinctvaluestandard"></a></p>
<h3 id="request-standard-4" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="601" sourceendlinenumber="601">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="603" sourceendlinenumber="604"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/FindDistinctValue
     ?index={index}&amp;mode={mode}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="606" sourceendlinenumber="606"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="608" sourceendlinenumber="609"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="611" sourceendlinenumber="612"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="614" sourceendlinenumber="615"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="617" sourceendlinenumber="618"><code>string index</code><br>The index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="620" sourceendlinenumber="621"><code>string mode</code><br>The SdsSearchMode</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="623" sourceendlinenumber="624"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="627" sourceendlinenumber="627"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="629" sourceendlinenumber="629">  The response includes a status code and a response body containing a serialized event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="631" sourceendlinenumber="631">For a stream of type Simple the following request, </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="633" sourceendlinenumber="634"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      FindDistinctValue?index=2017-11-23T13:00:00Z&amp;mode=Next
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="636" sourceendlinenumber="638">The request has an index that matches the index of an existing event, but because<br>a SdsSearchMode of <code>next</code> was specified, the response contains the next event in the stream after the 
specified index:</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="640" sourceendlinenumber="640"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="642" sourceendlinenumber="649"><code>  HTTP/1.1 200
  Content-Type: application/json

  Formatted JSON Data
  {  
     &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
     &quot;Measurement&quot;:20.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="652" sourceendlinenumber="652">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="654" sourceendlinenumber="654">For the following request,</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="656" sourceendlinenumber="657"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
    FindDistinctValue?index=2017-11-23T13:30:00Z&amp;mode=Next
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="659" sourceendlinenumber="660">The request specifies an index that does not match an index of an existing event. 
The next event in the stream is retrieved.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="662" sourceendlinenumber="662"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="664" sourceendlinenumber="671"><code>  HTTP/1.1 200
  Content-Type: application/json

  Formatted JSON Data
  {  
     &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
     &quot;Measurement&quot;:20.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="673" sourceendlinenumber="673"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="674" sourceendlinenumber="681"><code class="lang-csharp">   Task&lt;T&gt; FindDistinctValueAsync&lt;T&gt;(string streamId, string index, 
            SdsSearchMode mode, string viewId = null);
   Task&lt;T&gt; FindDistinctValueAsync&lt;T, T1&gt;(string streamId, Tuple&lt;T1&gt; index, 
            SdsSearchMode mode, string viewId = null);
   Task&lt;T&gt; FindDistinctValueAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; index, 
            SdsSearchMode mode, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="682" sourceendlinenumber="682"><a name="finddistinctvalueuomconversion"></a></p>
<h3 id="request-uom-conversion-4" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="683" sourceendlinenumber="683">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="685" sourceendlinenumber="686"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/FindDistinctValue
     ?index={index}&amp;mode={mode}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="688" sourceendlinenumber="688"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="690" sourceendlinenumber="691"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="693" sourceendlinenumber="694"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="696" sourceendlinenumber="697"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="699" sourceendlinenumber="700"><code>string index</code><br>The index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="702" sourceendlinenumber="703"><code>string mode</code><br>The SdsSearchMode</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="705" sourceendlinenumber="706"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="708" sourceendlinenumber="708"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="710" sourceendlinenumber="710">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="711" sourceendlinenumber="718"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="720" sourceendlinenumber="720"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="722" sourceendlinenumber="722">The response includes a status code and response body containing a serialized event similar to the standard request above (without Uom conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="724" sourceendlinenumber="724"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="726" sourceendlinenumber="733"><code>  HTTP/1.1 200
  Content-Type: application/json

  Formatted JSON Data
  {  
     &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
     &quot;Measurement&quot;:2000.0
  }
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="736" sourceendlinenumber="736"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="738" sourceendlinenumber="745"><code class="lang-csharp">   Task&lt;T&gt; FindDistinctValueAsync&lt;T&gt;(string streamId, string index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
            SdsSearchMode mode, string viewId = null);
   Task&lt;T&gt; FindDistinctValueAsync&lt;T, T1&gt;(string streamId, Tuple&lt;T1&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
            SdsSearchMode mode, string viewId = null);
   Task&lt;T&gt; FindDistinctValueAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
            SdsSearchMode mode, string viewId = null);
</code></pre><hr>
<h2 id="get-values" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="749" sourceendlinenumber="750"><code>Get Values</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="752" sourceendlinenumber="752">Returns a collection of values at indexes based on request parameters. </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="754" sourceendlinenumber="755">As with the single event call to Get Value, the stream’s read characteristics determine how events 
are calculated for indexes at which no stored event exists.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="757" sourceendlinenumber="757">Get Values supports six ways of specifying which events to return. </p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="759" sourceendlinenumber="766">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="759" sourceendlinenumber="760"><a href="#getvaluesrangedstandard" data-raw-source="[Ranged](#getvaluesrangedstandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="759" sourceendlinenumber="759">Ranged</a>: A range can be specified with a start index, end index, and count. This will return the specified 
count of events evenly spaced from start index to end index.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="761" sourceendlinenumber="761"><a href="#getvaluesindexcollectionstandard" data-raw-source="[Index Collection](#getvaluesindexcollectionstandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="761" sourceendlinenumber="761">Index Collection</a>: Multiple indexes can be passed to the request in order to retrieve events at exactly those indexes.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="762" sourceendlinenumber="763"><a href="#getvaluesfilteredstandard" data-raw-source="[Filtered](#getvaluesfilteredstandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="762" sourceendlinenumber="762">Filtered</a>: A filtered request accepts a <a class="xref" href="Filter_Expressions.html" data-raw-source="[filter expression](xref:sdsFilterExpressions)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="762" sourceendlinenumber="762">filter expression</a> that limits results by applying an expression against 
event fields. Filter expressions are explained in detail in the <a class="xref" href="Filter_Expressions.html" data-raw-source="[Filter expressions](xref:sdsFilterExpressions)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="763" sourceendlinenumber="763">Filter expressions</a> section.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="764" sourceendlinenumber="764"><a href="#getvaluesrangeduomconversion" data-raw-source="[Ranged with Uom Conversion](#getvaluesrangeduomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="764" sourceendlinenumber="764">Ranged with Uom Conversion</a>: Same as Ranged, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="764" sourceendlinenumber="764">Units of Measure</a> for additional information</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="765" sourceendlinenumber="765"><a href="#getvaluesindexcollectionuomconversion" data-raw-source="[Index Collection with Uom Conversion](#getvaluesindexcollectionuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="765" sourceendlinenumber="765">Index Collection with Uom Conversion</a>: Same as Index Collection, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="765" sourceendlinenumber="765">Units of Measure</a> for additional information</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="766" sourceendlinenumber="766"><a href="#getvaluesfiltereduomconversion" data-raw-source="[Filtered with Uom Conversion](#getvaluesfiltereduomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="766" sourceendlinenumber="766">Filtered with Uom Conversion</a>: Same as Filtered, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. Note that the filter is applied <em>before</em> any unit conversions. See <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="766" sourceendlinenumber="766">Units of Measure</a> for additional information</li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="768" sourceendlinenumber="768"><a name="getvaluesrangedstandard"></a></p>
<h3 id="request-ranged" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="769" sourceendlinenumber="769">Request (Ranged)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="771" sourceendlinenumber="772"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
  ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;count={count}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="774" sourceendlinenumber="774"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="776" sourceendlinenumber="777"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="779" sourceendlinenumber="780"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="782" sourceendlinenumber="783"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="785" sourceendlinenumber="786"><code>string startIndex</code><br>The index defining the beginning of the range</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="788" sourceendlinenumber="789"><code>string endIndex</code><br>The index defining the end of the range  </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="791" sourceendlinenumber="792"><code>int count</code><br>The number of events to return. Read characteristics of the stream determine how the form of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="794" sourceendlinenumber="795"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="798" sourceendlinenumber="798"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="800" sourceendlinenumber="800">  The response includes a status code and a response body containing a serialized collection of events.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="802" sourceendlinenumber="802">  For a stream of type Simple, the following request, </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="804" sourceendlinenumber="805"><code>  api/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
      ?startIndex=2017-11-23T13:00:00Z&amp;endIndex=2017-11-23T15:00:00Z&amp;count=3
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="807" sourceendlinenumber="808">For this request, the start and end fall exactly on event indexes and the number of events 
from start to end match the count of three (3).</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="810" sourceendlinenumber="810"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="812" sourceendlinenumber="828"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:30.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="831" sourceendlinenumber="831">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="834" sourceendlinenumber="834"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="835" sourceendlinenumber="842"><code class="lang-csharp">      Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T&gt;(string streamId, string startIndex, 
           string endIndex, int count, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
           T1 endIndex, int count, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1, T2&gt;string streamId, Tuple&lt;T1, T2&gt; startIndex, 
           Tuple&lt;T1, T2&gt; endIndex, int count, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="844" sourceendlinenumber="844"><a name="getvaluesindexcollectionstandard"></a></p>
<h3 id="request-index-collection" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="845" sourceendlinenumber="845">Request (Index collection)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="847" sourceendlinenumber="848"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
  ?index={index}[&amp;index={index} …]&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="850" sourceendlinenumber="850"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="852" sourceendlinenumber="853"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="855" sourceendlinenumber="856"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="858" sourceendlinenumber="859"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="861" sourceendlinenumber="862"><code>string index</code><br>One or more indexes of values to retrieve</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="864" sourceendlinenumber="865"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="868" sourceendlinenumber="868"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="870" sourceendlinenumber="870">  The response includes a status code and a response body containing a serialized collection of events.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="872" sourceendlinenumber="872">  For a stream of type Simple, the following request, </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="874" sourceendlinenumber="875"><code>  api/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
      ?index=2017-11-23T12:30:00Z&amp;index=2017-11-23T13:00:00Z&amp;index=2017-11-23T14:00:00Z
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="877" sourceendlinenumber="877">For this request, the response contains events for each of the three specified indexes.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="879" sourceendlinenumber="879"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="881" sourceendlinenumber="897"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T12:30:00Z&quot;,
        &quot;Measurement&quot;:5.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="900" sourceendlinenumber="900">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="903" sourceendlinenumber="903"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="904" sourceendlinenumber="913"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T&gt;(string streamId, IEnumerable&lt;string&gt; index, 
         string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1&gt;(string streamId, IEnumerable&lt;T1&gt; index,
         string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         IEnumerable&lt;Tuple&lt; T1, T2&gt;&gt; index, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="915" sourceendlinenumber="915"><a name="getvaluesfilteredstandard"></a></p>
<h3 id="request-filtered" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="916" sourceendlinenumber="916">Request (Filtered)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="918" sourceendlinenumber="919"><code>    GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/ 
       GetValues?filter={filter}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="922" sourceendlinenumber="922"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="924" sourceendlinenumber="925"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="927" sourceendlinenumber="928"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="930" sourceendlinenumber="931"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="933" sourceendlinenumber="934"><code>string filter</code><br>The filter expression (see <a class="xref" href="Filter_Expressions.html" data-raw-source="[Filter expressions](xref:sdsFilterExpressions)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="934" sourceendlinenumber="934">Filter expressions</a>)</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="936" sourceendlinenumber="937"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="940" sourceendlinenumber="940"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="942" sourceendlinenumber="942">  The response includes a status code and a response body containing a serialized collection of events.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="944" sourceendlinenumber="944">  For a stream of type Simple, the following request, </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="946" sourceendlinenumber="947"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/GetValues 
      ?filter=Measurement gt 10
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="949" sourceendlinenumber="949">The events in the stream whose Measurement is less than or equal to 10 are not returned.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="952" sourceendlinenumber="952"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="954" sourceendlinenumber="970"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:30.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T16:00:00Z&quot;,
        &quot;Measurement&quot;:40.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="974" sourceendlinenumber="974">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="977" sourceendlinenumber="977"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="978" sourceendlinenumber="981"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetFilteredValuesAsync&lt;T&gt;(string streamId, string filter, 
         string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="983" sourceendlinenumber="983"><a name="getvaluesrangeduomconversion"></a></p>
<h3 id="request-ranged-with-uom-conversion" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="984" sourceendlinenumber="984">Request (Ranged with Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="986" sourceendlinenumber="987"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
  ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;count={count}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="989" sourceendlinenumber="989"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="991" sourceendlinenumber="992"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="994" sourceendlinenumber="995"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="997" sourceendlinenumber="998"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1000" sourceendlinenumber="1001"><code>string startIndex</code><br>The index defining the beginning of the range</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1003" sourceendlinenumber="1004"><code>string endIndex</code><br>The index defining the end of the range  </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1006" sourceendlinenumber="1007"><code>int count</code><br>The number of events to return. Read characteristics of the stream determine how the form of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1009" sourceendlinenumber="1010"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1012" sourceendlinenumber="1012"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1014" sourceendlinenumber="1014">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1015" sourceendlinenumber="1022"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1024" sourceendlinenumber="1024"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1026" sourceendlinenumber="1026">The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1028" sourceendlinenumber="1028"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1030" sourceendlinenumber="1046"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:1000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:2000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:3000.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1048" sourceendlinenumber="1048"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1049" sourceendlinenumber="1056"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         string endIndex, int count, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         T1 endIndex, int count, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1, T2&gt;string streamId, Tuple&lt;T1, T2&gt; startIndex, 
         Tuple&lt;T1, T2&gt; endIndex, int count, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1058" sourceendlinenumber="1058"><a name="getvaluesindexcollectionuomconversion"></a></p>
<h3 id="request-index-collection-with-uom-conversion" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1059" sourceendlinenumber="1059">Request (Index collection with Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1061" sourceendlinenumber="1062"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
  ?index={index}[&amp;index={index} …]&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1064" sourceendlinenumber="1064"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1066" sourceendlinenumber="1067"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1069" sourceendlinenumber="1070"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1072" sourceendlinenumber="1073"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1075" sourceendlinenumber="1076"><code>string index</code><br>One or more indexes of values to retrieve</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1078" sourceendlinenumber="1079"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1081" sourceendlinenumber="1081"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1083" sourceendlinenumber="1083">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1084" sourceendlinenumber="1091"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1093" sourceendlinenumber="1093"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1095" sourceendlinenumber="1095">The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1097" sourceendlinenumber="1097"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1099" sourceendlinenumber="1115"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T12:30:00Z&quot;,
        &quot;Measurement&quot;:500.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:1000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:2000.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1117" sourceendlinenumber="1117"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1118" sourceendlinenumber="1127"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T&gt;(string streamId, IEnumerable&lt;string&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
         string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1&gt;(string streamId, IEnumerable&lt;T1&gt; index, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
         string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         IEnumerable&lt;Tuple&lt; T1, T2&gt;&gt; index, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1129" sourceendlinenumber="1129"><a name="getvaluesfiltereduomconversion"></a></p>
<h3 id="request-filtered-with-uom-conversion" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1130" sourceendlinenumber="1130">Request (Filtered with Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1132" sourceendlinenumber="1133"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetValues
  ?filter={filter}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1136" sourceendlinenumber="1136"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1138" sourceendlinenumber="1139"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1141" sourceendlinenumber="1142"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1144" sourceendlinenumber="1145"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1147" sourceendlinenumber="1148"><code>string filter</code><br>The filter expression (see <a class="xref" href="Filter_Expressions.html" data-raw-source="[Filter expressions](xref:sdsFilterExpressions)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1148" sourceendlinenumber="1148">Filter expressions</a>)</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1150" sourceendlinenumber="1151"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1153" sourceendlinenumber="1153"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1155" sourceendlinenumber="1155">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1156" sourceendlinenumber="1163"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1165" sourceendlinenumber="1165"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1167" sourceendlinenumber="1167">The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event. Note that the filter expression is applied to values <em>before</em> unit conversion.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1169" sourceendlinenumber="1169"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1171" sourceendlinenumber="1187"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:2000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:3000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T16:00:00Z&quot;,
        &quot;Measurement&quot;:4000.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1189" sourceendlinenumber="1189"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1190" sourceendlinenumber="1193"><code class="lang-csharp">      Task&lt;IEnumerable&lt;T&gt;&gt; GetFilteredValuesAsync&lt;T&gt;(string streamId, string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
          string viewId = null);
</code></pre><hr>
<h2 id="get-range-values" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1196" sourceendlinenumber="1196"><code>Get Range Values</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1197" sourceendlinenumber="1197">Get Range Values supports two ways to retrieve events:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1198" sourceendlinenumber="1199">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1198" sourceendlinenumber="1198"><a href="#getrangevaluesstandard" data-raw-source="[Standard](#getrangevaluesstandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1198" sourceendlinenumber="1198">Standard</a>: Returns a collection of values as determined by a start index and count. Additional optional parameters specify the direction of the range, how to handle events near or at the start index, whether to skip a certain number of events at the start of the range, and how to filter the data.</li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1199" sourceendlinenumber="1199"><a href="#getrangevaluesuomconversion" data-raw-source="[Uom Conversion](#getrangevaluesuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1199" sourceendlinenumber="1199">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1199" sourceendlinenumber="1199">Units of Measure</a> for additional information </li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1201" sourceendlinenumber="1201"><a name="getrangevaluesstandard"></a></p>
<h3 id="request-standard-5" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1202" sourceendlinenumber="1202">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1204" sourceendlinenumber="1206"><code>  GET   api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetRangeValues
     ?startIndex={startIndex}&amp;count={count}&amp;skip={skip}&amp;reversed={reversed} 
     &amp;boundaryType={boundaryType}&amp;filter={filter}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1208" sourceendlinenumber="1208"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1210" sourceendlinenumber="1211"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1213" sourceendlinenumber="1214"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1216" sourceendlinenumber="1217"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1219" sourceendlinenumber="1220"><code>string startIndex</code><br>Index identifying the beginning of the series of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1222" sourceendlinenumber="1223"><code>int count</code><br>The number of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1225" sourceendlinenumber="1226"><code>int skip</code><br>Optional value specifying the number of events to skip at the beginning of the result</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1228" sourceendlinenumber="1231"><code>bool reversed</code><br>Optional specification of the direction of the request. By default, range requests move forward 
from startIndex, collecting events after startIndex from the stream. A reversed request will 
collect events before startIndex from the stream.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1233" sourceendlinenumber="1234"><code>SdsBoundaryType boundaryType</code><br>Optional SdsBoundaryType specifies the handling of events at or near startIndex</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1236" sourceendlinenumber="1237"><code>string filter</code><br>Optional filter expression</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1239" sourceendlinenumber="1240"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1242" sourceendlinenumber="1242"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1244" sourceendlinenumber="1244">  The response includes a status code and a response body containing a serialized collection of events.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1246" sourceendlinenumber="1247">  For a stream of type Simple, the following request will return a response with up to 100 events starting 
  at 13:00 and extending forward toward the end of the stream: </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1249" sourceendlinenumber="1250"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetRangeValues?startIndex=2017-11-23T13:00:00Z&amp;count=100
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1254" sourceendlinenumber="1254"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1256" sourceendlinenumber="1276"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:30.0
     },
     {  
       &quot;Time&quot;:&quot;2017-11-23T16:00:00Z&quot;,
        &quot;Measurement&quot;:40.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1279" sourceendlinenumber="1279">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1281" sourceendlinenumber="1282">To reverse the direction of the request, set reversed to true. This request will 
return up to 100 events starting at 13:00 and extending back toward the start of the stream:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1284" sourceendlinenumber="1285"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetRangeValues?startIndex=2017-11-23T13:00:00Z&amp;count=100&amp;reversed=true
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1289" sourceendlinenumber="1289"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1291" sourceendlinenumber="1302"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T12:00:00Z&quot;
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1304" sourceendlinenumber="1305">Note that State is not included in the JSON as its value is the default value. 
Further, Measurement is not include in the second, 12:00:00, event as zero is the default value for numbers.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1307" sourceendlinenumber="1311">The following request specifies a boundary type of Outside for a reversed-direction range request. 
The response will contain up to 100 events. The boundary type Outside indicates that up to one 
event outside the boundary will be included in the response. For a reverse direction range request, 
this means one event forward of the specified start index. In a default direction range request, 
it would mean one event before the specified start index.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1313" sourceendlinenumber="1315"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetRangeValues?startIndex=2017-11-23T13:00:00Z&amp;count=100&amp;reversed=true 
      &amp;boundaryType=2
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1317" sourceendlinenumber="1317"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1319" sourceendlinenumber="1334"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T12:00:00Z&quot;
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1337" sourceendlinenumber="1338">The event outside of the index is the next event or the event at 14:00 because the 
request operates in reverse.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1340" sourceendlinenumber="1341">Note that State is not included in the JSON as its value is the default value. Further 
Measurement is not included in the last event as its value is default.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1343" sourceendlinenumber="1343">Adding a filter to the request means only events that meet the filter criteria are returned:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1345" sourceendlinenumber="1347"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetRangeValues?startIndex=2017-11-23T13:00:00Z&amp;count=100&amp;reversed=true 
      &amp;boundaryType=2&amp;filter=Measurement gt 10
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1349" sourceendlinenumber="1349"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1351" sourceendlinenumber="1363"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1367" sourceendlinenumber="1367"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1368" sourceendlinenumber="1407"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         int count, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         int count, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; 
         startIndex, int count, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         int count, bool reversed, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         int count, bool reversed, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, int count, bool reversed, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         int count, SdsBoundaryType boundaryType, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         int count, SdsBoundaryType boundaryType, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, int count, SdsBoundaryType boundaryType, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; 
         startIndex, int skip, int count, bool reversed, SdsBoundaryType 
         boundaryType, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeFilteredValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, 
         string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeFilteredValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, 
         string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, int skip, int count, bool reversed, SdsBoundaryType boundaryType, 
         string filter, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1408" sourceendlinenumber="1408"><a name="getrangevaluesuomconversion"></a></p>
<h3 id="request-unit-conversion" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1409" sourceendlinenumber="1409">Request (Unit Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1411" sourceendlinenumber="1413"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetRangeValues 
     ?startIndex={startIndex}&amp;count={count}&amp;skip={skip}&amp;reversed={reversed} 
     &amp;boundaryType={boundaryType}&amp;filter={filter}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1415" sourceendlinenumber="1415"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1417" sourceendlinenumber="1418"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1420" sourceendlinenumber="1421"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1423" sourceendlinenumber="1424"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1426" sourceendlinenumber="1427"><code>string startIndex</code><br>Index identifying the beginning of the series of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1429" sourceendlinenumber="1430"><code>int count</code><br>The number of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1432" sourceendlinenumber="1433"><code>int skip</code><br>Optional value specifying the number of events to skip at the beginning of the result</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1435" sourceendlinenumber="1438"><code>bool reversed</code><br>Optional specification of the direction of the request. By default, range requests move forward 
from startIndex, collecting events after startIndex from the stream. A reversed request will 
collect events before startIndex from the stream.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1440" sourceendlinenumber="1441"><code>SdsBoundaryType boundaryType</code><br>Optional SdsBoundaryType specifies the handling of events at or near startIndex</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1443" sourceendlinenumber="1444"><code>string filter</code><br>Optional filter expression</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1446" sourceendlinenumber="1447"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1449" sourceendlinenumber="1449"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1451" sourceendlinenumber="1451">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1452" sourceendlinenumber="1459"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1461" sourceendlinenumber="1461"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1463" sourceendlinenumber="1463">The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1465" sourceendlinenumber="1465"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1467" sourceendlinenumber="1487"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:1000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:2000.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:3000.0
     },
     {  
       &quot;Time&quot;:&quot;2017-11-23T16:00:00Z&quot;,
        &quot;Measurement&quot;:4000.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1489" sourceendlinenumber="1489"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1490" sourceendlinenumber="1529"><code class="lang-csharp">      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex,
          int count, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
          int count, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; 
          startIndex, int count, string viewId = null);

      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
          int count, bool reversed, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
          int count, bool reversed, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, 
          Tuple&lt;T1, T2&gt; startIndex, int count, bool reversed, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
          int count, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
          int count, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, 
          Tuple&lt;T1, T2&gt; startIndex, int count, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T&gt;(string streamId, string startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeValuesAsync&lt;T, T1, T2&gt;(string streamId, Tuple&lt;T1, T2&gt; 
          startIndex, int skip, int count, bool reversed, SdsBoundaryType 
          boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeFilteredValuesAsync&lt;T&gt;(string streamId, string startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
          string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeFilteredValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
          int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
          string viewId = null);
      Task&lt;IEnumerable&lt;T&gt;&gt; GetRangeFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
          Tuple&lt;T1, T2&gt; startIndex, int skip, int count, bool reversed, SdsBoundaryType boundaryType, 
          string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
</code></pre><hr>
<h2 id="get-window-values" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1532" sourceendlinenumber="1532"><code>Get Window Values</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1533" sourceendlinenumber="1533">Get Window Values supports two ways of retrieving events:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1534" sourceendlinenumber="1538">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1534" sourceendlinenumber="1537"><a href="#getwindowvaluesstandard" data-raw-source="[Standard](#getwindowvaluesstandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1534" sourceendlinenumber="1534">Standard</a>: Get Window Values returns a collection of stored events based on specified start and end indexes. 
For handling events at and near the boundaries of the window, a single SdsBoundaryType that applies 
to both the start and end indexes can be passed with the request, or separate boundary types may 
be passed for the start and end individually. </li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1538" sourceendlinenumber="1538"><a href="#getwindowvaluesuomconversion" data-raw-source="[Uom Conversion](#getwindowvaluesuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1538" sourceendlinenumber="1538">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See  <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1538" sourceendlinenumber="1538">Units of Measure</a> for additional information</li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1540" sourceendlinenumber="1541">Get Window Values also supports paging for large result sets. Results for paged requests are returned 
as a SdsResultPage.</p>
<table sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1544" sourceendlinenumber="1547">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>Results</td>
<td>IList</td>
<td>Collection of events of type T</td>
</tr>
<tr>
<td>ContinuationToken</td>
<td>String</td>
<td>The token used to retrieve the next page of data</td>
</tr>
</tbody>
</table>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1549" sourceendlinenumber="1550">To retrieve the next page of values, include the ContinuationToken from the results of the previous request. 
For the first request, specify a null or empty string for the ContinuationToken.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1552" sourceendlinenumber="1552"><a name="getwindowvaluesstandard"></a></p>
<h3 id="request-standard-6" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1553" sourceendlinenumber="1553">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1555" sourceendlinenumber="1571"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;boundaryType={boundaryType} 
      &amp;filter={filter}&amp;count={count}&amp;viewId={viewId}

  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;startBoundaryType={startBoundaryType} 
      &amp;endIndex={endIndex}&amp;endBoundaryType={endBoundaryType}&amp;filter={filter}&amp;count={count} 
      &amp;viewId={viewId}

  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;boundaryType={boundaryType} 
      &amp;filter={filter}&amp;count={count}&amp;continuationToken={continuationToken}&amp;viewId={viewId}

  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;startBoundaryType={startBoundaryType} 
      &amp;endIndex={endIndex}&amp;endBoundaryType={endBoundaryType}&amp;filter={filter}&amp;count={count} 
      &amp;continuationToken={continuationToken}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1575" sourceendlinenumber="1575"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1577" sourceendlinenumber="1578"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1580" sourceendlinenumber="1581"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1583" sourceendlinenumber="1584"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1586" sourceendlinenumber="1587"><code>string startIndex</code><br>Index bounding the beginning of the series of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1589" sourceendlinenumber="1590"><code>string endIndex</code><br>Index bounding the end of the series of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1592" sourceendlinenumber="1593"><code>int count</code><br>Optional maximum number of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1595" sourceendlinenumber="1596"><code>SdsBoundaryType boundaryType</code><br>Optional SdsBoundaryType specifies handling of events at or near the start and end indexes</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1598" sourceendlinenumber="1599"><code>SdsBoundaryType startBoundaryType</code><br>Optional SdsBoundaryType specifies the first value in the result in relation to the start index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1601" sourceendlinenumber="1602"><code>SdsBoundaryType endBoundaryType</code><br>  Optional SdsBoundaryType specifies the last value in the result in relation to the end index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1604" sourceendlinenumber="1605"><code>string filter</code><br>  Optional filter expression</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1607" sourceendlinenumber="1608"><code>string viewId</code><br>  Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1612" sourceendlinenumber="1612"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1614" sourceendlinenumber="1614">  The response includes a status code and a response body containing a serialized collection of events.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1616" sourceendlinenumber="1616">  For a stream of type Simple, the following requests all stored events between 13:30 and 15:30: </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1618" sourceendlinenumber="1619"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetWindowValues?startIndex=2017-11-23T12:30:00Z&amp;endIndex=2017-11-23T15:30:00Z
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1621" sourceendlinenumber="1621">The response will contain the event stored at the specified index:</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1623" sourceendlinenumber="1623"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1624" sourceendlinenumber="1641"><code class="lang-json">      Content-Type: application/json

      [  
         {  
            &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
            &quot;Measurement&quot;:10.0
         },
         {  
            &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
            &quot;Measurement&quot;:20.0
         },
         {  
            &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
            &quot;Measurement&quot;:30.0
         }
      ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1643" sourceendlinenumber="1643">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1645" sourceendlinenumber="1646">When the request is modified to specify a boundary type of Outside, the value 
before 13:30 and the value after 15:30 are included:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1648" sourceendlinenumber="1650"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetWindowValues?startIndex=2017-11-23T12:30:00Z&amp;endIndex=2017-11-23T15:30:00Z 
      &amp;boundaryType=2
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1653" sourceendlinenumber="1653"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1655" sourceendlinenumber="1678"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T12:00:00Z&quot;
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
       &quot;Measurement&quot;:30.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T16:00:00Z&quot;,
        &quot;Measurement&quot;:40.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1680" sourceendlinenumber="1682">Note that State is not included in the JSON as its value is the default value. 
Further, Measurement is not include in the second, 12:00:00, event as zero is the default 
value for numbers.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1684" sourceendlinenumber="1686">If instead a start boundary of Inside, only values inside the start boundary (after 13:30) 
are included in the result. With an end boundary of Outside one value outside the end index 
(after 15:30) is included:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1688" sourceendlinenumber="1690"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetWindowValues?startIndex=2017-11-23T12:30:00Z&amp;&amp;startBoundaryType=1 
      &amp;endIndex=2017-11-23T15:30:00Z&amp;endBoundaryType=2
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1692" sourceendlinenumber="1692"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1694" sourceendlinenumber="1714"><code>  HTTP/1.1 200
  Content-Type: application/json

  [  
     {  
        &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
        &quot;Measurement&quot;:10.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
        &quot;Measurement&quot;:20.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
        &quot;Measurement&quot;:30.0
     },
     {  
        &quot;Time&quot;:&quot;2017-11-23T16:00:00Z&quot;,
        &quot;Measurement&quot;:40.0
     }
  ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1717" sourceendlinenumber="1717">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1719" sourceendlinenumber="1721">In order to page the results of the request, a continuation token may be specified. 
This requests the first page of the first two stored events between start index and 
end index by indicating count is 2 and continuationToken is an empty string:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1723" sourceendlinenumber="1725"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetWindowValues?startIndex=2017-11-23T12:30:00Z&amp;endIndex=2017-11-23T15:30:00Z 
      &amp;count=2&amp;continuationToken=
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1727" sourceendlinenumber="1727"><em>Response body</em>*</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1729" sourceendlinenumber="1744"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Results&quot;:[  
        {  
           &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
           &quot;Measurement&quot;:10.0
        },
        {  
           &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
           &quot;Measurement&quot;:20.0
        }
     ],
     &quot;ContinuationToken&quot;:&quot;2017-11-23T14:00:00.0000000Z&quot;
  } 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1747" sourceendlinenumber="1747">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1749" sourceendlinenumber="1750">This Get Window Values request uses the continuation token from the previous 
page to request the next page of stored events:</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1752" sourceendlinenumber="1754"><code>  api/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
      GetWindowValues?startIndex=2017-11-23T12:30:00Z&amp;endIndex=2017-11-23T15:30:00Z 
      &amp;count=2&amp;continuationToken=2017-11-23T14:00:00Z
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1757" sourceendlinenumber="1757"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1759" sourceendlinenumber="1769"><code>  HTTP/1.1 200
  Content-Type: application/json

  {  
     &quot;Results&quot;:[  
        {  
           &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
           &quot;Measurement&quot;:30.0
        }
     ]
  } 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1772" sourceendlinenumber="1773">In this case, the results contain the final event. The returned continuation token is null 
(not shown because it null is the default value for a JSON string). </p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1775" sourceendlinenumber="1775">Note that State is not included in the JSON as its value is the default value.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1779" sourceendlinenumber="1779"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1780" sourceendlinenumber="1864"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         string endIndex, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex,
         T1 endIndex, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, T
         uple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         string endIndex, SdsBoundaryType boundaryType, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
   SdsBoundaryType boundaryType, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
         SdsBoundaryType boundaryType, string filter, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
         SdsBoundaryType endBoundaryType, string filter, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId,
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, SdsBoundaryType startBoundaryType, 
         Tuple&lt;T1, T2&gt; endIndex, SdsBoundaryType endBoundaryType, 
         string filter, string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, string startIndex,
         string endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
         SdsBoundaryType boundaryType, int count, string continuationToken, 
         string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, int count, string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, 
         int count, string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
         SdsBoundaryType boundaryType, string filter, int count, 
         string continuationToken, string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, SdsBoundaryType startBoundaryType, 
         Tuple&lt;T1, T2&gt; endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, SdsBoundaryType startBoundaryType, 
         Tuple&lt;T1, T2&gt; endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1866" sourceendlinenumber="1866"><a name="getwindowvaluesuomconversion"></a></p>
<h3 id="request-uom-conversion-5" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1867" sourceendlinenumber="1867">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1869" sourceendlinenumber="1885"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;boundaryType={boundaryType} 
      &amp;filter={filter}&amp;count={count}&amp;viewId={viewId}

  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;startBoundaryType={startBoundaryType} 
      &amp;endIndex={endIndex}&amp;endBoundaryType={endBoundaryType}&amp;filter={filter}&amp;count={count} 
      &amp;viewId={viewId}

  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;boundaryType={boundaryType} 
      &amp;filter={filter}&amp;count={count}&amp;continuationToken={continuationToken}&amp;viewId={viewId}

  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetWindowValues 
      ?startIndex={startIndex}&amp;startBoundaryType={startBoundaryType} 
      &amp;endIndex={endIndex}&amp;endBoundaryType={endBoundaryType}&amp;filter={filter}&amp;count={count} 
      &amp;continuationToken={continuationToken}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1888" sourceendlinenumber="1888"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1890" sourceendlinenumber="1891"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1893" sourceendlinenumber="1894"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1896" sourceendlinenumber="1897"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1899" sourceendlinenumber="1900"><code>string startIndex</code><br>Index bounding the beginning of the series of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1902" sourceendlinenumber="1903"><code>string endIndex</code><br>Index bounding the end of the series of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1905" sourceendlinenumber="1906"><code>int count</code><br>Optional maximum number of events to return</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1908" sourceendlinenumber="1909"><code>SdsBoundaryType boundaryType</code><br>Optional SdsBoundaryType specifies handling of events at or near the start and end indexes</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1911" sourceendlinenumber="1912"><code>SdsBoundaryType startBoundaryType</code><br>Optional SdsBoundaryType specifies the first value in the result in relation to the start index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1914" sourceendlinenumber="1915"><code>SdsBoundaryType endBoundaryType</code><br>  Optional SdsBoundaryType specifies the last value in the result in relation to the end index</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1917" sourceendlinenumber="1918"><code>string filter</code><br>  Optional filter expression</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1920" sourceendlinenumber="1921"><code>string viewId</code><br>  Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1923" sourceendlinenumber="1923"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1925" sourceendlinenumber="1925">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1926" sourceendlinenumber="1933"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1935" sourceendlinenumber="1935"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1937" sourceendlinenumber="1937">The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1940" sourceendlinenumber="1940"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1941" sourceendlinenumber="1958"><code class="lang-json">      Content-Type: application/json

      [  
         {  
            &quot;Time&quot;:&quot;2017-11-23T13:00:00Z&quot;,
            &quot;Measurement&quot;:1000.0
         },
         {  
            &quot;Time&quot;:&quot;2017-11-23T14:00:00Z&quot;,
            &quot;Measurement&quot;:2000.0
         },
         {  
            &quot;Time&quot;:&quot;2017-11-23T15:00:00Z&quot;,
            &quot;Measurement&quot;:3000.0
         }
      ] 
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1960" sourceendlinenumber="1960"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="1961" sourceendlinenumber="2045"><code class="lang-csharp">   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         string endIndex, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex,
         T1 endIndex, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, T
         uple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, string startIndex, 
         string endIndex, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
   SdsBoundaryType boundaryType, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
         SdsBoundaryType boundaryType, string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
         SdsBoundaryType endBoundaryType, string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId,
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;IEnumerable&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, SdsBoundaryType startBoundaryType, 
         Tuple&lt;T1, T2&gt; endIndex, SdsBoundaryType endBoundaryType, 
         string filter, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, string startIndex,
         string endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, T1 startIndex, 
         T1 endIndex, SdsBoundaryType boundaryType, int count, 
         string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
         SdsBoundaryType boundaryType, int count, string continuationToken,  IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides,
         string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, string endIndex, SdsBoundaryType boundaryType, 
         string filter, int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, 
         int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, 
         SdsBoundaryType boundaryType, string filter, int count, 
         string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, SdsBoundaryType startBoundaryType, 
         Tuple&lt;T1, T2&gt; endIndex, SdsBoundaryType endBoundaryType, 
         int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);

   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T&gt;(string streamId, 
         string startIndex, SdsBoundaryType startBoundaryType, 
         string endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, SdsBoundaryType startBoundaryType, 
         T1 endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
   Task&lt;SdsResultPage&lt;T&gt;&gt; GetWindowFilteredValuesAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, SdsBoundaryType startBoundaryType, 
         Tuple&lt;T1, T2&gt; endIndex, SdsBoundaryType endBoundaryType, 
         string filter, int count, string continuationToken, IList&lt;SdsStreamPropertyOverride&gt; propertyOverrides, string viewId = null);
</code></pre><hr>
<h2 id="get-intervals" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2048" sourceendlinenumber="2048"><code>Get Intervals</code></h2>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2049" sourceendlinenumber="2049">Get Intervals supports two ways to retrieve events:</p>
<ul sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2050" sourceendlinenumber="2051">
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2050" sourceendlinenumber="2050"><a href="#getintervalsstandard" data-raw-source="[Standard](#getintervalsstandard)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2050" sourceendlinenumber="2050">Standard</a>: Returns summary intervals between a specified start and end index. </li>
<li sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2051" sourceendlinenumber="2051"><a href="#getintervalsuomconversion" data-raw-source="[Uom Conversion](#getintervalsuomconversion)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2051" sourceendlinenumber="2051">Uom Conversion</a>: Same as Standard, but with unit conversion(s) applied to data when the SdsStream or SdsType contains unit of measure information. See <a class="xref" href="Units_of_Measure.html" data-raw-source="[Units of Measure](xref:unitsOfMeasure)" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2051" sourceendlinenumber="2051">Units of Measure</a> for additional information </li>
</ul>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2053" sourceendlinenumber="2056">Index types that cannot be interpolated do not 
support GetIntervals requests. Strings are an example of indexes that cannot be interpolated. The 
Get Intervals method does not support compound indexes. Interpolating between two indexes 
that consist of multiple properties is not defined and results in non-determinant behavior.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2058" sourceendlinenumber="2059">Results are returned as a collection of SdsIntervals. Each SdsInterval has a start, end, and collection of 
summary values.</p>
<table sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2061" sourceendlinenumber="2068">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>Start</td>
<td>T</td>
<td>The start of the interval</td>
</tr>
<tr>
<td>End</td>
<td>T</td>
<td>The end of the interval</td>
</tr>
<tr>
<td>Summaries</td>
<td>IDictionary&lt;SdsSummaryType,</td>
<td>The summary values for the interval, keyed by</td>
</tr>
<tr>
<td></td>
<td>IDictionary&lt;string, object&gt;</td>
<td>summary type. The nested dictionary contains</td>
</tr>
<tr>
<td></td>
<td>Summaries</td>
<td>property name keys and summary calculation result</td>
</tr>
<tr>
<td></td>
<td></td>
<td>values.</td>
</tr>
</tbody>
</table>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2071" sourceendlinenumber="2071">Summary values supported by SdsSummaryType enum:</p>
<table sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2073" sourceendlinenumber="2086">
<thead>
<tr>
<th>Summary</th>
<th>Enumeration value</th>
</tr>
</thead>
<tbody>
<tr>
<td>Count</td>
<td>1</td>
</tr>
<tr>
<td>Minimum</td>
<td>2</td>
</tr>
<tr>
<td>Maximum</td>
<td>4</td>
</tr>
<tr>
<td>Range</td>
<td>8</td>
</tr>
<tr>
<td>Mean</td>
<td>16</td>
</tr>
<tr>
<td>StandardDeviation</td>
<td>64</td>
</tr>
<tr>
<td>Total</td>
<td>128</td>
</tr>
<tr>
<td>Skewness</td>
<td>256</td>
</tr>
<tr>
<td>Kurtosis</td>
<td>512</td>
</tr>
<tr>
<td>WeightedMean</td>
<td>1024</td>
</tr>
<tr>
<td>WeightedStandardDeviation</td>
<td>2048</td>
</tr>
<tr>
<td>WeightedPopulationStandardDeviatio</td>
<td>4096</td>
</tr>
</tbody>
</table>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2088" sourceendlinenumber="2088"><a name="getintervalsstandard"></a></p>
<h3 id="request-standard-7" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2089" sourceendlinenumber="2089">Request (Standard)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2091" sourceendlinenumber="2092"><code>  GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetIntervals
     ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;count={count}&amp;filter={filter}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2094" sourceendlinenumber="2094"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2096" sourceendlinenumber="2097"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2099" sourceendlinenumber="2100"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2102" sourceendlinenumber="2103"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2105" sourceendlinenumber="2106"><code>string startIndex</code><br>The start index for the intervals</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2108" sourceendlinenumber="2109"><code>string endIndex</code><br>The end index for the intervals</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2111" sourceendlinenumber="2112"><code>int count</code><br>The number of intervals requested</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2114" sourceendlinenumber="2115"><code>string filter</code><br>Optional filter expression</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2117" sourceendlinenumber="2118"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2120" sourceendlinenumber="2120"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2122" sourceendlinenumber="2122">  The response includes a status code and a response body containing a serialized collection of SdsIntervals.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2124" sourceendlinenumber="2125">For a stream of type Simple, the following requests calculates two summary intervals between the first 
and last events: </p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2127" sourceendlinenumber="2128"><code>  api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
    GetIntervals?startIndex=2017-11-23T12:00:00Z&amp;endIndex=2017-11-23T16:00:00Z&amp;count=2
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2132" sourceendlinenumber="2132"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2134" sourceendlinenumber="2234"><code>  [{
      &quot;Start&quot;:{  
         &quot;Time&quot;:&quot;2017-11-24T20:00:00Z&quot;
      },
      &quot;End&quot;:{  
         &quot;Time&quot;:&quot;2017-11-24T22:00:00Z&quot;,
         &quot;Measurement&quot;:20.0
      },
      &quot;Summaries&quot;:{  
         &quot;Count&quot;:{  
            &quot;Measurement&quot;:2
         },
         &quot;Minimum&quot;:{  
            &quot;Measurement&quot;:0.0
         },
         &quot;Maximum&quot;:{  
            &quot;Measurement&quot;:20.0
         },
         &quot;Range&quot;:{  
            &quot;Measurement&quot;:20.0
         },
         &quot;Total&quot;:{  
            &quot;Measurement&quot;:20.0
         },
         &quot;Mean&quot;:{  
            &quot;Measurement&quot;:10.0
         },
         &quot;StandardDeviation&quot;:{  
            &quot;Measurement&quot;:7.0710678118654755
         },
         &quot;PopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:5.0
         },
         &quot;WeightedMean&quot;:{  
            &quot;Measurement&quot;:10.0
         },
         &quot;WeightedStandardDeviation&quot;:{  
            &quot;Measurement&quot;:7.0710678118654755
         },
         &quot;WeightedPopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:5.0
         },
         &quot;Skewness&quot;:{  
            &quot;Measurement&quot;:0.0
         },
         &quot;Kurtosis&quot;:{  
            &quot;Measurement&quot;:-2.0
         }
      }
   },
   {  
      &quot;Start&quot;:{  
         &quot;Time&quot;:&quot;2017-11-24T22:00:00Z&quot;,
         &quot;Measurement&quot;:20.0
      },
      &quot;End&quot;:{  
         &quot;Time&quot;:&quot;2017-11-25T00:00:00Z&quot;,
         &quot;Measurement&quot;:40.0
      },
      &quot;Summaries&quot;:{  
         &quot;Count&quot;:{  
            &quot;Measurement&quot;:2
         },
         &quot;Minimum&quot;:{  
            &quot;Measurement&quot;:20.0
         },
         &quot;Maximum&quot;:{  
            &quot;Measurement&quot;:40.0
         },
         &quot;Range&quot;:{  
            &quot;Measurement&quot;:20.0
         },
         &quot;Total&quot;:{  
            &quot;Measurement&quot;:60.0
         },
         &quot;Mean&quot;:{  
            &quot;Measurement&quot;:30.0
         },
         &quot;StandardDeviation&quot;:{  
            &quot;Measurement&quot;:7.0710678118654755
         },
         &quot;PopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:5.0
         },
         &quot;WeightedMean&quot;:{  
            &quot;Measurement&quot;:30.0
         },
         &quot;WeightedStandardDeviation&quot;:{  
            &quot;Measurement&quot;:7.0710678118654755
         },
         &quot;WeightedPopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:5.0
         },
         &quot;Skewness&quot;:{  
            &quot;Measurement&quot;:0.0
         },
         &quot;Kurtosis&quot;:{  
            &quot;Measurement&quot;:-2.0
         }
      }
  }]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2238" sourceendlinenumber="2238"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2239" sourceendlinenumber="2261"><code class="lang-csharp">   Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetIntervalsAsync&lt;T&gt;(string streamId, string 
         startIndex, string endIndex, int count, string viewId = null);

   Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetIntervalsAsync&lt;T, T1&gt;(string streamId, T1 
         startIndex, T1 endIndex, int count, string viewId = null);

   Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetIntervalsAsync&lt;T, T1, T2&gt;(string streamId, 
         Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, int count, 
         string viewId = null);

   Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetFilteredIntervalsAsync&lt;T&gt;(string streamId, 
         string startIndex, string endIndex, int count, string filter, 
         string viewId = null);

   Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetFilteredIntervalsAsync&lt;T, T1&gt;(string streamId, 
         T1 startIndex, T1 endIndex, int count, string filter, 
         string viewId = null);

   Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetFilteredIntervalsAsync&lt;T, T1, T2&gt;(string 
         streamId, Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, int count, 
         string filter, string viewId = null);
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2262" sourceendlinenumber="2262"><a name="getintervalsuomconversion"></a></p>
<h3 id="request-uom-conversion-6" sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2263" sourceendlinenumber="2263">Request (Uom Conversion)</h3>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2265" sourceendlinenumber="2266"><code>  POST api/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/GetIntervals
     ?startIndex={startIndex}&amp;endIndex={endIndex}&amp;count={count}&amp;filter={filter}&amp;viewId={viewId}
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2268" sourceendlinenumber="2268"><strong>Request Parameters</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2270" sourceendlinenumber="2271"><code>string tenantId</code><br>The tenant identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2273" sourceendlinenumber="2274"><code>string namespaceId</code><br>The namespace identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2276" sourceendlinenumber="2277"><code>string streamId</code><br>The stream identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2279" sourceendlinenumber="2280"><code>string startIndex</code><br>The start index for the intervals</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2282" sourceendlinenumber="2283"><code>string endIndex</code><br>The end index for the intervals</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2285" sourceendlinenumber="2286"><code>int count</code><br>The number of intervals requested</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2288" sourceendlinenumber="2289"><code>string filter</code><br>Optional filter expression</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2291" sourceendlinenumber="2292"><code>string viewId</code><br>Optional view identifier</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2294" sourceendlinenumber="2294"><strong>Request Body</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2296" sourceendlinenumber="2296">The Request Body contains a collection of <code>SdsStreamPropertyOverride</code> objects. The example request body below requests Sds convert the <code>Measurement</code> property of the returned data from meter to centimeter.</p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2297" sourceendlinenumber="2304"><code class="lang-json">    [
      {
        &quot;SdsTypePropertyId&quot; : &quot;Measurement&quot;,
        &quot;Uom&quot; : &quot;centimeter&quot; 
      }
    ]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2306" sourceendlinenumber="2306"><strong>Response</strong></p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2308" sourceendlinenumber="2308">The response includes a status code and response body containing a serialized collection of events similar to the standard request above (without unit conversion). In this response, the system will have applied the conversion factor for the base unit (in this case Meters) to the <code>Measurement</code> property of the event.</p>
<p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2310" sourceendlinenumber="2310"><strong>Response body</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2312" sourceendlinenumber="2412"><code>  [{
      &quot;Start&quot;:{  
         &quot;Time&quot;:&quot;2017-11-24T20:00:00Z&quot;
      },
      &quot;End&quot;:{  
         &quot;Time&quot;:&quot;2017-11-24T22:00:00Z&quot;,
         &quot;Measurement&quot;:2000.0
      },
      &quot;Summaries&quot;:{  
         &quot;Count&quot;:{  
            &quot;Measurement&quot;:2
         },
         &quot;Minimum&quot;:{  
            &quot;Measurement&quot;:0.0
         },
         &quot;Maximum&quot;:{  
            &quot;Measurement&quot;:2000.0
         },
         &quot;Range&quot;:{  
            &quot;Measurement&quot;:2000.0
         },
         &quot;Total&quot;:{  
            &quot;Measurement&quot;:2000.0
         },
         &quot;Mean&quot;:{  
            &quot;Measurement&quot;:1000.0
         },
         &quot;StandardDeviation&quot;:{  
            &quot;Measurement&quot;:707.10678118654755
         },
         &quot;PopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:500.0
         },
         &quot;WeightedMean&quot;:{  
            &quot;Measurement&quot;:1000.0
         },
         &quot;WeightedStandardDeviation&quot;:{  
            &quot;Measurement&quot;:707.10678118654755
         },
         &quot;WeightedPopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:500.0
         },
         &quot;Skewness&quot;:{  
            &quot;Measurement&quot;:000.0
         },
         &quot;Kurtosis&quot;:{  
            &quot;Measurement&quot;:-200.0
         }
      }
   },
   {  
      &quot;Start&quot;:{  
         &quot;Time&quot;:&quot;2017-11-24T22:00:00Z&quot;,
         &quot;Measurement&quot;:2000.0
      },
      &quot;End&quot;:{  
         &quot;Time&quot;:&quot;2017-11-25T00:00:00Z&quot;,
         &quot;Measurement&quot;:4000.0
      },
      &quot;Summaries&quot;:{  
         &quot;Count&quot;:{  
            &quot;Measurement&quot;:2
         },
         &quot;Minimum&quot;:{  
            &quot;Measurement&quot;:2000.0
         },
         &quot;Maximum&quot;:{  
            &quot;Measurement&quot;:4000.0
         },
         &quot;Range&quot;:{  
            &quot;Measurement&quot;:2000.0
         },
         &quot;Total&quot;:{  
            &quot;Measurement&quot;:6000.0
         },
         &quot;Mean&quot;:{  
            &quot;Measurement&quot;:3000.0
         },
         &quot;StandardDeviation&quot;:{  
            &quot;Measurement&quot;:707.10678118654755
         },
         &quot;PopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:500.0
         },
         &quot;WeightedMean&quot;:{  
            &quot;Measurement&quot;:3000.0
         },
         &quot;WeightedStandardDeviation&quot;:{  
            &quot;Measurement&quot;:707.10678118654755
         },
         &quot;WeightedPopulationStandardDeviation&quot;:{  
            &quot;Measurement&quot;:500.0
         },
         &quot;Skewness&quot;:{  
            &quot;Measurement&quot;:0.0
         },
         &quot;Kurtosis&quot;:{  
            &quot;Measurement&quot;:-200.0
         }
      }
  }]
</code></pre><p sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2416" sourceendlinenumber="2416"><strong>.NET Library</strong></p>
<pre sourcefile="Documentation/SequentialDataStore/Reading_Data_API.md" sourcestartlinenumber="2418" sourceendlinenumber="2438"><code>  Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetIntervalsAsync&lt;T&gt;(string streamId, string 
      startIndex, string endIndex, int count, string viewId = null);

  Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetIntervalsAsync&lt;T, T1&gt;(string streamId, T1 
      startIndex, T1 endIndex, int count, string viewId = null);

  Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetIntervalsAsync&lt;T, T1, T2&gt;(string streamId, 
      Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, int count, 
      string viewId = null);

  Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetFilteredIntervalsAsync&lt;T&gt;(string streamId, 
      string startIndex, string endIndex, int count, string filter, 
      string viewId = null);

  Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetFilteredIntervalsAsync&lt;T, T1&gt;(string streamId, 
      T1 startIndex, T1 endIndex, int count, string filter, 
      string viewId = null);

  Task&lt;IEnumerable&lt;SdsInterval&lt;T&gt;&gt;&gt; GetFilteredIntervalsAsync&lt;T, T1, T2&gt;(string 
      streamId, Tuple&lt;T1, T2&gt; startIndex, Tuple&lt;T1, T2&gt; endIndex, int count, 
      string filter, string viewId = null);
</code></pre><hr>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/OCS-Docs/blob/master/Documentation/SequentialDataStore/Reading_Data_API.md/#L1" class="contribution-link">Improve this Doc</a>
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
