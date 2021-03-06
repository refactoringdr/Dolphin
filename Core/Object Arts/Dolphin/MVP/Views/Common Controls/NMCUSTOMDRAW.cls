"Filed out from Dolphin Smalltalk X6.1"!

NMHDR subclass: #NMCUSTOMDRAW
	instanceVariableNames: 'item view canvas font'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
NMCUSTOMDRAW guid: (GUID fromString: '{1123E900-72B4-46D6-81B5-8122B9E2393F}')!
NMCUSTOMDRAW comment: 'NMCUSTOMDRAW is an <ExternalStructure> class to represent the Win32 structure of the same name.

NMCUSTOMDRAW structures are sent as parameter blocks along with certain WM_NOTIFY messages from Windows common controls such as the <ListView> and <TreeView> to request custom draw information for individual items (and optionally sub-items).

All the fields in this structure are read-only. Specialized sub-structures provide fields which can be written to in order to pass custom draw settings back to the control (for example the foreground and background text colours). The DC associated with this structure can also be updated by changing the font, and so forth.

'!
!NMCUSTOMDRAW categoriesForClass!External-Data-Structured-Win32! !
!NMCUSTOMDRAW methodsFor!

applyFont
	"Private - Apply the new font (if changed) to the custom draw DC and answer whether
	a new font was indeed selected."

	^font notNil and: [
		(font basicHandle ~= self canvas font basicHandle) and: [
			#todo "It's definitely not a good idea to delete old font here (the default font will
			 probably get deleted, but we rely on the fact that finalization happens in
			 the background so that the font we supply in place is not deleted until
			 after the drawing cycle is complete. This seems dangerous.".
			self canvas font: font.
			true]]!

backcolor
	"Answer the background <Color>."

	^self canvas backcolor!

backcolor: aColor
	"Sets the background <Color>."

	self canvas backcolor: aColor!

boundingRectangle
	"Answer the <Rectangle> within which the item is being displayed (in the client co-ordinates
	of the view."

	^self rc asRectangle!

canvas
	"Answer the <Canvas> associated with the receiver (useful for custom modifications,
	but private because care is needed to avoid leaks)."

	canvas isNil ifTrue: [canvas := Canvas withNonOwnedDC: self hdc].
	^canvas!

dwDrawStage
	"Answer the receiver's dwDrawStage field as a Smalltalk object."

	^bytes dwordAtOffset: ##(self offsetOf: #dwDrawStage)!

dwItemSpec
	"Answer the receiver's dwItemSpec field as a Smalltalk object."

	^bytes dwordAtOffset: ##(self offsetOf: #dwItemSpec)!

evaluateDrawBlock: customDrawBlock
	"Private - Evaluate the <monadicValuable>, customDrawBlock, and answer the appropriate instruction
	 for a common control to complete the draw operation (or skip it if total control is taken)."

	^(customDrawBlock value: self) == true 
		ifTrue: [CDRF_SKIPDEFAULT]
		ifFalse: [
			self applyFont
				ifTrue: [CDRF_NEWFONT]
				ifFalse: [CDRF_DODEFAULT]]
!

font
	"Answer the character font."
	
	font isNil ifTrue: [font := self canvas font].
	^font!

font: aFont
	"Set the character font.
	Implementation Note: Don't update the DC with the new font yet."

	font := aFont!

forecolor
	"Answer the foreground text colour."

	^self canvas forecolor!

forecolor: aColor
	"Sets the foreground text <Color>."

	self canvas forecolor: aColor!

hasFocus
	"Answer whether the item being drawn has focus."

	^self uItemState allMask: CDIS_FOCUS!

hdc
	"Answer the receiver's hdc field as a Smalltalk object."

	^(bytes uintPtrAtOffset: ##(self offsetOf: #hdc)) asExternalHandle!

isChecked
	"Answer whether the item being draw is 'checked' (i.e. in a list with checkboxes it is ticked)."

	^self uItemState allMask: CDIS_CHECKED!

isDefault
	"Answer whether the item being drawn is the default."

	^self uItemState allMask: CDIS_DEFAULT!

isDisabled
	"Answer whether the item being draw is disabled."

	^self uItemState allMask: CDIS_DISABLED!

isGrayed
	"Answer whether the item being draw is greyed out."

	^self uItemState allMask: CDIS_GRAYED!

isHot
	"Answer whether the item being drawn is hot (i.e. under the cursor 
	when hot tracking is enabled)."

	^self uItemState allMask: CDIS_HOT!

