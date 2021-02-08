---
uid: bpStreams
---

# Streams Best Practices

- Ensure that the default stream permissions are configured before you begin creating streams. While you can later do a bulk update of stream permissions, it is easier to configure the default permissions before the streams are created. Permissions that vary from the default are configured on the individual streams.

- OSIsoft recommends you use a meaningful pattern when naming your streams, to identify them easily. For example, a naming pattern might be "QuickStart.{Region}.{Site}.{Equipment}". This also makes it possible for OCS tools, such as metadata rules, to use this naming schema to find relevant data. Metadata like this can also be stored as key-value pairs on the stream, but a well-defined naming pattern also allows metadata to be generated automatically. However, when manually creating streams, it is preferred to directly add metadata rather than using rules.

- Use the stream description field, metadata, and tags to capture any other relevant information about the stream. This information is useful for searching for specific streams in the system, especially as systems become large. If possible, use consistent patterns in description, metadata, and tags.
  - Use metadata for information that follows a specific or consistent pattern, such as the location, manufacturer, and site.
  - Use tags for simple information about the stream that doesn't adhere to any particular pattern.
  - Use the description field for longer descriptions of the stream and what it represents.
