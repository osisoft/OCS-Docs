---
detect-replicate-attribute-changes
---

# Updates to PI point attributes during a transfer

When PI point attributes are updated on-prem during data collection and transfer, PI point definition changes are replicated to the corresponding OCS stream according to the following guidelines:

1.	Update checks occur every 10 minutes. All PI points configured in the transfer are checked, not just PI points that have been updated.
2.	The following point attributes are checked: Pointid, tag, descriptor, pointsource, sourcetag, step, and engunits.
3.	Zero and span PI point attributes are not supported in OCS.
4.	Digital PI points are sent to OCS with the enumeration and string value.
5.	A transfer should be stopped prior to making any changes to a digital table and then restarted.

**Note:** OCS does not make references to digital tables. Before transferring data, the PI to OCS Agent retrieves all digital tables from PI Server and determines string values from them. This collection of digital tables is not refreshed during the life of the transfer. Any changes to digital tables that involve updating text or adding a new state will not be reflected in the values sent to OCS, and, could possibly result in agent errors.
 