"Filed out from Dolphin Smalltalk X6"!

ADODBRecordset15 subclass: #ADODBRecordset20
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'ADODBConstants'
	classInstanceVariableNames: ''!
ADODBRecordset20 guid: (IID fromString: '{0000054F-0000-0010-8000-00AA006D2EA4}')!
ADODBRecordset20 comment: '<ADODBRecordset20> is a wrapper class for the COM interface ''ADODB.Recordset20'' generated from type information in the ''Microsoft ActiveX Data Objects 2.5 Library'' library. It contains methods to invoke the member functions exposed by that interface.

ADODBRecordSet20 is the ADO Record Set interface as defined in version 2.0 of ADO, and has been superceded by later versions (see the subclasses).'!
!ADODBRecordset20 categoriesForClass!ADODB-Interfaces!COM-Interfaces! !
!ADODBRecordset20 methodsFor!

_xSave
	"Invoke the _xSave() method of the COM object.
	Default values are passed for all optional parameters."

	^self
		 _xSave: nil
		 PersistFormat: 0!

_xSave: fileName PersistFormat: persistFormat
	"Invoke the _xSave() method of the COM object.

		HRESULT __stdcall _xSave(
			[in, optional] BSTR FileName,
			[in, optional, defaultvalue(0)] PersistFormatEnum PersistFormat);"

	<virtual stdcall: hresult 72 bstr sdword>
	^self invalidCall
!

activeCommand
	"Answer the <IDispatch> value of the 'ActiveCommand' property of the receiver."

	| answer |
	answer := IDispatch newPointer.
	self get_ActiveCommand: answer.
	^answer asObject
!

Cancel
	"Invoke the Cancel() method of the COM object.

		HRESULT __stdcall Cancel();"

	<virtual stdcall: hresult 69>
	^self invalidCall
!

clone
	"Answer the <ADODB_Recordset> result of invoking the Clone() method of the COM object.
	Default values are passed for all optional parameters."

	^self clone: -1!

clone: lockType
	"Answer the <ADODB_Recordset> result of invoking the Clone() method of the COM object."

	| answer |
	answer := ADODB_Recordset newPointer.
	self
		Clone: lockType
		ppvObject: answer.
	^answer asObject
!

Clone: lockType ppvObject: ppvObject
	"Private - Invoke the Clone() method of the COM object.

		HRESULT __stdcall Clone(
			[in, optional, defaultvalue(-1)] LockTypeEnum LockType,
			[out, retval] _Recordset** ppvObject);"

	<virtual stdcall: hresult 80 sdword ADODB_Recordset**>
	^self invalidCall
!

compareBookmarks: bookmark1 bookmark2: bookmark2
	"Answer the <SDWORD> result of invoking the CompareBookmarks() method of the COM object."

	| answer |
	answer := (SDWORD new).
	self
		CompareBookmarks: bookmark1 asVariant
		Bookmark2: bookmark2 asVariant
		pCompare: answer.
	^answer asObject
!

CompareBookmarks: bookmark1 Bookmark2: bookmark2 pCompare: pCompare
	"Private - Invoke the CompareBookmarks() method of the COM object.

		HRESULT __stdcall CompareBookmarks(
			[in] VARIANT Bookmark1,
			[in] VARIANT Bookmark2,
			[out, retval] CompareEnum* pCompare);"

	<virtual stdcall: hresult 79 variant variant sdword*>
	^self invalidCall
!

dataMember
	"Answer the <bstr> value of the 'DataMember' property of the receiver."

	| answer |
	answer := BSTR new.
	self get_DataMember: answer.
	^answer asObject
!

dataMember: pbstrDataMember
	"Set the 'DataMember' property of the receiver to the <bstr> value of the argument."

	self put_DataMember: pbstrDataMember
!

dataSource
	"Answer the <IUnknown> value of the 'DataSource' property of the receiver."

	| answer |
	answer := IUnknown newPointer.
	self get_DataSource: answer.
	^answer asObject
!

