---
uid: overview-data-transfers
---

# Overview of data transfers

To transfer PI System data to OCS, you must first create a data transfer by setting filter criteria and choosing PI points for the transfer. After, you will stream the selected PI points from your on-premises PI System to OCS.

The following tasks must be performed before you can complete a data transfer:

1.	Create a PI system connection.
2.	Install the PI to OCS agent setup kit.
3.	Confirm your PI System connection registration.
4.	Create a data transfer.
5.	Validate data flow.

**Note:** If you have slow moving PI points that do not update often, you might want your data in OCS before it is archived on PI Data Archive. To accomplish this task, you will need to turn off compression for these PI points to ensure snapshot data is collected.  

OSIsoft recommends turning off compression only for slow moving PI points. In general, this practice is not required for most tags and can cause unnecessary overhead and data collection.