---
uid: gsStreamviews
---

# Get started with stream views

Stream views enable you to expose stream data as a different type, or with different units of measure and property names. A stream view serves as a mapping between the underlying type in the stream and the type in the stream view. This enables you to in effect remove, rename, or add properties on your stream data. Using a stream view on data retrieval affects only the data retrieved, and does not alter the original source data. For more information about stream views, see [Stream views](xref:ccStreamviews).

## Prerequisite

Repeat the steps in [Get started with types](xref:gsTypes) and create a type with the Id, *MyData.Pump.State.Temperature*. Include only the `Timestamp` and `Temperature` properties. 

## Add a stream view

This procedure creates a stream view that maps the `MyData.Pump.State` type to this new type, `MyData.Pump.State.Temperature`.

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Streams/Types/Stream Views** selector, select **Stream Views**.

1. In the tool bar, select **Add Stream View** to open a pane on the right side.

1. In the `Create Stream View` pane at Step 1: `Details`, complete the following fields:

   - **Id** - Enter *MyData.PumpTemperatureView*.

   - **Name** - (Optional) Give the stream view a different name. Leave this field blank to use the Id as the name.

   - **SourceType** - From the list, select *MyData.Pump.State*.

   - **TargetType** - From the list, select *MyData.Pump.State.Temperature*.

   - **Description** - (Optional) Add a description for this stream view.

1. Select **Next** to proceed to Step 2: `Property Mappings`.

1. Select **Add Property Mapping** twice to create two empty property mappings.

1. To create a property mapping, select **Add Property Mapping** and complete the following fields:

   - **Source Id** - From the list, select *Timestamp*.

   - **Target Id** - From the list, select *Timestamp*.

1. To create a second property mapping, select **Add Property Mapping** and complete the following fields:

   - **Source Id** - From the list, select *Temperature*.

   - **Target Id** - From the list, select *Temperature*.

1. Select **Save**. This adds the stream view to the list and you can now use it to view data from *MyData.PumpState* streams with only the **Timestamp** and **Temperature** fields showing.

1. To test this stream view, select **Developer Tools** > **API Console** in the left pane.

1. In the **URI** field, enter */Namespaces/MyData/Streams/MyData.NorthAmerica.SLTC.PumpA/Data/Transform/Last?streamViewId=MyData.PumpTemperatureView*, then select **GET**. 

   **Note**: If you use a different namespace, you need to substitute that in place of */Namespaces/MyData*.

This returns the `Timestamp` and `Temperature` of the last event from the `MyData.NorthAmerica.SLTC.PumpA` stream, while excluding the `Pressure` and `Status` properties.