get_ActiveCommand: ppCmd
	"Private - Get the value of the 'ActiveCommand' property of the receiver.
				HRESULT __stdcall ActiveCommand(
			[out, retval] IDispatch** ppCmd);"

	<virtual stdcall: hresult 73 IDispatch**>
	^self invalidCall
!

get_DataMember: pbstrDataMember
	"Private - Get the value of the 'DataMember' property of the receiver.
				HRESULT __stdcall DataMember(
			[out, retval] BSTR* pbstrDataMember);"

	<virtual stdcall: hresult 77 bstr*>
	^self invalidCall
!

get_DataSource: ppunkDataSource
	"Private - Get the value of the 'DataSource' property of the receiver.
				HRESULT __stdcall DataSource(
			[out, retval] IUnknown** ppunkDataSource);"

	<virtual stdcall: hresult 70 IUnknown**>
	^self invalidCall
!

get_StayInSync: pbStayInSync
	"Private - Get the value of the 'StayInSync' property of the receiver.
				HRESULT __stdcall StayInSync(
			[out, retval] VARIANT_BOOL* pbStayInSync);"

	<virtual stdcall: hresult 75 varbool*>
	^self invalidCall
!

getString
	"Answer the <BSTR> result of invoking the GetString() method of the COM object.
	Default values are passed for all optional parameters."

	^self
		 getString: 2
		 numRows: -1
		 columnDelimeter: nil
		 rowDelimeter: nil
		 nullExpr: nil!

getString: stringFormat numRows: numRows columnDelimeter: columnDelimeter rowDelimeter: rowDelimeter nullExpr: nullExpr
	"Answer the <BSTR> result of invoking the GetString() method of the COM object."

	| answer |
	answer := BSTR new.
	self
		GetString: stringFormat
		NumRows: numRows
		ColumnDelimeter: columnDelimeter
		RowDelimeter: rowDelimeter
		NullExpr: nullExpr
		pRetString: answer.
	^answer asObject
!

GetString: stringFormat NumRows: numRows ColumnDelimeter: columnDelimeter RowDelimeter: rowDelimeter NullExpr: nullExpr pRetString: pRetString
	"Private - Invoke the GetString() method of the COM object.

		HRESULT __stdcall GetString(
			[in, optional, defaultvalue(2)] StringFormatEnum StringFormat,
			[in, optional, defaultvalue(-1)] long NumRows,
			[in, optional] BSTR ColumnDelimeter,
			[in, optional] BSTR RowDelimeter,
			[in, optional] BSTR NullExpr,
			[out, retval] BSTR* pRetString);"

	<virtual stdcall: hresult 76 sdword sdword bstr bstr bstr bstr*>
	^self invalidCall
!

put_DataMember: pbstrDataMember
	"Private - Set the value of the 'DataMember' property of the object wrapped by the 
	 receiver to the <bstr> argument, pbstrDataMember.
				HRESULT __stdcall DataMember(
			[in] BSTR pbstrDataMember);"

	<virtual stdcall: hresult 78 bstr>
	^self invalidCall
!

put_StayInSync: pbStayInSync
	"Private - Set the value of the 'StayInSync' property of the object wrapped by the 
	 receiver to the <varbool> argument, pbStayInSync.
				HRESULT __stdcall StayInSync(
			[in] VARIANT_BOOL pbStayInSync);"

	<virtual stdcall: hresult 74 varbool>
	^self invalidCall
!

putref_DataSource: ppunkDataSource
	"Private - Set the value of the 'DataSource' property of the object wrapped by the 
	 receiver to the <IUnknown*> argument, ppunkDataSource.
				HRESULT __stdcall DataSource(
			[in] IUnknown* ppunkDataSource);"

	<virtual stdcall: hresult 71 IUnknown*>
	^self invalidCall
!

resync
	"Invoke the Resync() method of the COM object.
	Default values are passed for all optional parameters."

	^self
		 Resync: 3
		 ResyncValues: 2!

