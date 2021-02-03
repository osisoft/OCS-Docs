---
uid: AddIdentifyingField
---

# Add identifying field
If a field set resolves to multiple data items in any group, you may wish to identify those data items so that they are not ambiguous and so they will be aligned across groups. The identifying field of a data field set specifies the primary field to identify multiple items in a group. This allows the identifying field value to be used automatically in field labels of the group. One field should be designated as the `.IdentifyingField` of the field set to tell the data items apart. If a single criterion is not an effective way of disambiguating fields, then it may be necessary to [group](xref:DataViewsGrouping) by additional criteria. Any field from field sources `FieldSource.Id`, `FieldSource.Name`, `FieldSource.Metadata`, `FieldSource.Tags` can be used as an identifying field.  

See [Add identifying field](xref:DataViewsFieldSets#identifying-field) in the Define data field sets topic for details.
