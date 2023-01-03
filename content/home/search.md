---
uid: search
---

# Search

Many pages in OSIsoft Cloud Services (OCS) include a search or query bar to help find streams, assets, or other objects. This page offers tips and best practices for using search.

## Tooltip

Some **Search** and **Query** bars include a tooltip that opens when you select the bar. This tooltip includes information on how use search features like wildcards, filters, and operators.

**Search tooltip**

![search tooltip](images/tooltip.png)

## Autocomplete

Autocomplete suggests useful search tokens or phrases as you type in a search field. Autocomplete complements the search experience by:

- Enhancing the search experience for users who may not know the available keywords.

- Preventing typos and reducing the need for wildcards, which can result in more complex queries.

Autocomplete includes suggestions for tokens, facets, and status matches, as well as search history.

**Search autocomplete**

![search autocomplete](images/autocomplete.png)

### Token Autocomplete

Token autocomplete suggestions consist of a single token and an occurrence count. Tokens available for autocomplete include all tokens that appear in properties with a searchable attribute. Suggestions are ranked by each token's occurrence count, which is the number of times that the token occurs in completable properties across all objects. For example, if "Minnesota" appears 200 times across objects in the index and "Mitsubishi" appears 100 times, a query `mi` would result in "Minnesota" being weighted higher and appearing first.

### Faceted Autocomplete

Faceted autocomplete suggestions consist of a collection of matching phrases, each with a list of categories and a object count for each category. The categories are the name of the property for properties comprising of simple types (Int32, DateTime, etc.) and collections of simple types (static facets). For collections of key-value pairs, the keys represent categories and the values represent phrases. Suggestions are ranked by the phrase's object count. In other words, the phrase that appears in the most number of objects ranks first in the results.

## Developer documentation

See the following topics in for full details about search and the objects and properties that you can search for:

- <xref:asset-search-dev-guide>: Information on searchable properties while using the Asset Store.

- <xref:sdsSearching>: Information on searchable properties while using the Sequential Data Store.

**Note:** You can use the search information above to search for data objects when editing data view queries as well.
