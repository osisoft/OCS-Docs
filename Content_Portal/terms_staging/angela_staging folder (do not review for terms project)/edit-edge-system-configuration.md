---
uid: EditEdgeSystemConfig
---

# Edit edge system configuration

In this workflow, the customer has several edge systems installed, configured, and reporting their edge system health and diagnostics messages to OCS. The customer uses the edge system status table to select an edge system to configure.

This workflow highlights the edge system software status display and centralized configuration capabilities of the OCS Software Management service and provides the foundation for a future end to end installation, configuration, and monitoring experience when a third-party device management system is integrated with the Software Management service (e.g. Microsoft Azure IoT Edge). This workflow is also applicable to customers that have no device management system or to customers that have custom coded their own (or other third party) device management solution.

Workflow 2 Tasks:
1.	The customer navigates to the Software Management service home page (from the edge system status summary or the OCS menu) (see Notes 2, 3, and 4).
a.	On the Software Management home page, the edge system status table provides status for edge systems configured to send health and diagnostics messages to OCS.
2.	The customer uses the sorting and filtering capabilities provided in the table to organize the list of edge systems.
a.	The edge system table is updated accordingly.
3.	The customer selects an edge system from the table and is presented with additional information in a sidebar about the edge system and its components.
a.	Status of each edge system component is provided, including edge system version, installation date/time and last configuration date/time.
4.	The customer selects to configure the edge system from the sidebar (see Notes 2, 3, and 4).
a.	The Software Management context switches from the table view to the configuration view.
b.	The configuration of the selected edge system is presented.
5.	The customer configures the edge system component(s).
a.	Options are provided to view and configure the edge system components individually or as a complete system.
6.	The customer completes the configuration and verifies it is valid.
a.	The validation may occur automatically during the configuration process or may be manually initiated by the customer as consistent with similar tasks in OCS.
b.	The validation includes all required parameters are included and are within their limits, and all parameters have valid data types.
7.	The customer saves the edge system configuration.
a.	The configuration is stored in an edge system compatible format.
b.	The configuration is available for retrieval and further editing by the customer.
c.	The customer may elect to not save the configuration / cancel out and thus any changes made revert to their previous values.
8.	The customer navigates back to the Software Management table view and selects another edge system to configure, as needed.
a.	The customer follows the same steps as noted above.
9.	The customer manually generates the appropriate OMF endpoint security credentials for the edge system for data transfer to the PI Server and/or OCS, as appropriate (see Note 5).
a.	 The customer uses other OSIsoft provided tools to generate these credentials. 
10.	The customer downloads the edge system configuration to their local computer.
a.	The customer applies the configuration to their edge system(s) using their own processes (e.g., manually, via install scripts).
b.	The customer applies the security credentials to the edge system OMF endpoint configuration, as needed.
c.	The customer manually restarts the edge system, as required by the configuration changes made.
11.	The customer navigates to the Software Management service home page to view the configuration update(s) (see Notes 2, 3, and 4).
a.	Configuration updates may be represented as status updates, streams configured, last configured time and/or other known telemetry parameters.
12.	The customer has several new remote assets that have come online and needs to install and configure several new edge systems for these assets. 
a.	Proceed to Workflow 3.