Resync: affectRecords ResyncValues: resyncValues
	"Invoke the Resync() method of the COM object.

		HRESULT __stdcall Resync(
			[in, optional, defaultvalue(3)] AffectEnum AffectRecords,
			[in, optional, defaultvalue(2)] ResyncEnum ResyncValues);"

	<virtual stdcall: hresult 81 sdword sdword>
	^self invalidCall
!

setDataSource: ppunkDataSource
	"Set the 'DataSource' property of the receiver to the <IUnknown*> value of the argument."

	self putref_DataSource: ppunkDataSource
!

stayInSync
	"Answer the <varbool> value of the 'StayInSync' property of the receiver."

	| answer |
	answer := (VARIANT_BOOL new).
	self get_StayInSync: answer.
	^answer asObject
!

stayInSync: pbStayInSync
	"Set the 'StayInSync' property of the receiver to the <varbool> value of the argument."

	self put_StayInSync: pbStayInSync
! !
!ADODBRecordset20 categoriesFor: #_xSave!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #_xSave:PersistFormat:!**auto generated**!COM Interfaces-Recordset20!public! !
!ADODBRecordset20 categoriesFor: #activeCommand!**auto generated**!properties!public! !
!ADODBRecordset20 categoriesFor: #Cancel!**auto generated**!COM Interfaces-Recordset20!public! !
!ADODBRecordset20 categoriesFor: #clone!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #clone:!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #Clone:ppvObject:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #compareBookmarks:bookmark2:!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #CompareBookmarks:Bookmark2:pCompare:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #dataMember!**auto generated**!properties!public! !
!ADODBRecordset20 categoriesFor: #dataMember:!**auto generated**!properties!public! !
!ADODBRecordset20 categoriesFor: #dataSource!**auto generated**!properties!public! !
!ADODBRecordset20 categoriesFor: #get_ActiveCommand:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #get_DataMember:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #get_DataSource:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #get_StayInSync:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #getString!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #getString:numRows:columnDelimeter:rowDelimeter:nullExpr:!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #GetString:NumRows:ColumnDelimeter:RowDelimeter:NullExpr:pRetString:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #put_DataMember:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #put_StayInSync:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #putref_DataSource:!**auto generated**!COM Interfaces-Recordset20!private! !
!ADODBRecordset20 categoriesFor: #resync!**auto generated**!methods!public! !
!ADODBRecordset20 categoriesFor: #Resync:ResyncValues:!**auto generated**!COM Interfaces-Recordset20!public! !
!ADODBRecordset20 categoriesFor: #setDataSource:!**auto generated**!properties!public! !
!ADODBRecordset20 categoriesFor: #stayInSync!**auto generated**!properties!public! !
!ADODBRecordset20 categoriesFor: #stayInSync:!**auto generated**!properties!public! !

!ADODBRecordset20 class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'ADODB.Recordset20'
		ADODBRecordset20 defineTemplate"

	self
		defineFunction: #Cancel;
		defineFunction: #get_DataSource:
			argumentTypes: 'IUnknown**';
		defineFunction: #putref_DataSource:
			argumentTypes: 'IUnknown*';
		defineFunction: #_xSave:PersistFormat:
			argumentTypes: 'bstr sdword';
		defineFunction: #get_ActiveCommand:
			argumentTypes: 'IDispatch**';
		defineFunction: #put_StayInSync:
			argumentTypes: 'varbool';
		defineFunction: #get_StayInSync:
			argumentTypes: 'varbool*';
		defineFunction: #GetString:NumRows:ColumnDelimeter:RowDelimeter:NullExpr:pRetString:
			argumentTypes: 'sdword sdword bstr bstr bstr bstr*';
		defineFunction: #get_DataMember:
			argumentTypes: 'bstr*';
		defineFunction: #put_DataMember:
			argumentTypes: 'bstr';
		defineFunction: #CompareBookmarks:Bookmark2:pCompare:
			argumentTypes: 'variant variant sdword*';
		defineFunction: #Clone:ppvObject:
			argumentTypes: 'sdword ADODB_Recordset**';
		defineFunction: #Resync:ResyncValues:
			argumentTypes: 'sdword sdword'
! !
!ADODBRecordset20 class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

