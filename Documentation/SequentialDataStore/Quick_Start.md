---
uid: sdsQuickStart
---

# Quick Start

Sequential Data Store (SDS) is a sophisticated data store. The information in this section describes a very simple interaction with SDS.
To follow along with the steps in this section, you will first need an account, tenant and associated security credentials. 
If you have not already acquired an account, email [OCS support](mailto://cloudservices@osisoft.com) at OSIsoft Cloud Services.

Throughout this guide, you will be instructed to interact with the [OSIsoft Cloud Services portal](https://cloud.osisoft.com/). To access the section 
identified, you must sign into the portal using the credentials associated with the tenant.

You will also need a namespace and administrative client keys. 


#### Step 1: Acquire a Namespace

In the portal, open the navigation menu ![navigation menu](../images/icon_navigation_bigger.png) and select **Data Management** > **Namespaces**. For the 
steps in this section, you can use either an existing namespace or create a new one.


#### Step 2: Acquire a Client Identity and Secret

The application acts as a confidential client – an application that is capable 
of securely maintaining a secret. In Azure Active Directory, the confidential client authentication 
flow is accomplished using an *Application Identity*. OSIsoft Cloud Services supports this authentication 
with a Client Identity (Client Id) and a Client Secret.

To acquire a client identity from the portal, open the navigation menu and select **Security** > **Clients**.

You can either select an existing client or create a new client. For a new client, select **Add Client** and follow the 
prompts for creating a client identity and client secret. Be sure to keep a record of the client secret.
For an exisiting client, highlight the desired client and select **Client Details** to see configuration information. 

You will need the Tenant Identity, Client Identity, and Client Secret to proceed. 

The Tenant Identity, Client Identity, and Client Secret are used to acquire a security token from an identity 
provider, Azure Active Directory in this case.

#### Step 3: Acquire authentication token

You use the Tenant Identity, Client Identity, and Client Secret to acquire an access token 
from Azure Active Directory. Select one of the clients from the list to see configuration information 
and code samples in various languages displayed on tabs in the right panel.

#### Step 4: Create data types

An SdsType (or type) describes the structure of a single measured event or object. An SdsStream (or stream) has an associated 
SdsType and stores a stream of events or objects that take the shape of that type.

A type consists of one or more data properties, one of which must represent an index. Indexes can be 
simple (a single integer property, for example) or compound (represented by multiple properties). 
DateTime is a common index for time-series stores. 

SDS supports a wide variety of property types, both simple (integers, strings and floats, for example) 
and complex (lists, arrays and enumerations, for example). Properties can be of any complex SdsType. 
See [Types](xref:sdsTypes#sdstypecode) for a detailed list of supported data types.

To help users develop .NET SDS client applications, OSIsoft provides OCS client libraries through NuGet packages, 
[OCSClients](https://www.nuget.org/packages/OSIsoft.OCSClients/). OCSClients contains the libraries necessary 
to connect to OCS and manage data.

Use the .NET client libraries method SdsTypeBuilder to create a type.

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
    public Double Measurement { get; set; }
}

SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
simpleType.Id = "Simple";
simpleType.Name = "Simple";
simpleType.Description = "Basic sample type";
await config.CreateTypeAsync(simpleType);
```

Note that client libraries are not available outside of .NET. The SdsType is defined using JSON and is posted on OSIsoft Cloud Services endpoint.

```json
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}  
HTTP/1.1
Authorization: Bearer <bearer-token>
Content-Length: 1562
Content-Type: application/json
Host: dat-b.osisoft.com
{
    "Id": "Simple",
    "Name": "Simple",
    "Description": null,
    "SdsTypeCode": 1,
    "IsGenericType": false,
    "IsReferenceType": false,
    "GenericArguments": null,
    "Properties": [
        {
            "Id": "Time",
            "Name": "Time",
            "Description": null,
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": {
                "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                "Name": "DateTime",
                "Description": null,
                "SdsTypeCode": 16,
                "IsGenericType": false,
                "IsReferenceType": false,
                "GenericArguments": null,
                "Properties": null,
                "BaseType": null,
                "DerivedTypes": null,
                "InterpolationMode": 0,
                "ExtrapolationMode": 0
            },
            "Value": null,
            "Uom": null,
            "InterpolationMode": null
        },
        {
            "Id": "State",
            "Name": "State",
            "Description": null,
            "Order": 0,
            "IsKey": false,
            "FixedSize": 0,
            "SdsType": {
                "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                "Name": "State",
                "Description": null,
                "SdsTypeCode": 609,
                "IsGenericType": false,
                "IsReferenceType": false,
                "GenericArguments": null,
                "Properties": [
                    {
                        "Id": "Ok",
                        "Name": null,
                        "Description": null,
                        "Order": 0,
                        "IsKey": false,
                        "FixedSize": 0,
                        "SdsType": null,
                        "Value": 0,
                        "Uom": null,
                        "InterpolationMode": null
                    },
                    {
                        "Id": "Warning",
                        "Name": null,
                        "Description": null,
                        "Order": 0,
                        "IsKey": false,
                        "FixedSize": 0,
                        "SdsType": null,
                        "Value": 1,
                        "Uom": null,
                        "InterpolationMode": null
                    },
                    {
                        "Id": "Alarm",
                        "Name": null,
                        "Description": null,
                        "Order": 0,
                        "IsKey": false,
                        "FixedSize": 0,
                        "SdsType": null,
                        "Value": 2,
                        "Uom": null,
                        "InterpolationMode": null
                    }
                ],
                "BaseType": null,
                "DerivedTypes": null,
                "InterpolationMode": 0,
                "ExtrapolationMode": 0
            },
            "Value": null,
            "Uom": null,
            "InterpolationMode": null
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "Description": null,
            "Order": 0,
            "IsKey": false,
            "FixedSize": 0,
            "SdsType": {
                "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                "Name": "Double",
                "Description": null,
                "SdsTypeCode": 14,
                "IsGenericType": false,
                "IsReferenceType": false,
                "GenericArguments": null,
                "Properties": null,
                "BaseType": null,
                "DerivedTypes": null,
                "InterpolationMode": 0,
                "ExtrapolationMode": 0
            },
            "Value": null,
            "Uom": null,
            "InterpolationMode": null
        }
    ],
    "BaseType": null,
    "DerivedTypes": null,
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
}
```

#### Step 5: Create a stream

An SdsStream (or stream) has an associated SdsType and stores a stream of events or objects that take the shape of that type. 
For more information, see [Streams](xref:sdsStreams).

To create a stream for simple events using the .NET client libraries, do the following:

```csharp
SdsStream simpleStream = new SdsStream() 
{
    Id = "Simple",
    Name = "Simple",
    TypeId = simpleType.Id
};

simpleStream = config.CreateStreamAsync(simpleStream);
```

To create the stream without the libraries, post a JSON representation of the SdsStream to OSIsoft Cloud Services.

```json 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}  
HTTP/1.1
Authorization: Bearer <bearer-token>
Content-Length: 139
Content-Type: application/json
Host: dat-b.osisoft.com
{  
    "Id": "Simple",
    "Name": "Simple",
    "Description": null,
    "TypeId": "Simple",
    "Indexes": null,
    "InterpolationMode": null,
    "ExtrapolationMode": null,
    "PropertyOverrides": null 
}
```

#### Step 6: Write data

SDS supports many methods for adding and updating data. In this section, you will insert data. 
Inserts fail if events with the same index already exist in the database. Update  
adds new events and replaces existing events.

To insert an event using the .NET SDS libraries:

```csharp
Simple value = new Simple()
{
    Time = DateTime.UtcNow,
    State = State.Ok,
    Measurement = 123.45
};

