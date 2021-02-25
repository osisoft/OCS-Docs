# What is OSIsoft Message Format (OMF)?

OSIsoft Message Format (OMF) is a specification that defines a set of message headers and bodies used to generate messages for ingestion into a compliant back-end system.

For programmatic access to data, you can use OMF to develop data acquisition applications on platforms and in languages for which there is no native support. This allows you to integrate data collection directly into a device or asset.

OMF itself does not define or depend on any binary message protocol, such as HTTP, AMQP, or Kafka. Instead, it is based on an abstract message type, where a message consists of a set of key/value pairs, which may include binary files, configuration files, and batch or Shell scripts. You can construct OMF messages using any message protocol that defines headers and bodies.

Refer to [OMF Message Format](https://omf-docs.osisoft.com/) for additional information about the OMF specification.