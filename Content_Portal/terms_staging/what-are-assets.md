# What are assets?

Assets are a container for data that describes a physical entity like a physical piece of equipment, process or concept. Assets provide contextualization and organization of streams and metadata.

Assets are optionally typed. Typed assets reference an asset type and comply with metadata and stream reference definitions. Typed assets can define metadata and stream references not contained in the asset type; however, they cannot skip defining metadata and stream references defined by the asset type. Untyped assets are not required to adhere to constraints of an asset type.

Each asset contains the following data:

- Metadata: A collection of named static properties that describe an asset. The name functions as the key. Metadata provides contextual information to classify and identify assets. Each metadata value has a specified Sequential Data Store (SDS) primitive type and an optional unit of measurement (UOM). If the metadata item is specified by the asset type, only its value can be modified in the asset. Examples of metadata include location information such as site, plant and geo-coordinates; physical properties, such as tank height and capacity; and, identifying information, such as serial numbers and manufacturer.

- Stream References: A collection of named references to streams. The name functions as the key to identify the relationship (e.g., 'Inlet Flow' and 'Outlet Flow'), and can contextualize the connection between an asset and a stream.

- Asset Metadata Value: A single metadata entity, which includes a name, SdsTypeCode, UOM, and value.