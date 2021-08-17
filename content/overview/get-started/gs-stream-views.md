---
uid: gsStreamviews
---

# Get started with stream views

Stream views enable you to expose stream data as a different type, or with different units of measure and property names. 

A stream view serves as a mapping between the underlying type in the stream and the type in the stream view. This enables you to in effect remove, rename, or add properties on your stream data. 

Using a stream view on data retrieval affects only the data retrieved, and does not alter the original source data.
 
For more information about stream views, see the following topics:

- [Stream views](xref:ccStreamviews)
- [PI Server counterpart](xref:ccStreamviews#streamviews-pi-server)
- [Stream views best practices](xref:ccStreamviews#streamviews-bestpractices)

## Prerequisite

Repeat the steps in [Get started with types](xref:gsTypes) and create a type with the Id **MyOCS.Pump.State.Temperature**. Include only the **Timestamp** and **Temperature** properties. 

## Procedure

This procedure creates a stream view that maps the **MyOCS.PumpState** type to this new type, **MyOCS.Pump.State.Temperature**.

1. Click the ![Menu icon](images/menu-icon.png) icon and choose **Sequential Data Store** (under Data Management).

1. Click the **Namespace** selection button to open the `Select a Namespace` window. In the `Select a Namespace` window, click **MyOCS**. 

1. From the **Streams/Types/Stream Views Selector** list, select **Stream Views**.

1. In the menu bar, click **Add Stream View** to open a pane on the right side.

1. In the `Create Stream View` pane at Step 1: `Details`, enter the following information:

   - `Id` &ndash; **MyOCS.PumpTemperatureView**
   - `Name` &ndash; Optionally, give the stream view a different name. Leave this field blank to use the Id as the name.
   - `SourceType` &ndash; From the list, choose the type **MyOCS.PumpState**.
   - `TargetType` &ndash; From the list, choose the type **MyOCS.PumpState.Temperature**.
   - `Description` &ndash; Optionally, add a description for this stream view.
   
1. Click **Next** to proceed to Step 2: `Property Mappings`.

1. Click **Add Property Mapping** twice to create two empty property mappings.

1. In the first property mapping row, enter the following information:

   - `Source Id` &ndash; From the list, choose the property **Timestamp**.
   - `Target Id` &ndash; From the list, choose the property **Timestamp**.

1. In the second property mapping row, enter the following information:

   - `Source Id` &ndash; From the list, choose the property **Temperature**.
   - `Target Id` &ndash; From the list, choose the property **Temperature**.

1. Click **Save**. This adds the stream view to the list and you can now use it to view data from **MyOCS.PumpState** streams with only the **Timestamp** and **Temperature** fields showing.

1. To test this stream view, click the menu icon and choose **API Console** (under Developer Tools).

1. In the `URI` field enter `/Namespaces/MyOCS/Streams/MyOCS.NorthAmerica.SLTC.PumpA/Data/Transform/Last?streamViewId=MyOCS.PumpTemperatureView`, then click **GET**. 

   **Note**: If you use a different namespace, you might need to substitute that in place of `/Namespaces/MyOCS`.

This returns the **Timestamp** and **Temperature** of the last event from the **MyOCS.NorthAmerica.SLTC.PumpA** stream, while excluding the **Pressure** and **Status** properties.
