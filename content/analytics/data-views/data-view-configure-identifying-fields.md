---
uid: data-views-configure-identifying-fields
---

# Edit identifying fields

An identifying field can be used to uniquely identify data items within a group. For example, if a query contains an ambiguously named stream property such as `Value`, you might choose a metadata property that uniquely describes the stream as the identifying field.

If the field set resolves to multiple data items in any group (or if grouping is not used), then you should designate an **Identifying field** for the field set. The identifying field of a data field set specifies the primary field to identify multiple items in a group. This identification method allows the identifying field value to be used automatically in field labels of the group. If a lone criterion is not a sufficient or useful way of disambiguating the fields, then grouping by additional criteria may be necessary.

Fields are only eligible if they include one of the following source types listed in the table below. All source types require a field label. Some source types also require having a key defined. The following table lists eligible data sources along with additional requirements for field labels and keys.

| Eligible source type | Field label required? | Key required? |
|--|--|--|
| Id | ![check](../../_icons/default/check.svg) | ![close](../../_icons/default/close.svg) |
| Name | ![check](../../_icons/default/check.svg) | ![close](../../_icons/default/close.svg) |
| Metadata | ![check](../../_icons/default/check.svg) | ![check](../../_icons/default/check.svg) |
| Tags | ![check](../../_icons/default/check.svg) | ![check](../../_icons/default/check.svg) |

## Identifying field example

Identifying fields are most useful for stream queries in a data view where the stream property does not provide a useful name. For example, many streams created have a property called "value". You can use this property as an identifying field to provide canonical meaning to the field. In the example below, the data view includes streams for measurements on the inlet pumps for three production lines. Additional metadata is added to each stream using stream metadata rules to describe the measurement captured in each stream. The metadata is then used as an identifying field in the data view.

**Without identifying field**

![Without identifying field](../data-views/_images/identifying-field-no-field.png)

**With identifying field**

![Without identifying field](../data-views/_images/identifying-field-with-field.png)

For asset queries, this canonical meaning is provided by the asset property name so an identifying field is usually not necessary.
## To add an identifying field

To add an identifying field to the field set for a query, select an eligible field from the **Identifying field** dropdown.

1. From the **Identifying Fields** accordion, select **Add an Identifying Field**.

	![add-an-identifying-field](_images/add-an-identifying-field.png)

1. Choose an identifying field.
