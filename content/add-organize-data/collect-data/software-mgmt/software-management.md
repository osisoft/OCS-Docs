---
uid: SoftwareMgmt
---

# Software management (Preview)

Software management provides a centralized location to monitor the health and manage the software configuration of edge systems, including Edge Data Store and PI Adapters. This gives you visibility into the data collection software that is deployed on remote devices. To be available in software management, an edge system must have an OCS health endpoint configured. For information on configuring health endpoints, see the specific edge system product documentation.

## Health monitoring

The `Software Management Edge Systems` page displays a list of edge system digital twins. Each edge system twin is a virtual representation of an actual edge system that is currently writing health data to the selected namespace. You can review health information for edge systems, including the current status of each system and when it last communicated with OCS. Use sort and filter functionality to navigate edge system twins to pinpoint problems and identify gaps in data collection. View detailed health information for your edge systems to understand their overall health. Digital twins are also created for PI Interfaces that send health data to OCS, and can be used to monitor PI Interface health. 

## Configuration management

Use the `Software Management Edge Systems` page to review detailed information about each edge system, its components, and its configurations. You can also manage, create, and edit edge system software configurations.

Use the `Software Management Base Configurations` page to create and maintain a collection of base configurations that you can apply to edge systems. Create each base configuration from either a default configuration or an imported configuration. Then modify configurations using the portal's built-in editor, which identifies formatting errors as you work, helping you avoid problems later. Export a base configuration to manually apply it to a physical edge system in the field or to deploy it using AVEVA Edge Management. For more information, see the [AVEVA Edge Management](https://dev-edgemanagement.capdev-connect.aveva.com/help/#/home/665916/10/11) documentation.

In the field, you may need to customize a base configuration for a specific system. Once an edge system configuration is complete and it is writing data to health data to OCS, the `Software Management` page shows its corresponding edge system twin. To store, review, and access configurations from a central location, import the actual configurations from the field to the corresponding edge system twins. 
