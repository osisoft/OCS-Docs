---
uid: pi-to-ocs-limitations
---

# Limitations of PI to Data Hub

The following table lists the known limitations for PI to Data Hub.

| Issue | Restrictions | 
| ------------- | ----------------- | 
| Restrictions for PI point transfers | <ul><li>Point must belong to the classic or base point class.</li><li>Point type must be Float32, Float64, Int16, Int32, Digital, Timestamp, or String.</li><li>Must not be a future PI data tag.</li><li>Transfers only PI point type and when the High Replication policy setting is selected for a transfer.</li></ul> |
| High availability (HA) & collectives | <ul><li>PI to Data Hub does not support high availability (HA) features or connecting to a PI Data Archive collective.</li><li> AF elements or attributes that reference a collective name instead of one of the nodes are not supported.</li><li> AF Collectives are supported natively by PI to Data Hub.</li></ul> |
| PI to Data Hub Agent registration | <ul><li>Multiple PI to Data Hub Agents can connect to and transfer data from the same PI Server if the agents are installed on different machines and assigned to different namespaces.</li></ul> |
| PI Data Archive | <ul><li>PI to Data Hub does not write events back to PI Data Archive from AVEVA Data Hub.</li></ul> |
| SDS streams indexes | <ul><li>Does not support multiple values at a given index.</li><li>If a PI Data Archive tag has multiple values at a given timestamp, AVEVA Data Hub will store the first value returned.</li></ul> |
| Custom UOM data | <ul><li>Custom unit of measurements (UOMs) that are not one of the predefined UOM classes in AVEVA Data Hub are not supported. During the transfer of AF element data, AF elements with custom UOMs will not have their corresponding asset’s UOM property set.</li></ul> |
| Service account used for PI to Data Hub Agent | <ul><li>Once installed, the service account cannot be changed to another account.</li><li>To change a service account, reinstall the PI to Data Hub Agent.</li></ul> |
| PI Analysis Service | <ul><li>If you use PI to Data Hub with the PI Analysis Service, be sure to save analysis outputs to PI points.</li></ul> |
| Deleted values do not propagate | <ul><li>Deleting values in a source PI Data Archive does not delete the corresponding values in the SDS.</li></ul> |