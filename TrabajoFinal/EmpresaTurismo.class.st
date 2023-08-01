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

{ #category : #'as yet unclassified' }
EmpresaTurismo >> buscarViajesDisponiblesFecha1: fecha1 Fecha2: fecha2 [

	| viajes |
	viajes := ''.
	colViajes do: [ :viaje | 
		viaje verificarAltaDeViaje ifTrue: [ 
			[ viaje verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 ] 
				ifTrue: [ viajes := viajes , viaje toString ] ] ]
]

{ #category : #initialization }
EmpresaTurismo >> initialize [ 
	colClientes := OrderedCollection new.
	colViajes := OrderedCollection new.
]
