---
uid: omfIngressSubsctriptions
---

# Subscriptions 

A subscription consumes OMF messages from a topic and forwards them to a data store. 
Multiple subscriptions can retrieve OMF messages from a single *topic*. 

## Subscription information 
A subscription can consume OMF messages from a *topic* in a different *namespace*; however, the topic's namespace must be in the same region as the subscription's namespace.
OMF messages that the subscription is processing are temporarily stored in the region of its namespace.
An OMF Subscription retrieves OMF messages from a topic and writes them directly to a namespace in the Sequential Data Store. 
Currently only OMF subscriptions are supported. The documentation uses OMF subscription and subscription interchangeably.

## Subscriptions API 
- [Subscriptions](xref:omf-ingress-subscriptions)
