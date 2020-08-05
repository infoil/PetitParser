"Filed out from Dolphin Smalltalk 7"!

PPAbstractParserTest subclass: #PPScriptingTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PPScriptingTest guid: (GUID fromString: '{517886e6-5709-4995-bd31-b52e702bd486}')!
PPScriptingTest comment: ''!
!PPScriptingTest categoriesForClass!Unclassified! !
!PPScriptingTest methodsFor!

testExpressionInterpreter
	self 
		assert: self expressionInterpreter
		parse: '2*(3+4)'
		to: 14!

testExpressionParser
	self
		assert: self expressionParser
		parse: '2*(3+4)'
		to: #($2 $* ($( ($3 $+ $4) $)))!

testSLassign
	
	self assert: self straightLineParser
		parse: 'abc:=1'
		to: #(#($a #($b $c) ':=' #(#(#($1 #()) #()) #())) #())!

testSLprint
	self 
		assert: self straightLineParser
		parse: 'print(3,4)'
		to: #(('print' $( ((($3 ()) ()) () (($, ((($4 ()) ()) ())))) $)) ())! !
!PPScriptingTest categoriesFor: #testExpressionInterpreter!public!tests! !
!PPScriptingTest categoriesFor: #testExpressionParser!public!tests! !
!PPScriptingTest categoriesFor: #testSLassign!public!tests! !
!PPScriptingTest categoriesFor: #testSLprint!public!tests! !

