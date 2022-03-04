---
uid: pi-point-change
---

# What is a PI point type change?

A PI point type change occurs when a PI point's type is changed on the source PI Data Archive after the corresponding stream has been created in the OCS Sequential Data Store (SDS) database. When the PI to OCS Agent detects this change, it takes the following actions:

- Displays the `PI Point Type Change Detected` message next to the **Current Activity** field in the Details pane as shown in the screenshot below 
- Prevents data being sent from the source PI point to the SDS stream until the type is changed to match the corresponding SDS Stream type and the transfer is restarted 
- Logs details about the corresponding SDS stream in both the Windows Event Viewer and OCS logs 

![](../../images/pi-point-type-change.png)

A point change can occur for the following reasons:

* The source PI point had an incorrect configuration of data and type. The data and point must be deleted and recreated.
* The source PI point was misconfigured initially. For example, the point needed to be updated from `Float32` to `Float64`. The data is still relevant and should be kept.
* Other reasons
<!--Angela Flores 6/28/21 This list is oddly specific. Also, what is PI to OCS Services? And PI to OCS service? This topic still needs work. --> 
<!--VT, 11/29/21: PI to OCS Services/service is the PI to OCS Agent. I had a discussion w/one of the Bonsai developers, Zane Odeh, and he confirmed this info. The reference has been removed from this topic.-->

After you create an SDS stream, its underlying SdsType cannot change. As a result, new data from the PI point in question cannot be stored in the same stream. You can resume streaming data from the PI point to the existing SDS stream by taking the following corrective actions:

- View the [Windows Event Viewer logs](xref:view-logs) or [OCS logs](xref:download-tenant-log) to determine which PI point incurred a PI point type change.

    **Note:** The Windows Event Viewer logs is the preferred source of information for PI point type changes.

- Change the PI point type to match the SDS stream type and then restart the transfer.

To see what types of point coercions are supported in PI Data Archive, refer to the ["Allowable point type coercions"](https://docs.osisoft.com/bundle/pi-server/page/allowable-point-type-coercions.html) topic.<!--Angela Flores 6/28/21 should that be "coercions" or "conversions"? --> <!--VTT, 11/29/21: Coercion is the preferred term per the referenced topic.-->

### Example of how PI point coercion is handled in SDS

A PI point that has historical data on Data Archive and is also assigned to the Float64 type will have its historical Float64 data converted to fit the PI point's Float32 type in SDS. This conversion results in lost decimals/precision prior to getting sent to SDS. The coercion would not affect points with identical values for both types if the full range of values is not required; the same value will transfer over to SDS from Data Archive.

See [Point type changes and archives](https://docs.osisoft.com/bundle/pi-server/page/point-type-changes-and-archives.html) for more information.