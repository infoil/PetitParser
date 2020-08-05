"Filed out from Dolphin Smalltalk 7"!

PPDelegateParser subclass: #PPNotParser
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PPNotParser guid: (GUID fromString: '{e573ee23-5fd9-4b70-951c-5141c88afc69}')!
PPNotParser comment: ''!
!PPNotParser categoriesForClass!Unclassified! !
!PPNotParser methodsFor!

firstSets: aFirstDictionary into: aSet!

isFirstSetTerminal
	^ true!

parseOn: aStream
	| element position |
	position := aStream position.
	element := parser parseOn: aStream.
	aStream position: position.
	^ element isPetitFailure
		ifFalse: [ PPFailure message: '' at: aStream position ]! !
!PPNotParser categoriesFor: #firstSets:into:!*PetitAnalyzer!public! !
!PPNotParser categoriesFor: #isFirstSetTerminal!*PetitAnalyzer!public! !
!PPNotParser categoriesFor: #parseOn:!parsing!public! !

