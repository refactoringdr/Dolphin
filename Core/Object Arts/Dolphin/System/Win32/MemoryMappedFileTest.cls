"Filed out from Dolphin Smalltalk X6.1"!

TestCase subclass: #MemoryMappedFileTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
MemoryMappedFileTest guid: (GUID fromString: '{C5E2483C-650A-4155-A15C-2C4A79201F0C}')!
MemoryMappedFileTest comment: ''!
!MemoryMappedFileTest categoriesForClass!Kernel-Objects! !
!MemoryMappedFileTest methodsFor!

testDoubleArray
	| data array file fname mmf view array2 f |
	data := Random new next: 10000.
	array := DOUBLEArray withAll: data.
	file := File temporary.
	file write: array bytes.
	fname := file name.
	file close.
	file := File open: fname.
	mmf := MemoryMappedFile onFile: file.
	view := mmf mapView.
	array2 := DOUBLEArray fromAddress: view length: 10000.
	self assert: array2 = array.
	"Write through the view"
	array2 at: 1 put: 123.45.
	mmf free.
	view free.
	file close.
	self should: [array2 last] raise: GPFault.
	file := File open: fname.
	f := Float new.
	file read: f.
	self assert: f = 123.45.
	file close.
	"If this fails then one or other thing is holding the file open"
	File delete: fname!

testMaximumSize
	| array file fname mmf view count |
	fname := File temporaryFilename.
	mmf := MemoryMappedFile open: fname.
	"Choose size to be exactly one allocation block so that read/write off the end will cause a fault"
	count := 64 * 1024 / 4.
	mmf maximumSize: 4 * count.
	view := mmf mapView.
	array := DWORDArray fromAddress: view length: count.
	1 to: count do: [:each | array at: each put: each].
	self assert: array asArray = (1 to: count).
	"Now try and read/write off the end - it seems there is some slush (uh oh) but we can make it GPF by writing far enough away"
	array basicLength: count * 2.
	self should: [array at: count + 1] raise: GPFault.
	self should: [#(1 1024 2048 2049) do: [:each | array at: count + each put: count + each]]
		raise: GPFault.
	mmf free.
	view free.
	self should: [array at: count] raise: GPFault.
	(MemoryManager current)
		collectGarbage;
		administerLastRites.
	file := FileStream read: fname text: false.
	self assert: file size = (count * 4).
	array := (1 to: count) collect: [:each | file nextDWORD].
	self assert: array = (1 to: count).
	file close.
	"If this fails then one or other thing is holding the file open"
	File delete: fname!

testReadOnly
	| fname file mmf view data |
	fname := File temporaryFilename.
	data := 'Blah blah'.
	file := FileStream write: fname.
	file nextPutAll: data.
	file close.
	mmf := MemoryMappedFile open: fname mode: #read.
	view := mmf mapView.
	self assert: (view copyFrom: 1 to: data size) = data asByteArray.
	"Memory is read-only"
	self should: [view at: 1 put: 0] raise: GPFault.
	view free.
	mmf free.
	File delete: fname! !
!MemoryMappedFileTest categoriesFor: #testDoubleArray!public! !
!MemoryMappedFileTest categoriesFor: #testMaximumSize!public! !
!MemoryMappedFileTest categoriesFor: #testReadOnly!public! !

