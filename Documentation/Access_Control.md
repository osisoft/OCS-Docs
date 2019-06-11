---
uid: accessControl
---

Role-based access control 
=========================

Within OCS, role-based access control to entities such as Namespaces, Streams, and so on, is managed using an Access Control 
List (ACL) and an Owner identity assigned to each entity. ACLs control access to entities based on their OCS Roles. Owners 
are granted access for all operations regardless of the contents of the ACL. Not all entities in the OCS system support 
role-based access control at this time, but the list will quickly grow and currently includes Namespaces and several unreleased 
entities.


Access Control Lists
--------------------

Access Control Lists (ACLs) contain sets of Access Control Entries (ACEs) each with a trustee (reference to an identity, such 
as a role, user, or application), AccessType, and AccessRights. 

A user or application that attempts to read, write, delete, or manage access control of an entity assigned an ACL must be 
assigned a trustee that has ``AccessType`` set to ``Allowed`` for the AccessRight corresponding to that operation.

AccessRights are the bitwise union of all of the access rights they encompass. For example, ``AccessRights 3`` indicates 
that Read and Write access is permitted.

*Note*  
If an operation requires more than one access right then an identity can obtain 
  those rights from multiple ACL entries.

*Note*  
``AccessType.Denied`` takes precedence over ``AccessType.Allowed``. For example, a role that is assigned ``AccessType.Denied`` for
  ``AccessRights.All`` will receive a ``forbidden`` for all  requests unless they are the owner of the entity.

*Note*  
Roles are the only TrusteeType supported for AccessControlList ACEs.


| TrusteeType           | TypeId | 
|-----------------------|--------|
| User                  | 1      |
| Application           | 2      |
| Role                  | 3      |


| AccessType            | TypeId | 
|-----------------------|--------|
| Allowed               | 0      |
| Denied                | 1      |

#### CommonAccessRightsEnum 

| AccessRights          | int  | bitwise |
|-----------------------|------|---------|
| None                  | 0    |    0000 |
| Read                  | 1    |    0001 |
| Write                 | 2    |    0010 |
| Delete                | 4    |    0100 |
| ManageAccessControl   | 8    |    1000 |
| All                   | 15   |    1111 |

The following code sample shows the structure and format for an ACL
that gives Role 1 Read Access, Role 2 All access 
but denies Role 3 ManageAccessControl Access:

#### AccessControlList

**Body**

  Sample  body:

      HTTP/1.1 200
      Content-Type: application/json

      "AccessControlList": {
    	"RoleTrusteeAccessControlEntries": [
    		{
    			"Trustee": {
    				"Type": 3,
    				"RoleId": "11111111-1111-1111-1111-111111111111"
    			},
    			"AccessType": 0,
    			"AccessRights": 1
    		},
    		{
    			"Trustee": {
    				"Type": 3,
    				"RoleId": "22222222-2222-2222-2222-222222222222"
    			},
    			"AccessType": 0,
    			"AccessRights": 15
    		},
    		{
    			"Trustee": {
    				"Type": 3,
    				"RoleId": "33333333-3333-3333-3333-333333333333"
    			},
    			"AccessType": 1,
    			"AccessRights": 8
    		}
    	],
    	}


Owner
-----

Owner objects on OCS entities are used to grant access for all operations on the entity regardless of the 
entity's AccessControlList's AccessControlEntries. 

*Note*  
Currently, only Users and Applications are valid owners for entities.  

The following code samples shows the format and structure of an owner object:

#### Trustee

**User Owner Body**

	"Owner": {
		"Type": 1,
		"TenantId": "55555555-5555-5555-5555-555555555555",
		"ObjectId": "44444444-4444-4444-4444-444444444444"
	},

**Application Owner Body**

	"Owner": {
		"Type": 2,
		"TenantId": "55555555-5555-5555-5555-555555555555",
		"ApplicationId": "66666666-6666-6666-6666-666666666666"
	},
