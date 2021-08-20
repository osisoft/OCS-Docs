---
uid: pi-to-ocs-limitations
---

# Limitations of PI to OCS

The following table lists the known limitations for PI to OCS.

| Issue | Restrictions | 
| ------------- | ----------------- | 
| Restrictions for PI point transfers | <ul><li>Point must belong to the classic or base point class.</li><li>Point type must be Float32, Float64, Int16, Int32, Digital, Timestamp, or String.</li><li>Must not be a future PI data tag.</li><li>Transfer only transfers PI point attributes: descriptor, extended descriptor, point source, engineering units, name, instrument tag, and PI point ID.</li></ul> |
| Data transfers | <ul><li>PI to OCS does not currently transfer any data from PI Asset Framework.</li></ul> |
| High availability (HA) & collectives | <ul><li>PI to OCS does not support high availability (HA) features or connecting to a PI Data Archive collective unless the collective name is the same as one of the collective members.</li><li> AF elements or attributes that reference a collective name instead of one of the nodes are not supported.</li></ul> |
| PI to OCS Agent registration | <ul><li>Once a PI to OCS Agent is registered to an OCS PI data source, no other PI to OCS Agent can connect to that same OCS PI data source.</li></ul> |
| PI to OCS does not automatically transfer PI Point attribute changes. | <ul><li>Any modification of PI point information after a transfer has initiated will not be propagated to OCS.</li><li>The PI to OCS Agent must be restarted to recognize these configuration changes.</li><li>If there is a point type change on PI Data Archive, see [PI point change](xref:pi-point-change) for more information.</li></ul> |
| PI Data Archive | <ul><li>PI to OCS does not write events back to PI Data Archive from OCS.</li><li>PI to OCS does not handle scenarios where PI Data Archives have been taken offline.</li></ul> |
| SDS streams indexes | <ul><li>Does not support multiple values at a given index.</li><li>If a PI Data Archive tag has multiple values at a given timestamp, OCS will only store one of those values.</li></ul> |
| Service account used for PI to OCS Agent | <ul><li>Once installed, the service account cannot be changed to another account.</li><li>To change a service account, perform the following tasks:<ol><li>Uninstall the PI to OCS Agent.</li><li>Delete the old connection.</li><li>Create a new connection.</li><li>Reinstall the PI to OCS Agent.</li></ol></li></ul> |