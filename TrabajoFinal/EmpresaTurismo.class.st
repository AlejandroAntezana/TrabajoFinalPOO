Class {
	#name : #EmpresaTurismo,
	#superclass : #Object,
	#instVars : [
		'colClientes',
		'colViajes'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
EmpresaTurismo class >> create [
|nuevaEmpresa|
nuevaEmpresa := self new.
nuevaEmpresa initialize.
^nuevaEmpresa .
]

{ #category : #initialization }
EmpresaTurismo >> initialize [ 
	colClientes := OrderedCollection new.
	colViajes := OrderedCollection new.
]
