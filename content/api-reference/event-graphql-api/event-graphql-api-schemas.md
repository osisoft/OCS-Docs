---
uid: event-graphql-api-schemas

---

# Schemas
The Schemas Asp.net Core controller.

## `Check For Schema Changes`

<a id="opIdSchemas_Check For Schema Changes"></a>

Triggers a check to the TypeStore to see if the schema or access control needs to be reloaded. If they need to be reloaded then the service will be temporarily unavailable (503).

<h3>Request</h3>

```text 
POST /api/v1.0-preview/tenants/{tenantId}/namespaces/{namespaceId}/graphql/schema
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

Any non-empty text/plain content. You can use the word "force" to force a schema reload.<br/>

```json
"string"
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success.|
|204|None|Schema is already up to date.|
|400|string|Failed to update the schema. If this does not resolve itself you may need to contact technical support.|
|403|string|Forbidden.|
|503|None|Service unavailable.|

