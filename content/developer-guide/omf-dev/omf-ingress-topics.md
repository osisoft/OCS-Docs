---
uid: omfIngressTopics
---

# Topics 

OMF topics aggregate OMF messages received from one or more clients and makes them available for consumption by a subscription.

## Topic information 
A topic must contain at least one Client Id. Clients may be added to or removed from an existing topic. A given client may belong to multiple topics in separate namespaces. 

When you create a topic, OMF messages sent from the topic's associated clients are routed to a queue where they can be consumed by a subscription. This queue makes OMF messages available to subscriptions for up to seven days. While the OMF messages are in the topic queue, they are not available for retrieval via an API. They must first be consumed by a subscription and forwarded to a data store. The topic queue stores the OMF messages in the region of its namespace.

## Topics API
- [Topics](xref:omf-ingress-topics)