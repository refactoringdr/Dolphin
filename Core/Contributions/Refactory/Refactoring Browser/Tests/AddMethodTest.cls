"Filed out from Dolphin Smalltalk 2000 release 4.01"!

RefactoringTest subclass: #AddMethodTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AddMethodTest comment: ''!

AddMethodTest guid: (GUID fromString: '{6D550761-F858-4C04-BE63-5475FE34219A}')!

!AddMethodTest categoriesForClass!Refactory-Testing! !
!AddMethodTest methodsFor!

setUp
	super setUp.
	model := Compiler evaluate: (self readFile: 'AbstractVariableTestData.st')!

testAddMethod
	| refactoring |
	refactoring := AddMethodRefactoring 
				addMethod: 'printString1 ^super printString'
				toClass: BasicLintRuleTest
				inProtocols: #(#accessing).
	self executeRefactoring: refactoring.
	self 
		assert: ((refactoring model classNamed: #BasicLintRuleTest) 
				parseTreeFor: #printString1) 
					= (RBParser parseMethod: 'printString1 ^super printString')!

testBadMethod
	self shouldFail: (AddMethodRefactoring 
				addMethod: 'asdf ^super ^printString'
				toClass: BasicLintRuleTest
				inProtocols: #(#accessing))!

testExistingSelector
	self shouldFail: (AddMethodRefactoring 
				addMethod: 'printString ^super printString'
				toClass: BasicLintRuleTest
				inProtocols: #(#accessing))!

testModelAddMethod
	| refactoring class |
	class := model metaclassNamed: #Bar.
	refactoring := AddMethodRefactoring 
				model: model
				addMethod: 'printString1 ^super printString'
				toClass: class
				inProtocols: #(#accessing).
	self executeRefactoring: refactoring.
	self assert: (class parseTreeFor: #printString1) 
				= (RBParser parseMethod: 'printString1 ^super printString')!

testModelExistingSelector
	| refactoring |
	refactoring := AddMethodRefactoring 
				model: model
				addMethod: 'classVarName1 ^super printString'
				toClass: (model classNamed: #Bar)
				inProtocols: #(#accessing).
	self shouldFail: refactoring!

testModelInheritedSelector
	| refactoring |
	refactoring := AddMethodRefactoring 
				model: model
				addMethod: 'printString ^super printString'
				toClass: (model classNamed: #Bar)
				inProtocols: #(#accessing).
	self shouldFail: refactoring! !
!AddMethodTest categoriesFor: #setUp!public!set up! !
!AddMethodTest categoriesFor: #testAddMethod!public!tests! !
!AddMethodTest categoriesFor: #testBadMethod!failure tests!public! !
!AddMethodTest categoriesFor: #testExistingSelector!failure tests!public! !
!AddMethodTest categoriesFor: #testModelAddMethod!public!tests! !
!AddMethodTest categoriesFor: #testModelExistingSelector!failure tests!public! !
!AddMethodTest categoriesFor: #testModelInheritedSelector!failure tests!public! !

