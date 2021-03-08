---
uid: AddEdgeSystems
---

# Add edge systems

In this workflow, the customer is configuring a new edge system and will use the OCS Software Management service to configure one or more edge systems.

This workflow highlights the remote, centralized software configuration capability of the OCS Software Management service and provides the foundation for a future end to end installation and configuration experience when a third-party device management system is integrated with the Software Management service (e.g., Microsoft Azure IoT Edge). This workflow is also applicable to customers that have no device management system or to customers that have custom coded their own (or other third party) device management solution.

Workflow 3 Tasks:
1.	The customer logs into OCS and navigates to the Software Management home page (from the edge system status summary or the OCS menu). 
a.	On the Software Management home page, the edge system status table will have existing edge systems displayed or will be empty when used for the first time.
2.	The customer navigates to the edge system configuration sidebar view.
a.	The edge system configuration page is presented.
b.	Navigation to the configuration sidebar and subsequent display of new edge system configuration requires additional thought to determine the appropriate user experience. 
c.	Potential options:
i.	The customer selects “add new edge system” from the configuration sidebar, independent of the edge system status table. 
ii.	The customer creates an edge system placeholder with the necessary details in the edge system status table and thus tie into the existing workflow to configure an existing edge system. 
3.	The customer selects the edge system type to configure.
a.	A list of all supported edge system types and versions is provided to aid in edge system selection.
4.	The customer configures the edge system.
a.	Options are provided to view and configure the edge system components individually or as a complete system.
b.	Edge system configuration properties include their default values.
c.	The customer is reminded to configure the edge system OMF health and diagnostics endpoints. The Software Management service documentation includes instructions for configuring the health and diagnostics endpoints support the edge system status display capability (see Workflow 1).
5.	The customer completes the configuration and verifies it is valid.
a.	The validation may occur automatically during the configuration process or may be manually initiated by the customer as consistent with similar tasks in OCS.
b.	The validation includes all required parameters are included and are within their limits, and all parameters have valid data types.
6.	The customer saves the edge system configuration.
a.	The configuration is stored in an edge system compatible format.
b.	The configuration is available for retrieval and further editing by the customer.
c.	The configuration includes an identifier that is automatically applied and enables the edge system health and diagnostics messages as displayed in the Software Management status display table to be automatically linked to the appropriate edge system configuration.
d.	The customer may elect to not save the configuration/cancel out and thus any changes made revert to their default values.
7.	The customer selects another edge system to configure, as needed.
a.	The customer follows the same steps as noted above.
b.	The customer can apply the same configuration to multiple edge systems of the same type.
8.	The customer manually generates the OMF endpoint security credentials for OMF health and diagnostics data transfer to OCS (see Note 5).
a.	 The customer uses the “Connections” configuration in the OCS portal to generate these credentials. 
9.	The customer manually generates the appropriate OMF endpoint security credentials for “process data” transfer to the PI Server and/or OCS, as needed (see Note 5).
a.	 The customer uses other OSIsoft provided tools to generate these credentials. 
10.	The customer downloads the edge system configuration to their local computer. 
a.	The customer applies the configuration to their edge system(s) using their own processes (e.g., manually, via install scripts).
b.	The customer applies the OCS OMF endpoint security credentials to the edge system health endpoint configuration.
c.	The customer applies the OMF security credentials to the edge system “process data” endpoint configuration.
d.	The customer may have several similar devices that use the same edge system configuration and/or security credentials.
e.	The customer manually restarts the edge system, as required by the configuration changes made.
11.	The customer navigates to the Software Management service home page view the new edge systems.
a.	New edge systems are discovered automatically.
b.	The edge system status table displays entries for the newly configured edge systems.
12.	The customer selects an edge system from the table and is presented with additional information in a sidebar about the edge system and its components (see Notes 2, 3, and 4).
a.	Status of each edge system component is provided, including edge system version, installation date/time and last configuration date/time.
