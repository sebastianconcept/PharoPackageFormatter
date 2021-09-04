Class {
	#name : #PharoPackageFormatter,
	#superclass : #Object,
	#category : #PharoPackageFormatter
}

{ #category : #actions }
PharoPackageFormatter class >> formatClass: aClass [
	aClass methodDict
		keysAndValuesDo: [ :selector :compiledMethod | 
			self
				formatMethodCode: compiledMethod sourceCode
				with: compiledMethod protocol
				in: aClass ]
]

{ #category : #actions }
PharoPackageFormatter class >> formatClassesIn: aPackage [
	^ aPackage classes do: [ :class | self formatClass: class ]
]

{ #category : #actions }
PharoPackageFormatter class >> formatExtensions: extensionDictionary [
	| class compiledMethod |
	extensionDictionary
		keysAndValuesDo: [ :symbol :selectors | 
			selectors
				do: [ :selector | 
					class := self class environment at: symbol.
					compiledMethod := class methodDict at: selector.
					self
						formatMethodCode: compiledMethod sourceCode
						with: compiledMethod protocol
						in: class ] ]
]

{ #category : #actions }
PharoPackageFormatter class >> formatExtensionsIn: aPackage [
	self formatExtensions: aPackage classExtensionSelectors.
	self formatExtensions: aPackage metaclassExtensionSelectors
]

{ #category : #actions }
PharoPackageFormatter class >> formatMetaclassesIn: aPackage [
	^ aPackage classes do: [ :class | self formatClass: class class ]
]

{ #category : #actions }
PharoPackageFormatter class >> formatMethodCode: source with: protocol in: aClass [
	| tree formatted |
	tree := RBParser parseMethod: source onError: [ :msg :pos | ^ self ].
	formatted := tree formattedCode.
	formatted = source
		ifTrue: [ ^ self ].
	aClass compile: formatted classified: protocol
]

{ #category : #actions }
PharoPackageFormatter class >> formatPackageNamed: aString [
	| package |
	package := self getPackageNamed: aString.
	self formatClassesIn: package.
	self formatMetaclassesIn: package.
	self formatExtensionsIn: package
]

{ #category : #accessing }
PharoPackageFormatter class >> getPackageNamed: aString [
	^ RPackageOrganizer default packageNamed: aString
]
