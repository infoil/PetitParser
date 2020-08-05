"Filed out from Dolphin Smalltalk 7"!

PPPredicateParser subclass: #PPPredicateObjectParser
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PPPredicateObjectParser guid: (GUID fromString: '{4383dc81-e425-4bf7-b457-515d8f306cd4}')!
PPPredicateObjectParser comment: ''!
!PPPredicateObjectParser categoriesForClass!Unclassified! !
!PPPredicateObjectParser methodsFor!

initializeOn: aBlock message: aString negated: aNegatedBlock message: aNegatedString
	predicate := aBlock.
	predicateMessage := aString.
	negated := aNegatedBlock.
	negatedMessage := aNegatedString!

negate
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ self class 
		on: negated message: negatedMessage 
		negated: predicate message: predicateMessage!

parseOn: aStream
	^ (aStream atEnd not and: [ predicate value: aStream uncheckedPeek ])
		ifFalse: [ PPFailure message: predicateMessage at: aStream position ]
		ifTrue: [ aStream next ]! !
!PPPredicateObjectParser categoriesFor: #initializeOn:message:negated:message:!initialization!public! !
!PPPredicateObjectParser categoriesFor: #negate!operators!public! !
!PPPredicateObjectParser categoriesFor: #parseOn:!parsing!public! !

!PPPredicateObjectParser class methodsFor!

any
	^ self
		on: [ :each | true ] message: 'input expected'
		negated: [ :each | false ] message: 'no input expected'!

anyExceptAnyOf: aCollection
	^ self
		on: [ :each | (aCollection includes: each) not ] message: 'any except ' , aCollection printString , ' expected'
		negated: [ :each | aCollection includes: each ] message: aCollection printString ,  ' not expected'!

anyOf: aCollection
	^ self
		on: [ :each | aCollection includes: each ] message: 'any of ' , aCollection printString , ' expected'
		negated: [ :each | (aCollection includes: each) not ] message: 'none of ' , aCollection printString ,  'expected'!

between: min and: max
	^ self
		on: [ :each | each >= min and: [ each <= max ] ] message: min printString , '..' , max printString , ' expected'
		negated: [ :each | each < min or: [ each > max ] ] message: min printString , '..' , max printString , ' not expected'!

blank
	^ self chars: (String with: Character space with: Character tab) message: 'blank expected'!

char: aCharacter
	^ self expect: aCharacter message: (String with: $" with: aCharacter with: $") , ' expected'!

char: aCharacter message: aString
	^ self expect: aCharacter message: aString!

control
	^ self chars: ((0 to: 31) collect: [ :each | Character value: each ]) message: 'control character expected'!

cr
	^ self char: Character cr message: 'carriage return expected'!

expect: anObject
	^ self expect: anObject message: anObject printString , ' expected'!

expect: anObject message: aString
	^ self 
		on: [ :each | each = anObject ] message: aString
		negated: [ :each | each ~= anObject ] message: 'no ' , aString!

lf
	^ self char: Character lf!

newline
	^ self chars: (String with: Character cr with: Character lf) message: 'newline expected'!

on: aBlock message: aString
	^ self on: aBlock message: aString negated: [ :each | (aBlock value: each) not ] message: 'no ' , aString!

on: aBlock message: aString negated: aNegatedBlock message: aNegatedString
	^ self new initializeOn: aBlock message: aString negated: aNegatedBlock message: aNegatedString!

punctuation
	^ self chars: '.,"''?!!;:#$%&()*+-/<>=@[]\^:=#()|~' message: 'punctuation expected'!

tab
	^ self char: Character tab message: 'tab expected'! !
!PPPredicateObjectParser class categoriesFor: #any!factory-objects!public! !
!PPPredicateObjectParser class categoriesFor: #anyExceptAnyOf:!factory-objects!public! !
!PPPredicateObjectParser class categoriesFor: #anyOf:!factory-objects!public! !
!PPPredicateObjectParser class categoriesFor: #between:and:!factory-objects!public! !
!PPPredicateObjectParser class categoriesFor: #blank!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #char:!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #char:message:!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #control!*petitregex-chars!public! !
!PPPredicateObjectParser class categoriesFor: #cr!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #expect:!factory-objects!public! !
!PPPredicateObjectParser class categoriesFor: #expect:message:!factory-objects!public! !
!PPPredicateObjectParser class categoriesFor: #lf!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #newline!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #on:message:!instance creation!public! !
!PPPredicateObjectParser class categoriesFor: #on:message:negated:message:!instance creation!public! !
!PPPredicateObjectParser class categoriesFor: #punctuation!factory-chars!public! !
!PPPredicateObjectParser class categoriesFor: #tab!factory-chars!public! !

