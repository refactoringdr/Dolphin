"Filed out from Dolphin Smalltalk X6"!

Object subclass: #TreeNode
	instanceVariableNames: 'parent children object'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
TreeNode guid: (GUID fromString: '{87B4C4C7-026E-11D3-9FD7-00A0CC3E4A32}')!
TreeNode comment: 'TreeNode represents a node of a tree in a <TreeModel> hierarchy.

Instance Variables:
	parent	<TreeNode> which is the parent of this node in the tree.
	children	<OrderedCollection> of <TreeNode>s or nil, containing the children of this node.
	object	<Object> which is at this node position in the tree.



'!
!TreeNode categoriesForClass!MVP-Models-Support! !
!TreeNode methodsFor!

addChildNode: aTreeNode
	"Adds aTreeNode as a child of the receiver. Answer aTreeNode"

	(children := self children) add: aTreeNode.
	aTreeNode parent: self.
	^aTreeNode!

beChildless
	"Set the receiver to have no children."

	children := nil!

children
	"Answers an <sequencedCollection> of the child nodes of the receiver."

	^children ifNil: [self newChildCollection]!

children: anOrderedCollection
	children := anOrderedCollection!

getChildren
	"Private - Answer the receiver's children instance variable."

	^children!

newChildCollection
	^OrderedCollection new!

object
	"Answer the object associated with the receiver"

	^object!

object: anObject
	"Private - Set the object associated with the receiver"

	object := anObject!

parent
	"Answer the parent node of the receiver"

	^parent!

parent: aTreeNode
	"Private - Set the parent of the receiver to aTreeNode"

	parent := aTreeNode!

printOn: target
	"Append, to the <puttableStream>, target, a string whose characters are a 
	the same as those which would result from sending a #printString
	message to the receiver.
	N.B. This is really intended for development use. #displayOn: and #displayString
	are complementary methods for generating strings for presentation to an
	end-user."

	target
		basicPrint: self;
		nextPut: $(;
		print: object;
		nextPut: $)!

removeChildNode: aTreeNode
	"Removes aTreeNode as a child of the receiver. 
	Answer aTreeNode unless it is not an child of the receiver, in which 
	case, raise a suitable Exception."

	self removeChildNode: aTreeNode ifAbsent: [^self errorNotFound: aTreeNode].
	aTreeNode parent: nil.
	^aTreeNode





!

removeChildNode: aTreeNode ifAbsent: exceptionHandler
	"Remove aTreeNode from the receiver's children.  If several of the children are 
	equal to aTreeNode, only the first is removed. If no child is equal to aTreeNode, 
	answer the result of evaluating the <niladicValuable>, exceptionHandler. 
	Otherwise, answer aTreeNode."

	self children remove: aTreeNode ifAbsent: exceptionHandler.
	(children notNil and: [children isEmpty]) ifTrue: [
		"Fold child collection to nil if empty"
		children := nil].
	^aTreeNode





! !
!TreeNode categoriesFor: #addChildNode:!adding!public! !
!TreeNode categoriesFor: #beChildless!modes!public! !
!TreeNode categoriesFor: #children!accessing!public! !
!TreeNode categoriesFor: #children:!accessing!public! !
!TreeNode categoriesFor: #getChildren!accessing!private! !
!TreeNode categoriesFor: #newChildCollection!accessing!public! !
!TreeNode categoriesFor: #object!accessing!public! !
!TreeNode categoriesFor: #object:!accessing!private! !
!TreeNode categoriesFor: #parent!accessing!public! !
!TreeNode categoriesFor: #parent:!accessing!private! !
!TreeNode categoriesFor: #printOn:!printing!public! !
!TreeNode categoriesFor: #removeChildNode:!public!removing! !
!TreeNode categoriesFor: #removeChildNode:ifAbsent:!public!removing! !

!TreeNode class methodsFor!

for: anObject
	"Answer an instance of the receiver that is to represent anObject"

	^self new object: anObject; yourself! !
!TreeNode class categoriesFor: #for:!instance creation!public! !

