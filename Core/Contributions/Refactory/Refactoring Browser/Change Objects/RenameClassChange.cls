"Filed out from Dolphin Smalltalk 2000 release 5.00"!

CompositeRefactoryChange subclass: #RenameClassChange
	instanceVariableNames: 'oldName newName'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RenameClassChange comment: ''!

RenameClassChange guid: (GUID fromString: '{A88EABA4-304F-4675-8B55-D3301BC1166D}')!

!RenameClassChange categoriesForClass!Refactory-Change Objects! !
!RenameClassChange methodsFor!

= aRenameClassChange 
	super = aRenameClassChange ifFalse: [^false].
	^oldName = aRenameClassChange oldName 
		and: [newName = aRenameClassChange newName]!

changeClass
	^Smalltalk at: oldName asSymbol ifAbsent: [Smalltalk at: newName asSymbol]!

executeNotifying: aBlock 
	| undos |
	#rbFix. "For Dolphin use the ClassBuilder"
	ClassBuilder renameClass: self changeClass to: newName.
	undos := changes collect: 
					[:each | 
					(each renameChangesForClass: oldName asSymbol to: newName asSymbol) 
						executeNotifying: aBlock].
	^(self copy)
		changes: undos reverse;
		rename: newName to: oldName;
		yourself!

flattenOnto: aCollection 
	aCollection 
		add: (self copy changes: (changes inject: OrderedCollection new
						into: 
							[:sum :each | 
							each flattenOnto: sum.
							sum]))!

newName
	^newName!

oldName
	^oldName!

rename: oldString to: newString 
	oldName := oldString.
	newName := newString.
	#rbFix "Set a default name?".
	name := 'Rename class ''', oldName, ''' to ''', newString, ''''!

renameChangesForClass: aClassName to: newClassName 
	| change |
	change := super renameChangesForClass: aClassName to: newClassName.
	oldName asSymbol == aClassName 
		ifTrue: [change rename: newClassName to: newName].
	^change! !
!RenameClassChange categoriesFor: #=!comparing!public! !
!RenameClassChange categoriesFor: #changeClass!accessing!public! !
!RenameClassChange categoriesFor: #executeNotifying:!*-unclassified!private! !
!RenameClassChange categoriesFor: #flattenOnto:!*-unclassified!private! !
!RenameClassChange categoriesFor: #newName!*-unclassified!private! !
!RenameClassChange categoriesFor: #oldName!*-unclassified!private! !
!RenameClassChange categoriesFor: #rename:to:!initialize/release!public! !
!RenameClassChange categoriesFor: #renameChangesForClass:to:!accessing!public! !

!RenameClassChange class methodsFor!

rename: oldString to: newString 
	^(self new)
		rename: oldString to: newString;
		yourself! !
!RenameClassChange class categoriesFor: #rename:to:!instance creation!public! !

