Class {
	#name : #BaselineOfPharoPackageFormatter,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoPackageFormatter
}

{ #category : #baselines }
BaselineOfPharoPackageFormatter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self setUpPackages: spec.
			spec
				group: 'Formatter' with: #('PharoPackageFormatter');
				group: 'default' with: #('Formatter') ]
]

{ #category : #baselines }
BaselineOfPharoPackageFormatter >> setUpPackages: spec [
	spec package: 'PharoPackageFormatter'
]
