"Filed out from Dolphin Smalltalk X6.2"!

StaticView subclass: #StaticText
	instanceVariableNames: ''
	classVariableNames: 'AlignmentMap'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StaticText guid: (GUID fromString: '{87B4C740-026E-11D3-9FD7-00A0CC3E4A32}')!
StaticText comment: 'StaticText is a <valueView> class for a Window STATIC control for displaying text in one of a number of text styles. The <valueModel> associated with a StaticText must always yield a <readableString> value when mapped through the installed type converter. A StaticText will normally be used in conjunction with a <TextPresenter>. The alignment of the text (and therefore the style of the underlying Windows control) can be specified using the alignment aspect which can assume of of the following values: (#left, #center, #right, #leftNoWrap, #simple).

Class Variables:
	AlignmentMap	<LookupTable> of <Symbol> alignment specifiers to Windows styles.

'!
!StaticText categoriesForClass!MVP-Views! !
!StaticText methodsFor!

alignment
	"Answer a symbolic text alignment for the receiver's current mode."

	| typeFlags |
	typeFlags := self baseStyle bitAnd: SS_TYPEMASK.
	^AlignmentMap keyAtValue: typeFlags ifAbsent: [#left]!

alignment: aSymbol
	"Sets the text alignment to the symbolic aligment name, aSymbol."

	self setAlignment: (AlignmentMap at: aSymbol)	!

beCenterAligned
	"Sets the receiver into center aligned mode"

	self setAlignment: SS_CENTER!

beLeftAligned
	"Sets the receiver into left aligned mode"

	self setAlignment: SS_LEFT!

beNoWordWrap
	"Sets the receiver into left aligned no word wrap mode"

	self setAlignment: SS_LEFTNOWORDWRAP!

beRightAligned
	"Sets the receiver into right aligned mode"

	self setAlignment: SS_RIGHT!

calculateExtent: aLayoutContext 
	"Private - Calculate an extent for the receiver that would allow it to display all the text
	that it currently contains."

	"Implementation Note: Unless word-wrap is disabled, the current width is taken into account.
	We then calculate the height required to draw the receiver's text in the receiver's current
	font within that width."

	| canvas extent |
	canvas := self canvas.
	canvas font: self actualFont.
	extent := self isSingleLine 
				ifTrue: 
					[| text |
					text := self text.
					self alignment == #simple ifFalse: [text copyWithout: $&].
					canvas textExtent: text]
				ifFalse: 
					[canvas 
						textExtent: self text
						width: (aLayoutContext clientRectangleOf: self) width
						alignment: self alignment].
	canvas free.

	"Now adjust required client extent to window extent"
	^self calcExtentFromClientExtent: extent!

clear
	"Clears the contents of the receiver"

	self text: ''!

displayValue
	"Private - Answer the displayed contents, the text, of the receiver"

	^self text!

displayValue: anObject
	"Private - Set the displayable contents, the text, of the receiver to the
	displayString of anObject"

	| newText |
	newText := anObject displayString.
	self displayValue = newText ifFalse: [
		"If the text has changed then set the new text for anObject"
		self text: newText ]!

getAlignment
	"Private - Answers the text alignment, one of SS_LEFT, SS_CENTER, SS_RIGHT"

	^self baseStyleAllMask: SS_TYPEMASK.	!

initialize
	"Private - Initialise the receiver."

	super initialize.
	self beLeftAligned.
!

isSingleLine
	| align |
	align := self alignment.
	^align == #leftNoWrap or: [align == #simple]!

refreshContents
	"The model held by the receiver has probably been changed so refresh 
	he receiver contents. Overridden here since StaticText and subclasses
	are allowed to have no model. This is for efficiency, to avoid having to 
	maintain two copies of possibly large text (one in Windows, one in Smalltalk)"

	self model notNil ifTrue: [ super refreshContents ]!

setAlignment: anInteger
	"Private - Sets the text alignment to anInteger, one of SS_LEFT, 
	SS_CENTER, SS_RIGHT, etc."

	self baseStyle: anInteger maskedBy: SS_TYPEMASK	!

value
	"Answer the value of the receiver. Overridden here and in TextEdit since
	StaticText can potentially have no (nil) model. This method accesses the 
	receiver's window directly via #displayValue."

	^self typeconverter convertFromRightToLeft: self displayValue!

value: anObject
	"Set the value of the receiver to anObject. Overridden here and in TextEdit
	since StaticText can potentially have no (nil) model. This method accesses the 
	receiver's window directly via #displayValue:."

	self displayValue: (self typeconverter convertFromLeftToRight: anObject)! !
!StaticText categoriesFor: #alignment!accessing!public! !
!StaticText categoriesFor: #alignment:!accessing!public! !
!StaticText categoriesFor: #beCenterAligned!accessing!public! !
!StaticText categoriesFor: #beLeftAligned!accessing!public! !
!StaticText categoriesFor: #beNoWordWrap!accessing!public! !
!StaticText categoriesFor: #beRightAligned!accessing!public! !
!StaticText categoriesFor: #calculateExtent:!geometry!private! !
!StaticText categoriesFor: #clear!operations!public! !
!StaticText categoriesFor: #displayValue!private!updating! !
!StaticText categoriesFor: #displayValue:!private!updating! !
!StaticText categoriesFor: #getAlignment!accessing!private! !
!StaticText categoriesFor: #initialize!initializing!private! !
!StaticText categoriesFor: #isSingleLine!private!testing! !
!StaticText categoriesFor: #refreshContents!public!updating! !
!StaticText categoriesFor: #setAlignment:!accessing!private! !
!StaticText categoriesFor: #value!accessing!public! !
!StaticText categoriesFor: #value:!accessing!public! !

!StaticText class methodsFor!

icon
	"Answers an Icon that can be used to represent this class"

	^##(self) defaultIcon!

initialize
	"Private - Initialize the receiver's class variables.
		StaticText initialize
	"

	AlignmentMap := (LookupTable new: 5)
		at: #left put: SS_LEFT;
		at: #right put: SS_RIGHT;
		at: #center put: SS_CENTER;
		at: #leftNoWrap put: SS_LEFTNOWORDWRAP;
		at: #simple put: SS_SIMPLE;
		shrink; yourself
		! !
!StaticText class categoriesFor: #icon!constants!public! !
!StaticText class categoriesFor: #initialize!development!initializing!private! !

