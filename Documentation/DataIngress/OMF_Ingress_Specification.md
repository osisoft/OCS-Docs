---
uid: omfIngressSpecification
---

Using OMF with Cloud Services
=============================

The OMF specification (located [here](http://omf-docs.osisoft.com)) is generic in that it does
not specify a particular back-end system. This topic is a companion to the OMF specification which describes how
OMF is interpreted by OSIsoft Cloud Services back-end system. 

Headers
-------

A description of each of the headers can be found in the [OMF spec](http://omf-docs.osisoft.com). Note that rather than using a ``producertoken``, data ingress calls to OCS require a bearer token to be attached in the header, as documented in the [OCS Quick Start](xref:sdsQuickStart) documentation. The bearer token is used to authenticate 
the sender and to authorize the sender for use with a particular Tenant. The client Id associated with this token is used to route messages to a particular [Topic](xref:omfIngressTopics) that it is mapped to.

The ``omfversion`` header must match the version of the OMF spec used to construct the message.
Versions 1.0 and 1.1 of the spec are currently supported. 

Message Types
-------------

OMF message types fall into three categories: Type, Container, and Data, which are described below. 

* **Type messages**

  A Type message is interpreted by OSIsoft Cloud Services as an SdsType in the Sequential Data Store. 
  Because SdsTypes are immutable, update operations are not supported. The keywords in the 
  Type definition are interpreted as follows:

  + ``id``: Corresponds to the SdsType Id field. It must conform to the rules defined for a 
    typeId specified here: [Types](xref:sdsTypes)

  + ``classification``: Only the ``dynamic`` classification is currently supported.
  + ``version``: Versioning of SdsTypes is not supported.
  + ``name``: Corresponds to the SdsType Name field. This is the friendly name for the type.
  + ``description``: Corresponds to the SdsType Description field. 
  + ``tags``: Currently unsupported.
  + ``metadata``: Currently unsupported.

  The ``isindex`` keyword corresponds to the ``iskey`` attribute of an SdsTypeProperty. 
  SdsTypes support clustered indexes which can be specified with multiple properties marked 
  with the ``isindex`` keyword with a value of ``true``. For compound indexes, the 
  index property order within the message corresponds to the ``Order`` field of 
  an SdsTypeProperty. The ``isname`` keyword is not supported.

* **Link Type**

  Link Types are not supported in Sequential Data Store.

* **Span Type**

  Span Types are not supported in Sequential Data Store.

* **Property Types and Formats**

  OMF supports setting the ``format`` keyword to specify how a particular JSON type should 
  be interpreted. The following is a mapping for the Sequential Data Store supported 
  types (see [Types](xref:sdsTypes)):


Type     | Format   | SdsTypeCode
-------- | -------- | -----------
array		 |          | IEnumerable
boolean  |          | boolean
integer	 | int64    | Int64
integer  | int32    | Int32
integer  | int16    | Int16
integer  | uint64   | Uint64
integer  | uint32   | Uint32
number   | uint16   | Uint16
number   | float64  | Double
number   | float32  | Single
number   | float16  | Single
object   | dictionary | Idictionary
string   |          | String
string   | date-time | DateTime


Container messages
------------------

A Container message is interpreted as an SdsStream in the Sequential Data Store. The keywords 
in the Container definition are interpreted as follows:

* ``id``: Corresponds to the SdsStream Id field. It must conform to the rules defined for
    an SdsStream Id specified here: [Streams](xref:sdsStreams#streams).
* ``typeid``: Corresponds to the SdsStream TypeId field.
* ``typeversion``: Versioning of SdsTypes is not supported.
* ``name``: Corresponds to the SdsStream Name field. This is a friendly name for the stream.
* ``description``: Corresponds to the SdsStream Description field.
* ``tags``: Corresponds to the SdsStream Tag field. 
* ``metadata``: Corresponds to the SdsStream Metadata field.        


Data messages
-------------

A Data message is mapped to generic Sds values in the Sequential Data Store. The keywords in the 
Data definitions are interpreted as follows:

* ``typeid``: Data that is not grouped by containerId is not supported.
* ``containerid``: Stream Id for the associated Sds Stream.
* ``typeversion``: Not supported.
* ``values``: An array of the generic Sds values.
