---
uid: overview-data-transfers
---

# Overview of data transfers

To transfer PI System data to OCS, you must first create a data transfer by setting filter criteria and choosing PI points for the transfer. After, you will stream the selected PI points from your on-premises PI System to OCS.

The following tasks must be performed before you can complete a data transfer:

1. Install the PI to OCS agent setup kit.
2. Confirm your PI System connection registration.
3. Create a data transfer.
4. Set historical start and end time if desired.
5. Validate data flow.

Note: If you have slow moving PI points that do not update often, you might want your data in OCS before it is archived on PI Data Archive. To accomplish this task, you will need to turn off compression for these PI points to ensure snapshot data is collected.  

OSIsoft recommends turning off compression only for slow moving PI points. In general, this practice is not required for most tags and can cause unnecessary overhead and data collection.

## Historical Transfer vs. backfilling

During the creation of a transfer, you have the option of including historical data. A historical data transfer is based on the historical “start time” and “end time” you specify. When the start time is in the past (earlier than now or ‘*’ in PI terminology), the PI to OCS Agent asks PI Data Archive for past data. This data is referred to as the historical transfer. Once the Agent has retrieved all the data between the start time to the present (which gets defined when the transfer starts), it stops the historical transfer job.

## What is backfilling?

Backfilling comes into play only when a PI to OCS Agent goes down after it has begun work on a transfer. When it goes down due to being stopped or because the PI to OCS Agent Windows service shuts down, it loses its update signup. For example, if the service has been down for two hours, it will have to re-signup for updates when it becomes available; however, it doesn't have a way to get the data for those two hours it was down using updates. In this case, the backfill transfer job will fill the gap for those two hours and then shut down just like the historical transfer shuts down after it has finished.

## Summary of historical transfer vs. backfilling
Historical transfer fills the gap between a “configured past, start time” of the transfer and the time the actual clock time the transfer started. Backfilling fills the data for the time period that a configured transfer stopped up until the time the transfer resumed again.