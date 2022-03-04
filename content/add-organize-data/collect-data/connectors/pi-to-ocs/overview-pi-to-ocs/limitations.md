---
uid: pi-to-ocs-limitations
---

# Limitations of PI to OCS

The following table lists the known limitations for PI to OCS.

| Issue | Restrictions | 
| ------------- | ----------------- | 
| Restrictions for PI point transfers | <ul><li>Point must belong to the classic or base point class.</li><li>Point type must be Float32, Float64, Int16, Int32, Digital, Timestamp, or String.</li><li>Must not be a future PI data tag.</li><li>Transfers only PI point type and when the High Replication policy setting is selected for a transfer.</li></ul> |
| Data coercion on PI points with type changes | <ul><li>Points that go through point type changes on Data Archive may have their data coerced before it is sent to the Sequential Data Store (SDS).<br> **Note:** Source data on PI Data Archive is never altered.</li><li> Data coercion occurs only if a PI point change occurs and there is a difference in how values get stored between events. See [PI point change](xref:pi-point-change) for more information.</li>                 | 
| High availability (HA) & collectives | <ul><li>PI to OCS does not support high availability (HA) features or connecting to a PI Data Archive collective.</li><li> AF elements or attributes that reference a collective name instead of one of the nodes are not supported.</li><li> AF Collectives are supported natively by PI to OCS.</li></ul> |
| PI to OCS Agent registration | <ul><li>Multiple PI to OCS Agents can connect to and transfer data from the same PI Server if the agents are installed on different machines and assigned to different namespaces within the same tenant.</li></ul> |
| PI to OCS does not automatically transfer PI point attribute changes. | <ul><li>Any modification of PI point information after a transfer has initiated will not be propagated to OCS.</li><li>The PI to OCS Agent must be restarted to recognize these configuration changes.</li><li>If there is a point type change on PI Data Archive, see [PI point change](xref:pi-point-change) for more information.</li></ul> |
| PI Data Archive | <ul><li>PI to OCS does not write events back to PI Data Archive from OCS.</li></ul> |
| SDS streams indexes | <ul><li>Does not support multiple values at a given index.</li><li>If a PI Data Archive tag has multiple values at a given timestamp, OCS will store the first value returned.</li></ul> |
| Custom UOM data | <ul><li>Custom unit of measurements (UOMs) that are not one of the predefined UOM classes in OCS are not supported. During the transfer of AF element data, AF elements with custom UOMs will not have their corresponding asset’s UOM property set.</li></ul> |
| Service account used for PI to OCS Agent | <ul><li>Once installed, the service account cannot be changed to another account.</li><li>To change a service account, reinstall the PI to OCS Agent.</li></ul> |
| PI Analysis Service | <ul><li>If you use PI to OCS with legacy versions of the PI Analysis Service, be sure to save analysis outputs to PI points or attributes with an analysis data reference.</li></ul>
