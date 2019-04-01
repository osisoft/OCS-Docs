---
uid: sdsFilterExpressionsMetadata
---

Filter Expressions: Sds Objects
==================


This section focuses on filter expressions that can be applied to certain read operations that return Sequential Data Store objects (e.g. Streams, Types). For filtering on read operations of Sequential Data Store values refer to [Filter Expressions: Values](xref:sdsFilterExpressions).

Filter expressions can be applied to any read operation that returns multiple values, including 
``Get Streams``, ``Get Types``, and ``Get StreamViews``.


Fields
------------
For Streams and Types, filter expressions are valid for the same properties that are valid for the Search parameter. Valid fields 
for both Streams and Types are ``Name``, ``Id``, and ``Description``. 

Streams have an additional ``TypeId`` field that is filterable.

Additionally, Types have a collection of SdsTypeProperty objects held in a field named Properties (see [Types](xref:sdsTypes)). When filtering on these property objects, the filter is applied to the Name or Id of the property. If the Type derives from a base Type, the inherited properties will be filtered as well. To perform a filter on this collection, the Any() or All() functions must be used (see [Lambda Operators](#Sds_Filter_expressions_metadata_lambda_operators_topic)).

## <a name="Sds_Filter_expressions_metadata_string_functions_topic">String functions</a>

**Supported**

String operations are case insensitive for both the search value and the field name provided. The following string functions are supported for use within a
filter expression:

| function      | Comment                                                         |
|---------------|-----------------------------------------------------------------|
| ``endswith``  | Compare the character at the end of the input string            |
| ``startwith`` | Compare the character at the start of the input string          |
| ``contains``	| Search for characters anywhere in another string                |

**String function examples**

|Example                                      |Result                                                           |
|---------------------------------------------|-----------------------------------------------------------------|
|``endswith(Name, 'xyz')``                    |True if ``Name`` ends with the string ‘xyz’                      |
|``startswith(Id, 'abc')``                    |True if ``Id`` starts with the string ‘abc’                      |
|``contains(Name, 'bc')``                     |True if string ‘bc’ is found anywhere in ``Name``                |


## <a name="Sds_Filter_expressions_metadata_logical_operators_topic">Logical operators</a>

**Supported**

The following logical operators are supported for use within an object filter
expression:

| Operator   | Comment                                             |
|------------|-----------------------------------------------------|
| ``eq``     | Equal to                                            |
| ``( )``    | Parenthesis can be used to affect the order of the operation|
| ``or``     | Or logical operator                                 |
| ``and``    | And logical operator                                |
| ``not``    | Not logical operator                                |

Note that not all of the operators supported for filtering on [values](xref:sdsFilterExpressions) are 
supported for filtering on objects.

**Logical Operator Examples**

The following examples show logical operators and string functions.

- ``Name eq 'abcxyz'``
- ``startswith(Id, 'abc') and endswith(Id, 'xyz')``
- ``startswith(Id, 'abc') or startswith(Name, 'abc')``
- ``not (Name eq 'abcxyz')``
- ``startswith(Id, 'abc') and not endswith(Id, 'xyz')``
- ``(startswith(Id, 'abc') and endswith(Id, 'xyz')) or (startswith(Name, 'abc') and endswith(Name, 'abc'))``

## <a name="Sds_Filter_expressions_metadata_lambda_operators_topic">Lambda operators</a>

Lambda operators are used for operations against a field which is a collection of strings. The lambda operators require defining a lambda parameter and a boolean expression. Note that currently the only supported boolean expressions for the nested clause of the lambda operators are the three string functions and the equals logical operator. Other [logical operators](#Sds_Filter_expressions_metadata_logical_operators_topic) are not allowed.

**Supported**

The following lambda operators are supported for use within an object filter
expression:

| Operator   | Comment                                             |
|------------|-----------------------------------------------------|
| ``any``    | Match if any elements of the collection match the criteria|
| ``all``    | Match if all elements of the collection match the criteria|

**Lambda Operator Examples**

The following examples show logical operators which have a body defining the required lambda parameter and a single boolean expression. The lambda parameter is defined initially, and in the provided examples the user has chosen a query time lambda parameter named "parameter". After the ':' proceed to define your expression as defined in the aforementioned examples for [string functions](#Sds_Filter_expressions_metadata_string_functions_topic) (or the 'eq' [logical operator](#Sds_Filter_expressions_metadata_logical_operators_topic)) but replace all references to your SdsType/SdsStream field name with the lambda parameter name.

- ``Properties/any(parameter: parameter eq 'value')``
- ``Properties/all(parameter: startswith(parameter, 'abc'))``
