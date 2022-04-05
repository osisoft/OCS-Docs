---
uid: overview-metrics
---

# Overview of transfer metrics

The `Transfer Metrics` pane displays details about a transfer's progress by server connection. Metrics for streaming and historical events and the progress of stream and asset creation are shown. 

The following table provides a description of the fields in the `Transfer Metrics` pane.

| Field name | Description   |
| ------------- | ---------- |
| PI Data Archive Server Version | The version of PI Data Archive that is installed on the source server configured to send PI point data via the agent. |
| Last Streaming Read | The date of the latest stream read.|
| Streaming Events Per Second | The average number of streaming events transferred to the PI to OCS Agent per second over the last minute. This value is updated every 10 seconds during data transfer.  |
| Historical Events Per Second | The average number of historical events transferred to the PI to OCS Agent per second over the last minute. This value is updated every 10 seconds during data transfer. |
| Historical Transfer | Transfer progress for historical data.  |
| Historical Start | The historical start date of the transfer. |
| Historical End | The historical end date of the transfer. |
| Total PI Points In Transfer | Total number of PI points selected for transfer. |
| Total Points Updated | Total number of PI points updated during the transfer process. |
| Stream Creation Status | The progress of streams creation during transfer progression.  |
| Total Streams Created | Total number of streams created.  |
| Total Streams Updated | Total number of streams updated with new configuration and metadata. |
| Total Streams Deleted | Total number of deleted streams. |
| Stream Creation Errors  | Total number of errors generated while creation streams. |
| Stream Update Errors | Number of errors generated while updating streams. See the `Transfer Overview` section on the `Manage Agent` pane for error details. |
| Stream Deletion Errors | Number of errors generated during stream deletion. See the `Transfer Overview` section on the `Manage Agent` pane for error details. |
| AF Server Version            | The version of Asset Framework (AF) that is installed on the source server configured to send AF element data via the agent.  |
| Total Elements in Transfer | The number of AF elements configured in the transfer. |
| Total Elements Transferred | The number of AF elements transferred to the PI to OCS Agent.  |
| Assets Created Per Second | The number of assets created per second during the transfer. |
| Total Assets Created | The total number of assets created. |
| Assets Updated | The number of assets updated during the data transfer. |
| Total Assets Deleted | The total number of deleted assets. |
| Asset Create/Update Errors | The number of errors generated during asset creation or updating. |
| Asset Deletion Errors | The number of errors generated during asset deletion. See the `Transfer Overview` section on the `Manage Agent` pane for error details.