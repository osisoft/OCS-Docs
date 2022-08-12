---
uid: DeployConfig
---

# Deploy an edge system configuration

After you export an edge system configuration, you have to manually deploy the configuration to the edge system in the field. Alternatively, you can use AVEVA Edge Management to deploy Edge Data Store, PI Adapter for OPC UA, and PI Adapter for MQTT. For more information, see the [AVEVA Edge Management](https://dev-edgemanagement.capdev-connect.aveva.com/help/#/home/665916/10/11) documentation.

For details on how to deploy a configuration manually, see the specific edge system product documentation: 

 - [Edge Data Store](https://docs.osisoft.com/bundle/edge-data-store/page/configuration/configuration.html)

 - [PI Adapter for BACnet](https://docs.osisoft.com/bundle/pi-adapter-bacnet/page/configuration/configuration.html)
 
 - [PI Adapter for DNP3](https://docs.osisoft.com/bundle/pi-adapter-dnp3/page/configuration/configuration.html)
 
 - [PI Adapter for Modbus TCP](https://docs.osisoft.com/bundle/pi-adapter-modbus/page/configuration/configuration.html)
 
 - [PI Adapter for OPC UA](https://docs.osisoft.com/bundle/pi-adapter-opc-ua/page/configuration/configuration.html)

 - [PI Adapter for MQTT](https://docs.osisoft.com/bundle/pi-adapter-mqtt/page/configuration/configuration.html)

After deploying the configuration, manually update the configuration file on the device to replace any mustache tokens used as place holders for secrets with the actual secrets.

After deploying the configuration, to have an accurate record of the configuration, import the configuration file, including any modifications made in the field, to the corresponding edge system twin in AVEVA Data Hub.

# Data source scenarios

If you need to access multiple data sources on the same device, you need to differentiate the data sources. You can use the following options to identify the data sources:

 - Static IP address
 
 - Fully qualified device name

We recommend you review your specific scenario with your network administrator to determine the appropriate configuration for your use case.
