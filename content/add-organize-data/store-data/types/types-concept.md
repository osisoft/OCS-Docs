---
uid: ccTypes
---

# Types

A Sequential Data Store (SDS) type defines the shape and structure of events and how to associate events within a stream of data. A type is comprised of at least two properties. One property serves as the primary index, most commonly a `timestamp` or `DateTime`. In addition, it has one or more additional properties called value properties which describes the data in each stream event. Each value property can have a different property type. A wide variety of property types are supported. For a list of the supported property types, see [Supported Types](xref:sdsTypes#sdstypecode). 

**Note:** You can also create complex secondary indexes. 

Types are immutable; once created, they cannot be updated. Therefore, it is important to determine the correct type definition before you begin building streams and data in the Sequential Data Store.

For more information, see [Types](xref:sdsTypes).

### <a name="types-pi-server"></a>PI Server counterpart

An SDS type is comparable to PI point type in PI Data Archive. For example, a PI point of type `float32` is comparable to an SDS type with a `DateTime` index property and a `float32` value property. Because they are similar, if you use PI to OCS to import data into SDS, some "PI-\*" types are created automatically in SDS that map to existing PI point types. PI Data Archive has a predefined list of supported PI point types. The data structure of the Sequential Data Store is more flexible because SDS types can include multiple data measurements of different data types, and data can be indexed using a non-time-series index or multiple indexes.
