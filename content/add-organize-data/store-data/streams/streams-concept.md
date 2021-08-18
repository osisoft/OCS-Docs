---
uid: ccStreams
---
# Streams

Sequential Data Store (SDS) stream data are values or events of the same SDS type. SDS stream data are stored in the Sequential Data Store and indexed by one or more properties defined by the stream's SDS type.

The SDS stream is the container that holds the data. When a stream is created, it is scoped to a specific namespace. An SDS type is defined for that stream that determines the values and events in the stream, their data type, and the property or properties used to index the data. Once the stream is created, the SDS type cannot be changed.

The SDS stream container uses metadata and tags to define information about the stream container itself. Metadata are key-value pairs that add context to the data (for example, the metadata key *Manufacturer* and a metadata value *Caterpiller*), and tags are string values that represent stream attributes, for example, region. Organizing data using metadata tags and tags makes it much easier to retrieve data streams.

### <a name="streams-pi-server"></a>PI Server counterpart

An SDS stream is comparable to a PI point in the PI Data Archive. For example, a float32 PI point might be sent to OSIsoft Cloud Services as an SDS stream with a type that contains a timestamp index and float32 value. If you use PI to OCS to import data into SDS, each PI point in the PI Data Archive will be created in SDS as individual stream and the data itself will be added as values in the stream.
