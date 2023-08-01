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

{ #category : #propios }
EmpresaTurismo >> buscarCliente: dniCliente [

	| unCliente |
	unCliente := colClientes detect: [ :cliente | 
		             cliente dni = dniCliente ].

	^ unCliente
]

{ #category : #propios }
EmpresaTurismo >> buscarViaje: nombreViaje [

	| unViaje |
	unViaje := colViajes detect: [ :viaje | viaje nombre = nombreViaje ].

	^ unViaje
]

{ #category : #propios }
EmpresaTurismo >> buscarViajesDisponiblesFecha1: fecha1 Fecha2: fecha2 [

	| viajes |
	viajes := ''.
	colViajes do: [ :viaje | 
		viaje verificarAltaDeViaje ifTrue: [ 
			[ viaje verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 ] 
				ifTrue: [ viajes := viajes , viaje toString ] ] ]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> inicioDelDia [

	| colClientesRecordatorio |
	colClientesRecordatorio := OrderedCollection new.
	colClientesRecordatorio := colClientes select: [ :cliente | 
		                           cliente controlarVencimiento ]
]

{ #category : #initialization }
EmpresaTurismo >> initialize [ 
	colClientes := OrderedCollection new.
	colViajes := OrderedCollection new.
]
