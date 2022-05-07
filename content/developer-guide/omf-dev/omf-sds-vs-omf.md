---
uid: omfVsSds
---

# Data collection: OMF vs. SDS data writes

When collecting data programatically, you have the option of using either the Open Message Format ([OMF](https://docs.osisoft.com/bundle/omf/page/index.html)) or Sequential Data Store ([SDS](xref:sdsWritingData)) data writes. OMF is typically the best option for simple and efficient data collection. However, each option has its pros and cons, and this topic highlights the key differences. 

## Data collection option comparison

The following table lists the factors that you should consider when choosing between OMF and SDS, as well as which option is the better for each factor. Some factors (**Security** and **Performance**) have no inherently superior option and require additional consideration. For more information on these factors, see [Situation dependent factors](#situation-dependent-factors).

| Factor | OMF | SDS |
|--|--|--|
| [Cross-platform](#cross-platform) | ✔ |  |
| [Ease-of-use](#ease-of-use) | ✔ |  |
| [Flexibility](#flexibility) |  | ✔ |
| [Security](#security) | - | - |
| [Performance](#performance) | - | - |

## OMF pros

Use OMF when the following factors are important to your use case.

- <a id="cross-platform"></a>**Cross-platform**

	While SDS data writes can only be used for OSIsoft Cloud Services (OCS) and Edge Data Store (EDS), OMF can also write to a PI Server through the PI Web API. This additional capability makes OMF cross-platform, which is one of the main reasons that it is used in PI Adapters. In addition, other platforms may adopt the OMF standard to ingress data, widening the interoperability of your applications.  

- <a id="ease-of-use"></a>**Ease of use**

	OMF is simpler than SDS, having only a single API and format, which can publish Types, Containers, Assets, and Data using the actions of Create, Update, and Delete. This simplicity contrasts with SDS, which has separate APIs for publishing different data types and different actions. For more information on this contrast, see [Flexibility](#flexibility).

## SDS data write pros

Use SDS data write when the following factor is more important to your use case.

- <a id="flexibility"></a>**Flexibility**

	SDS data writes afford greater flexibility than OMF, which may make it the clear choice for certain use cases. If a requirement of your application is both reading and writing from OCS, then SDS data writes are preferable to avoid the need for interacting with two separate APIs. Using the SDS API allows for reuse of objects such as types and streams in your application.  

	In some situations, the functionality that you need may not be currently supported in the OMF specification, such as certain property overrides and nested types. Platform specific features like dataviews or assets are also not accessible through OMF. Direct calls to the OCS REST API would be preferred for these situations.  

	Additionally, not all OMF endpoints respond with the same error codes due to asynchronous message processing, which could result in a successful HTTP status code being returned when a SDS data write would result in a client error status code. This could happen if a message adheres to the OMF specification, but is not writing to a valid container.  

## Situation-dependent factors

For some factors, neither SDS nor OMF are inherently superior. 

- <a id="security"></a>**Security**

	Both SDS and OMF use the same authentication mechanism when connecting to OCS, so neither is inherently more secure. Always follow best practices for security as outlined in [Identity and access management](xref:id-access-mgmt). SDS APIs give callers the flexibility to specify an Access Control List (ACL), whereas types and streams created through OMF messages use the default ACL of the collection.

- <a id="performance"></a>**Performance**

	Because there is overhead associated with parsing the OMF JSON payloads, direct SDS calls may be more performant for single stream writes. However, with OMF you can send data for multiple containers in a single payload (equivalent to an OCS stream or PI Point). This practice reduces the number of requests needed and makes batching data easier. In addition, the OMF ingress service can buffer and combine writes into SDS for more efficient processing. PI Adapters contain a mechanism for buffering OMF messages on the client to handle network disruptions. With SDS data writes, parallel tasks are needed to realize the full potential of OCS.  

	Another consideration for performance is compression of message payloads, which both options support through gzip when specified headers are provided.