await client.InsertValueAsync(simpleStream.Id, value);
```

To POST a JSON serialized event to the OSIsoft Cloud Services:

```json
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
HTTP/1.1
Authorization: Bearer <bearer-token>
Content-Length: 57
Content-Type: application/json
Host: dat-b.osisoft.com
[
    {  
       "Time":"2017-08-17T17:21:36.3494129Z",
       "State":0,
       "Measurement":123.45
    }
]
```

For more information, see [Write data](xref:sdsWritingData).

#### Step 7: Read data

SDS includes many different read methods for retrieving data from streams. In this section, 
you will read the value that was recently written.

Reads typically require an index or indexes. The index in the example is the `Time` property of `Simple`. 
Retrieving the distinct value just written requires `index` `timestamp`` of that value.

Most read calls also require one or more indexes to determine which data to read. 
The simplest way to supply an index is as a string. In .NET, a `DateTime` index could be supplied as follows:

```csharp
string index = DateTime.Parse("2017-08-17T17:21:36.3494129Z")
               .ToUniversalTime().ToString("o"); 
```

To read a value at a distinct index, use the .NET SDS libraries:

```csharp
value = await client.GetDistinctValueAsync<Simple>(simpleStream.Id, index); 
```

To read using REST:
```json
GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data?index=2017-08-17T17:21:36.3494129Z 
HTTP/1.1 200
Content-Type: application/json
[
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    }
]
```
For more information, see [Read data](xref:sdsReadingData).


## Handling transient service interruptions

All applications that communicate with remote systems must manage transient faults. 
Temporary service interruptions are a fact of life in real-world cloud applications. 

If you access SDS using the SDS .NET libraries, transient fault handling is built in; 
the SDS client automatically retries error codes identified as transient.

If you access the SDS API directly from the OSIsoft Cloud Services endpoint, you should 
consider creating your own retry logic to automatically retry when encountering errors 
identified as transient.

For SDS, the only error you should retry is HTTP response code 503: service unavailable. 
An immediate first retry is recommended, followed by an exponential backoff.


## SDS client error

If you access SDS using the .NET libraries, be aware that any non-success responses returned 
to the client are packaged in an SdsHttpClientException, which is an Exception with the following 
additional properties:

```csharp
string ReasonPhrase
HttpStatusCode StatusCode
Dictionary<string, object> Errors 
```

* The StatusCode provides the HttpStatusCode from the response.
* The ReasonPhrase might provide additional information regarding the cause of the exception. 
  You should always evaluate the ReasonPhrase in addition to the StatusCode to determine the cause of the exception.
* The Errors collection may provide additional specific error information based on the response. For example, 
  if an InsertValues call failed because it conflicted with an existing event in the stream, the index of the 
  conflicting event will be included in this dictionary.

## SDS Timeout Request Header

Handling timeout issues can be difficult and confusing in a distributed programming environment. Often, when a client 
times out, the request is terminated before a response is received from the server, resulting in the application being
unaware of the state of the server.

One solution is to use the Request-Timeout header, which is recognized by many OSIsoft Cloud Services. Using the 
header, you can tell the server how long to spend on a particular request before timing out. If possible, the server 
terminates the request if the time it takes to process the request exceeds the timeout value set in the header.

To specify the request timeout value, include the Request-Timeout header and specify the value in seconds.
