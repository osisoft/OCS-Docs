---
uid: streaming-updates-intro
---

# Streaming Updates

Add enterprise-scale egress event streaming capabilities to AVEVA Data Hub. Event streaming can support analytics, visualization/dashboarding, rules processing, evolving search indexes, anomaly detection, and transaction processing. Event streaming supports the ingestion of millions of events per second, retaining the events for customizable periods of time and/or quantities of storage, and serving those events to multiple, parallel consumers.  

Event streaming supports producers and consumers. Producers send events into a stream or log and consumers read them. Reading is not destructive, as with a queue. Producers and consumers are matched, both understanding the type of events supported by the event stream. One set of producer and consumer may operate against stream metadata in a streams collection, producing events representing changes to the collection. Another set of producers and consumers may understand stream data, streaming data changes from a group of streams.