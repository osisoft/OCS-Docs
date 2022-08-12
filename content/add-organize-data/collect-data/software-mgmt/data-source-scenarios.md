---
uid: DataScenarios
---

# Data source scenarios DO NOT INCLUDE 4/2022

Accessing multIPle data sources on the same device requires planning. The following scenarios describe possible configurations and the corresponding considerations. 

## Docker network topology for Azure IoT Edge

When you start Docker, a default bridge network is created automatically, and newly-started containers connect to it unless otherwise specified. Bridge networks are usually used when applications run in standalone containers that need to communicate.

Azure Iot Edge creates its own docker network for use with all of its containers. This docker network is named `azure-iot-edge` and all Azure IoT Edge containers are added by default. All containers within this network are automatically allowed to contact other containers in this network via their Docker container ID (short Id) as well as their Docker container name. Azure IoT Edge also adds a DNS alias for the hostname of the machine to map to the edgeHub container.

## Scenario 1 - OPC UA Adapter module egress to EDS on the same device

Say you want to add OMF egress from an OPC UA Adapter module to an EDS module on the same device. Since both module containers are on the same Docker network, created by Auzre IoT Edge, they can refer to each other by their container names. In this case the OPC UA Adapter has the name `data_collection_opcua_adapter_module_linux_x64`(TODO update to proper name) and EDS has the name `edge_module_system_edge_data_store` (TODO: update to the proper name). From the OPC UA Adapter, you can set up egress endpoint to look like `http://edge_module_system_edge_data_store:5590/api/v1/omf` (TODO: verify OMF endpoint). This solution depends on the name that Azure IoT Edge and EMS configure for the modules. 

<!-- from dev: I'm fairly certain that a change to EMS which allows multIPle modules of the same type on a device will affect the module name on the device, those changes are likely TBD(?). -->

## Scenario 2 - OPC UA Adapter module contact server on host

Say you want to add a data source for an OPC UA Adapter module that is on the host machine. You cannot use localhost from the container, because that refers to the container. You cannot use the hostname of the device because Azure IoT Edge maps that to the edgeHub container. This leaves either the FQDN or the devices external IP. The FDQN is likely the most promising because it would likely be refreshed when needed and should always point to the same machine. That being said, it is possible that a machine would not have an FQDN, and therefore would need to use the external IP. The customer would need to make sure to set the IP as static so that the IP address does not change if connection resets. The other problem with using a static IP is that the customer would need to know it before going to ADH to modify the configuration.

### Scenario 2 - Solutions

Possible solutions for this scenario include:

- Assign a static IP address for the host device.

- Assign a static DNS entry for the host device (like an FQDN).

- Use the Azure IoT Edge network IP.

  This option refers to using the IP address that is assigned to the host machine, on the azure-iot-edge network. This can be identified by the current network, and the host is always* (TODO: find source) x.x.x.- You could also verify the IP by checking from the host by running IP address and finding the information associated with the azure-iot-edge network.

- Add the `--add-host=host.docker.internal:host-gateway` container create option.

  This option is relatively new to Docker. See this answer . If EMS adds this option for the modules, then you can always refer to the host using the name host.docker.internal.

- Add a custom configuration token that EMM will handle, similar to a secret.

  This token could look like `{{hostname}}` and when EMM sees this token, it could run something like IP address and find the network that is for azure-iot-edge. A problem with this solution is that the end configuration will not match the configuration stored in ADH, because the end configuration will have an IP address instead of the mustache token.

<!-- AMF 2/23/22 Here is a link to the source: https://dev.azure.com/osieng/engineering/_wiki/wikis/edge-management-modules.wiki/35693/WI291580-Accessing-Data-Sources-on-the-Same-Device -->