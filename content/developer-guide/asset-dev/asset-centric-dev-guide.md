---
uid: asset-centric-dev-guide
---

# Assets Centric Data

The asset data API provides a quick way to retrieve data stored in an asset's referenced streams. 

In order to retrieve stream data from an asset, you must first set up stream references for a given asset. The data that is retrieved is based on the resolved asset. By default, data calls return data for all stream references. 

If you are only interested in data from a subset of streams, you must specify the streams encoded as a URL parameter. The format is to add `stream={streamReferennceName}` for each stream reference separated by ampersands (&).

For example, if a given asset has the following definition and you are only interested in HeaterA and PressureB for the last data call, you would send:

```text 
GET ...Namespaces/{namespaceId}/Assets/AssetStreamFilter/Data/Last?Stream={HeaterA}&Stream={PressureB}
```

**Note:** Asset stream references can contain commas. In this case, the comma must be properly escaped.