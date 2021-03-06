"Filed out from Dolphin Smalltalk X6.1"!

IpHlpApiTableStruct subclass: #MIB_IPFORWARDTABLE
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
MIB_IPFORWARDTABLE guid: (GUID fromString: '{61CE489C-F9E4-43F1-978B-3CC2F491E64C}')!
MIB_IPFORWARDTABLE comment: '<MIB_IPFORWARDTABLE> is an <ExternalStructure> class to wrap the struct ''Win32.MIB_IPFORWARDTABLE'' from type information in the ''Win32 API (ANSI). Derived from Bruce McKinney�s Hardcore Visual Basic Type Library'' library.

The type library contains no documentation for this struct

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef 
struct tagMIB_IPFORWARDTABLE {
	unsigned long dwNumEntries;
	MIB_IPFORWARDROW table[1];
} MIB_IPFORWARDTABLE;
'!
!MIB_IPFORWARDTABLE categoriesForClass!Win32-Structs! !
!MIB_IPFORWARDTABLE methodsFor!

table
	"Answer the receiver's table field as a Smalltalk object."

	^StructureArray fromAddress: (bytes yourAddress + 4) length: self dwNumEntries elementClass: MIB_IPFORWARDROW! !
!MIB_IPFORWARDTABLE categoriesFor: #table!**compiled accessors**!public! !

!MIB_IPFORWARDTABLE class methodsFor!

defineFields
	"Define the fields of the MIB_IPFORWARDTABLE structure.
		MIB_IPFORWARDTABLE compileDefinition
	
		typedef 
		struct tagMIB_IPFORWARDTABLE {
			unsigned long dwNumEntries;
			MIB_IPFORWARDROW table[1];
		} MIB_IPFORWARDTABLE;
"

	super defineFields.
	self 
		defineField: #table
		type: ((ConformantStructureArrayField type: MIB_IPFORWARDROW length: #dwNumEntries)
				beReadOnly;
				yourself)
		offset: 4.
	self byteSize: 60! !
!MIB_IPFORWARDTABLE class categoriesFor: #defineFields!initializing!public! !

