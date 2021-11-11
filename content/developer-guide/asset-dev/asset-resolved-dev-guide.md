---
uid: asset-resolved-dev-guide
---

# Resolved Asset Metadata

The resolved asset metadata is the union of the metadata from the asset and asset type. 

When an asset references an asset type, `Metadata` with the matching identifier will only be evaluated. For these items, metadata name, SdsTypeCode, and UOM will be set to the value on the asset type. The metadata's value, if present, will be taken from the asset metadata. If the asset's metadata SdsTypeCode is different than that on the asset type metadata, the asset's metadata value will be coerced to the SdsTypeCode of the asset type.

The unresolved metadata field will always be an empty list and is reserved for future use.

# Resolved Asset Stream

The list of resolved streams comes from stream reference definitions on the asset that reference existing streams in the SDS (Sequential Data Store). The resolved streams can have a corresponding type reference, but the type reference is not required. The unresolved streams are identified by the stream id rather than the stream name.

An unresolved stream might correspond to a stream reference on the asset that references a stream in SDS that does not exist. An unresolved stream might also correspond to a type reference on an asset type that does not have a corresponding stream reference on the asset. See the reason field in the unresolved stream for the specific reason for the unresolved stream. The unresolved streams are identified by the stream id rather than the stream name.

# Resolved Asset Status

If a status is defined on the asset or asset type, this corresponds to the definition type of the status. Currently, the only supported definition type is "StreamPropertyMapping". If a status is not defined, this field will be null.

For a valid "StreamPropertyMapping" on the asset or asset type, the resolved status contains the stream Id and stream property Id used in the definition. If a status is not defined or if the status cannot be resolved, this field will be null.
