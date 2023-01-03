A data field label is a friendly name that you can specify directly or using rules. Null, empty, or whitespace is not allowed for a data field label.

When the data view is resolved and data fields produce field mappings, labels are trimmed of whitespace and used as the field mappings' identifier. For example:

```md
| Timestamp | Power In Value | Power Out Value |
```

In cases where the identifiers are not unique, the identifier is suffixed with an ordinal number, its position. For example:

```md
| Timestamp.0 | Value.1 | Value.2 |
```