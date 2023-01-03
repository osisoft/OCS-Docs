## Ineligible data items

The collection of ineligible data items represents resources that match the queries but cannot be included in the data view. A data item is ineligible if it does not contain at least one eligible non-key [data item field](xref:ResolvedDataView#dataitemfield).

A data item field is ineligible if its index is not appropriate for the data view, or if the field has a data type that may not be included in data views.

The following are examples of ineligible index:

* The index is compound (multiple properties)
* The index property data type differs from the data view data type

The following are examples of ineligible field types:

* Objects (nested type)
* Array (collection type)
* TimeSpan (time spans and nullable time spans are currently unsupported)