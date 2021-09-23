---
uid: sdsTableFormat
---

# Table format

A table is a convenient structure for analytics and display. The REST APIs for retrieving multiple events from 
the data store supports returning results in a table. The form variable can be set to specify a table or a table 
with headers.

Table format can be applied to any read that returns multiple values and summaries. 

##### [Csharp](#tab/tabid-0)
```csharp
      public enum State
      {
        Ok,
        Warning,
        Alarm
      }

      public class Simple
      {
        [SdsMember(IsKey = true, Order = 0) ]
        public DateTime Time { get; set; }
        public State State { get; set; }
        public Double Measurement { get; set; }
      }
```

##### [Python](#tab/tabid-1)
```python
      class State(Enum):
        Ok = 0
        Warning = 1
        Alarm = 2

      class Simple(object):
        Time = property(getTime, setTime)
        def getTime(self):
          return self.__time
        def setTime(self, time):
          self.__time = time

        State = property(getState, setState)
        def getState(self):
          return self.__state
        def setState(self, state):
          self.__state = state

        Measurement = property(getValue, setValue)
        def getValue(self):
          return self.__measurement
        def setValue(self, measurement):
          self.__measurement = measurement
```

##### [JavaScript](#tab/tabid-2)

```javascript

      var State =
      {
        Ok: 0,
        Warning: 1,
        Alarm: 2,
      }

      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }
      With values as follows:
      4/1/2017 7:00:00 AM : Warning  0
      4/1/2017 7:01:00 AM : Warning  1
      4/1/2017 7:02:00 AM : Warning  2
      4/1/2017 7:03:00 AM : Warning  3
      4/1/2017 7:04:00 AM : Warning  4
      4/1/2017 7:05:00 AM : Warning  5
      4/1/2017 7:06:00 AM : Warning  6
      4/1/2017 7:07:00 AM : Warning  7
      4/1/2017 7:08:00 AM : Warning  8
      4/1/2017 7:09:00 AM : Warning  9 
```
---

The following is a request to retrieve values using the window parameters:
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data
      ?startIndex=2017-04-01T07:00:00Z&endIndex=2017-04-01T07:10:00Z
 ```

The following response would be returned from the above code:

      Content-Type: application/json

      [
         {  
            "Time":"2017-04-01T07:00:00Z",
            "State":1
         },
         {  
            "Time":"2017-04-01T07:01:00Z",
            "State":1,
            "Measurement":1.0
         },
         {  
            "Time":"2017-04-01T07:02:00Z",
            "State":1,
            "Measurement":2.0
         },
         {  
            "Time":"2017-04-01T07:03:00Z",
            "State":1, 
            "Measurement":3.0
         },
         {   
            "Time":"2017-04-01T07:04:00Z",
            "State":1,
            "Measurement":4.0
         },
         {  
            "Time":"2017-04-01T07:05:00Z",
            "State":1,
            "Measurement":5.0
         },
         {  
            "Time":"2017-04-01T07:06:00Z",
            "State":1,
            "Measurement":6.0
         },
         {  
            "Time":"2017-04-01T07:07:00Z",
            "State":1,
            "Measurement":7.0
         },
         {  
            "Time":"2017-04-01T07:08:00Z",
            "State":1,
            "Measurement":8.0
         },
         {  
            "Time":"2017-04-01T07:09:00Z",
            "State":1,
            "Measurement":9.0
         }
      ]

To retrieve the results in table format, add the form variable and specify table.
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data
      ?startIndex=2017-04-01T07:00:00Z&endIndex=2017-04-01T07:10:00Z
      &form=table
 ```

Response

      Content-Type: application/json

      {  
         "Name":"Simple",
         "Columns":[  
            {  
               "Name":"Time",
               "Type":"DateTime"
            },
            {  
               "Name":"State",
               "Type":"Int32Enum"
            },
            {  
               "Name":"Measurement",
               "Type":"Double"
            }
         ],
         "Rows":[  
            [  
               "2017-04-01T07:00:00Z",
               1,
               0.0
            ],
            [  
               "2017-04-01T07:01:00Z",
               1,
               1.0
            ],
            [  
               "2017-04-01T07:02:00Z",
               1,
               2.0
            ],
            [  
               "2017-04-01T07:03:00Z",
               1,
               3.0
            ],
            [  
               "2017-04-01T07:04:00Z",
               1,
               4.0
            ],
            [  
               "2017-04-01T07:05:00Z",
               1,
               5.0
            ],
            [  
               "2017-04-01T07:06:00Z",
               1,
               6.0
            ],
            [  
               "2017-04-01T07:07:00Z",
               1,
               7.0
            ],
            [  
               "2017-04-01T07:08:00Z",
               1,
               8.0
            ],
            [  
               "2017-04-01T07:09:00Z",
               1,
               9.0
            ]
         ]
      }


To retrieve the results in table format with column headers, add the form variable and specify ``tableh``.
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data
      ?startIndex=2017-04-01T07:00:00Z&endIndex=2017-04-01T07:10:00Z
      &form=tableh
 ```

Response

      Content-Type: application/json

      {  
         "Name":"Simple",
         "Columns":[  
            {  
               "Name":"Time",
               "Type":"DateTime"
            },
            {  
               "Name":"State",
               "Type":"Int32Enum"
            },
            {  
               "Name":"Measurement",
               "Type":"Double"
            }
         ],
         "Rows":[  
            [  
               "Time",
               "State",
               "Measurement"
            ],
            [  
               "2017-04-01T07:00:00Z",
               1,
               0.0
            ],
            [  
               "2017-04-01T07:01:00Z",
               1,
               1.0
            ],
            [  
               "2017-04-01T07:02:00Z",
               1,
               2.0
            ],
            [  
               "2017-04-01T07:03:00Z",
               1,
               3.0
            ],
            [  
               "2017-04-01T07:04:00Z",
               1,
               4.0
            ],
            [  
               "2017-04-01T07:05:00Z",
               1,
               5.0
            ],
            [  
               "2017-04-01T07:06:00Z",
               1,
               6.0
            ],
            [  
               "2017-04-01T07:07:00Z",
               1,
               7.0
            ],
            [  
               "2017-04-01T07:08:00Z",
               1,
               8.0
            ],
            [  
               "2017-04-01T07:09:00Z",
               1,
               9.0
            ]
         ]
      }
