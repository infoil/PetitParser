"Filed out from Dolphin Smalltalk 7"!

PPDelegateParser subclass: #PPEndOfInputParser
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PPEndOfInputParser guid: (GUID fromString: '{d79174e5-5166-457d-8a34-f7b020bd2727}')!
PPEndOfInputParser comment: ''!
!PPEndOfInputParser categoriesForClass!Unclassified! !
!PPEndOfInputParser methodsFor!

end
	^ self!

parseOn: aStream
	| position result |
	position := aStream position.
	result := parser parseOn: aStream.
	(result isPetitFailure or: [ aStream atEnd ])
		ifTrue: [ ^ result ].
	result := PPFailure
		message: 'end of input expected'
		at: aStream position.
	aStream position: position.
	^ result! !
!PPEndOfInputParser categoriesFor: #end!operators!public! !
!PPEndOfInputParser categoriesFor: #parseOn:!parsing!public! !