isIndeterminate
	"Answer whether the item being drawn is an indeterminate state."

	^self uItemState allMask: CDIS_INDETERMINATE  !

isMarked
	"Answer whether the item being drawn is marked (whatever that means)."

	^self uItemState allMask: CDIS_MARKED!

isSelected
	"Answer whether the item being draw is selected."

	^self uItemState allMask: CDIS_SELECTED!

item
	"Answer the object from the view's model that is being drawn (the item,
	which is pre-cached)."

	^item!

item: anObject
	"Private - Private -Record the item being drawn."

	item := anObject!

itemHandle
	"Private - Answer the 'handle' of the receiver's item."

	^self subclassResponsibility!

lParam
	"Answer the receiver's lParam field as a Smalltalk object."

	^bytes uintPtrAtOffset: ##(self offsetOf: #lParam)!

rc
	"Answer the receiver's rc field as a Smalltalk object."

	^RECT fromAddress: bytes yourAddress + ##(self offsetOf: #rc)!

uItemState
	"Answer the receiver's uItemState field as a Smalltalk object."

	^bytes dwordAtOffset: ##(self offsetOf: #uItemState)!

view
	"Answer the sub-instance of <IconListAbstract> for which this is a <customDrawContext>."

	^view!

view: anIconListAbstract
	"Private -"
	view := anIconListAbstract! !
!NMCUSTOMDRAW categoriesFor: #applyFont!operations!private! !
!NMCUSTOMDRAW categoriesFor: #backcolor!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #backcolor:!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #boundingRectangle!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #canvas!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #dwDrawStage!**compiled accessors**!public! !
!NMCUSTOMDRAW categoriesFor: #dwItemSpec!**compiled accessors**!public! !
!NMCUSTOMDRAW categoriesFor: #evaluateDrawBlock:!operations!public! !
!NMCUSTOMDRAW categoriesFor: #font!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #font:!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #forecolor!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #forecolor:!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #hasFocus!public!testing! !
!NMCUSTOMDRAW categoriesFor: #hdc!**compiled accessors**!public! !
!NMCUSTOMDRAW categoriesFor: #isChecked!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isDefault!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isDisabled!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isGrayed!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isHot!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isIndeterminate!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isMarked!public!testing! !
!NMCUSTOMDRAW categoriesFor: #isSelected!public!testing! !
!NMCUSTOMDRAW categoriesFor: #item!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #item:!accessing!private! !
!NMCUSTOMDRAW categoriesFor: #itemHandle!accessing!private! !
!NMCUSTOMDRAW categoriesFor: #lParam!**compiled accessors**!public! !
!NMCUSTOMDRAW categoriesFor: #rc!**compiled accessors**!public! !
!NMCUSTOMDRAW categoriesFor: #uItemState!**compiled accessors**!public! !
!NMCUSTOMDRAW categoriesFor: #view!accessing!public! !
!NMCUSTOMDRAW categoriesFor: #view:!accessing!private! !

NMCUSTOMDRAW methodProtocol: #customDrawContext attributes: #(#readOnly) selectors: #(#backcolor #backcolor: #boundingRectangle #canvas #font #font: #forecolor #forecolor: #hasFocus #isChecked #isDefault #isDisabled #isGrayed #isHot #isIndeterminate #isSelected #view)!

!NMCUSTOMDRAW class methodsFor!

defineFields
	"Define the structure template for Win32 NMCUSTOMDRAW structure.
		self compileDefinition
	"

	super defineFields.
	self
		defineField: #dwDrawStage type: DWORDField readOnly;
		defineField: #hdc type: HANDLEField readOnly;
		defineField: #rc type: (StructureField type: RECT) beReadOnly;
		defineField: #dwItemSpec type: DWORDField readOnly;
		defineField: #uItemState type: DWORDField readOnly;
		defineField: #lParam type: UINT_PTRField readOnly! !
!NMCUSTOMDRAW class categoriesFor: #defineFields!initializing!public! !

