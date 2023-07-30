Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'apellido',
		'dni',
		'ciudadResidencia',
		'telefono',
		'mail',
		'preferencias',
		'colContratos'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
Cliente class >> crearCon: apellido dni: undni ciudadResidencia: unaCiudad mail: unMail telefono: unTel preferencias: lasPref [

	| nuevoCliente |
	nuevoCliente := self new.
	nuevoCliente
		inicializar: apellido
		dni: undni
		ciudadResidencia: unaCiudad
		mail: unMail
		telefono: unTel
		preferencias: lasPref .
	^nuevoCliente
]

{ #category : #accessing }
Cliente >> agregarContrato: unContrato [
 colContratos add: unContrato .
]

{ #category : #accessing }
Cliente >> apellido [

	^ apellido
]

{ #category : #accessing }
Cliente >> apellido: anObject [

	apellido := anObject
]

{ #category : #accessing }
Cliente >> ciudadResidencia [

	^ ciudadResidencia
]

{ #category : #accessing }
Cliente >> ciudadResidencia: anObject [

	ciudadResidencia := anObject
]

{ #category : #accessing }
Cliente >> dni [

	^ dni
]

{ #category : #accessing }
Cliente >> dni: anObject [

	dni := anObject
]

{ #category : #initialization }
Cliente >> inicializar: unApellido dni: undni ciudadResidencia: unaCiudad mail: unMail telefono: unTel preferencias: lasPref [

	apellido := unApellido.
	dni := undni.
	ciudadResidencia := unaCiudad.
	mail := unMail.
	telefono := unTel.
	colContratos := OrderedCollection new
]

{ #category : #accessing }
Cliente >> mail [

	^ mail
]

{ #category : #accessing }
Cliente >> mail: anObject [

	mail := anObject
]

{ #category : #accessing }
Cliente >> preferencias [

	^ preferencias
]

{ #category : #accessing }
Cliente >> preferencias: anObject [

	preferencias := anObject
]

{ #category : #accessing }
Cliente >> telefono [

	^ telefono
]

{ #category : #accessing }
Cliente >> telefono: anObject [

	telefono := anObject
]

{ #category : #accessing }
Cliente >> verContratosCliente [

	colContratos do: [ :contrato | 
		Transcript
			show: contrato toString;
			cr ]
]
