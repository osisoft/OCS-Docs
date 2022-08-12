---
uid: FailoverOverview
---

# Client failover (Preview)

The AVEVA Data Hub Client Failover Service provides failover capability for adapters to minimize data loss. It allows a set of two or more adapters to participate in a failover group with a configurable failover timeout and to send a heartbeat with adapter health status to the service endpoint. The service calculates the Primary, Pending Primary or Secondary role assignment for each adapter based on the health status and heartbeat arrival time. The service also provides role override capability for an end user to choose an adapter to be a forced Primary for adapter maintenance or upgrade scenarios.