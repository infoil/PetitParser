"Filed out from Dolphin Smalltalk 7"!

PPLimitedRepeatingParser subclass: #PPGreedyRepeatingParser
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PPGreedyRepeatingParser guid: (GUID fromString: '{2e1bdc75-5890-4a98-a176-2f19cf730da3}')!
PPGreedyRepeatingParser comment: ''!
!PPGreedyRepeatingParser categoriesForClass!Unclassified! !
!PPGreedyRepeatingParser methodsFor!

parseOn: aStream
	| start element elements positions |
	start := aStream position.
	elements := OrderedCollection new.
	[ elements size < min ] whileTrue: [ 
		(element := parser parseOn: aStream) isPetitFailure ifTrue: [ 
			aStream position: start.
			^ element ].
		elements addLast: element ].
	positions := OrderedCollection with: aStream position.
	[ elements size < max and: [ (element := parser parseOn: aStream) isPetitFailure not ] ] whileTrue: [
		elements addLast: element.
		positions addLast: aStream position ].
	[ positions isEmpty ] whileFalse: [
		aStream position: positions last.
		element := limit parseOn: aStream.
		element isPetitFailure ifFalse: [
			aStream position: positions last.
			^ elements asArray ].
		elements isEmpty ifTrue: [
			aStream position: start.
			^ element ].
		elements removeLast.
		positions removeLast ].
	aStream position: start.
	^ PPFailure message: 'overflow' at: start! !
!PPGreedyRepeatingParser categoriesFor: #parseOn:!parsing!public! !

