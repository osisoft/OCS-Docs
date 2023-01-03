---
uid: data-views-retrieve
---

# Retrieve data for a data view

[!include[data-views-retrieve](../../_includes/data-views-retrieve.md)]

## Data retrieval options

To retrieve a data view, you can either use the OCS Power BI Connector, or you can interact directly with the OCS REST API using an example GitHub project as a starting point.

### Option A: Microsoft Power BI

You can retrieve a data view using Microsoft Power BI. Retrieving a data view in Microsoft Power BI requires installation of OCS Power BI Connector. The banner at the top of the [Data Views](xref:CreateDataView) page contains a link to the Connector.

### Option B: Interact with the REST API

Alternative to using Microsoft Power BI, you can interact with the OCS REST API directly by using a sample project provided by AVEVA. Sample projects for the following technologies are available on GitHub:

- [Grafana](https://github.com/osisoft/sample-adh-grafana-nodejs)
- [Jupyter](https://github.com/osisoft/sample-adh-data_views_jupyter-python)
- [Python](https://github.com/osisoft/sample-adh-data_views-python)
- [R](https://github.com/osisoft/sample-adh-data_views_r-r)
- [.NET](https://github.com/osisoft/sample-adh-data_views-dotnet)
- [Java](https://github.com/osisoft/sample-adh-data_views-java)

## Workflow: Data view retrieval

To retrieve a data view in a third-party application, follow these steps:

### [Microsoft Power BI](#tab/tabid-1)

#### Step 1. Install the OCS Microsoft Power BI Connector

Install the OCS Power BI Connector. The banner at the top of the [Data Views](xref:CreateDataView) page contains a link to the Connector. If you dismiss the banner, you can still download the connector by selecting **More options** ![more options](../../_icons/default/dots-vertical.svg) > **Power BI Connector**.

For more information on installing the OCS Power BI Connector, see <xref:SetUpPowerBI>.

#### Step 2. Use Microsoft Power BI to retrieve your data view

Use Microsoft Power BI to retrieve your data views. For more information, see <xref:RetrieveDataViews>.

### [REST API](#tab/tabid-2)

#### Step 1. Create Client-Credentials Client

To retrieve a data view from OSIsoft Cloud Services (OCS), you must authenticate with a valid Client Id and Client secret. You can obtain an Id and secret by creating a set of client-credentials. When you create the client-credentials, accept the default expiry of 3600 seconds. When you receive the client secret, keep it secure, as there is no way to see the secret again. If you lose it, you need to create a new set of client-credentials.

For more information on creating client-credential clients, see <xref:gpClientCredentialsClient>.

#### Step 2. Configure your sample project and retrieve your data view

Use one of the starter projects listed in [Option B: Interact with the REST API](#option-b-interact-with-the-rest-api). Pass your project client-credentials to authenticate and provide it with the URI for your data view. For more information on this process, see the link above.

***

### Tip: Use the API Console to retrieve your data view

[!include[api-console](_includes/api-console.md)]

### Developer documentation

For more information on interacting with a data view using the API console, see the [Developer Guide](xref:DataViewsOverview).