"Filed out from Dolphin Smalltalk 7"!

PPDelegateParser subclass: #PPMemoizedParser
	instanceVariableNames: 'stream buffer'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PPMemoizedParser guid: (GUID fromString: '{a6f51a6f-5cad-48e2-9055-57363cf1556f}')!
PPMemoizedParser comment: ''!
!PPMemoizedParser categoriesForClass!Unclassified! !
!PPMemoizedParser methodsFor!

memoized
	"Ther is no point in memoizing more than once."

	^ self!

parseOn: aStream
	| memento |
	stream == aStream
		ifFalse: [ self reset: aStream ].
	memento := (buffer at: stream position + 1)
		ifNil: [ buffer at: stream position + 1 put: PPMemento new ].
	memento position isNil
		ifTrue: [
			memento result: (stream size - stream position + 2 < memento count
				ifTrue: [ PPFailure message: 'overflow' at: stream position ]
				ifFalse: [ memento increment. parser parseOn: stream ]).
			memento position: stream position ]
		ifFalse: [ stream position: memento position ].
	^ memento result!

reset: aStream
	stream := aStream.
	buffer := Array new: aStream size + 1! !
!PPMemoizedParser categoriesFor: #memoized!operators!public! !
!PPMemoizedParser categoriesFor: #parseOn:!parsing!public! !
!PPMemoizedParser categoriesFor: #reset:!public! !

