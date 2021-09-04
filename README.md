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

Apply it for all the packages of a project, for example, [Mapless](https://github.com/sebastianconcept/Mapless) here:

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
