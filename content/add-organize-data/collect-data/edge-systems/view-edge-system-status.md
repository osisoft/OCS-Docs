---
uid: ViewEdgeSystemStatus
---

# View edge system status

In this workflow, the customer has several edge systems installed, configured, and reporting edge system health and diagnostics messages to OCS.
 
This workflow highlights the edge system software status display capability of the OCS Software Management service and provides the foundation for a future end to end edge system software monitoring experience when a third-party device management system is integrated with the Software Management service (e.g., Microsoft Azure IoT Edge) and providing more information on the edge system installation and device status. This workflow is also applicable to customers that have no device management system or to customers that have custom coded their own (or other third party) device management solution.

PI Interfaces are included in the scope of Workflow 1 if their health messages are configured to report to OCS, i.e., in context of Workflow 1, the term edge system includes PI Interfaces (see Note 1).

Workflow 1 Tasks:
1.	The customer logs into OCS and from the OCS home page, can view a summary of all edge system status.
a.	The summary status indication looks and feels like the PI to OCS summary but with edge system status (a tenant--based, or namespace-based status summary is TBD).
2.	The customer clicks on the edge system status summary and is taken to the Software Management home page. Alternatively, the customer navigates to the “Software Management service” home page from the OCS menu (actual navigation in OCS will be Data Collection | Edge Systems) (see Notes 2, 3, and 4).
a.	On the Software Management service home page, the edge system status table provides status of all edge systems configured to send health and diagnostics messages to OCS.
b.	Edge systems are discovered automatically based on their health streams stored in OCS, regardless of how the edge systems were installed and configured. 
c.	From the Software Management status table, the customer can quickly visualize the edge system status via a status rollup of each edge systems (and their components) reporting to OCS.
d.	The customer can see a count of how many edge systems are installed and reporting to OCS.
3.	The customer uses the sorting and filtering capabilities provided in the table to organize the list of edge systems.
a.	The edge system table is updated accordingly.
b.	The customer can see a count of how many edge systems met the filtering criteria.
4.	The customer adds tags to the edge systems to further identify and organize the edge systems.
a.	The edge systems can now be sorted and filtered by their tags.
5.	The customer notices several edge systems in the table have undefined aspects, e.g., edge system type.
a.	The customer is able to manually update the undefined aspects with the appropriate information, e.g., provide the edge system type.
b.	Each field has a known set of information so when editing the undefined aspects, a list of appropriate entries is provided.
6.	The customer selects an edge system from the table and is presented with additional information in a sidebar about the edge system and its components (see Notes 2, 3, and 4).
a.	The additional information comes from the edge system health and monitoring messages.
b.	Status of each edge system component is provided, including edge system version, installation date/time and last configuration date/time.
c.	Any undefined aspects in the additional information can be manually added by the customer.
7.	From the sidebar, the customer can link to the OCS Trend to see a time-series trend of edge system health and diagnostics information.
a.	The OCS Trend is launched in context with its full set of capabilities.
b.	The trend is automatically populated with data for the appropriate health and diagnostics streams, e.g., device status, in context to the edge system selected.
8.	From the OCS Trend, the customer notices several edge systems statuses are transitioning from good to bad status and several other edge systems have a lower IO Rate than expected.
a.	The customer wants to view the edge system configuration to troubleshoot. 
b.	Proceed to Workflow 2.
