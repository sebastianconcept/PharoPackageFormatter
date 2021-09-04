# PharoPackageFormatter
Make all code in a Pharo package to be auto-formatted in one shot

### Install
```smalltalk
Metacello new
	baseline: 'PharoPackageFormatter';
	repository: 'github://sebastianconcept/PharoPackageFormatter';
	load.
```
### Usage Example

Apply it for all the packages of a project, in order to normalize its code formatting. For example [this PR](https://github.com/sebastianconcept/Mapless/pull/36) was created with:

```smalltalk
packages := { 'Mapless-Base-Core'. 
'Mapless-Mongo-Core'.
'Mapless-Mongo-Tests'.
'Mapless-Tests-Base'.
'Mapless-Benchmark-Core'.
'Mapless-Memory-Core'.
'Mapless-Memory-Tests'.
'Mapless-Postgres-Core'.
'Mapless-Postgres-Tests'.
'Mapless-Tests-Base'.
'BaselineOfMapless'.
}.

packages do: [ :each | PharoPackageFormatter formatPackageNamed: each ].
```
