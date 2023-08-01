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
Cliente class >> crear: unDni apellido: unApellido ciudadResidencia: unaCiudad mail: unMail telefono: unTel [ 

	| nuevoCliente |
	nuevoCliente := self new.
	nuevoCliente
		inicializar: unDni
		apellido: unApellido
		ciudadResidencia: unaCiudad
		mail: unMail
		telefono: unTel.
	^ nuevoCliente
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
Cliente >> añadirContrato: unContrato [
 colContratos add: unContrato .
]

{ #category : #accessing }
Cliente >> ciudadResidencia [

	^ ciudadResidencia
]

{ #category : #accessing }
Cliente >> ciudadResidencia: anObject [

	ciudadResidencia := anObject
]

{ #category : #propio }
Cliente >> controlarVencimiento [

	^ colContratos whileFalse: [:contrato | contrato esProximoAVencer]
]

{ #category : #accessing }
Cliente >> dni [

	^ dni
]

{ #category : #accessing }
Cliente >> dni: anObject [

	dni := anObject
]

{ #category : #propios }
Cliente >> generarContrato: numContrato viaje: unViaje fechaViaje: laFechaViaje cantidadPersonas: laCantPersonas cantCuotas: laCantCuotas pagaPlus: abonaPlus [

	| contratoNuevo |
	abonaPlus
		ifFalse: [ 
			contratoNuevo := Contrato
				                 crear: numContrato
				                 viaje: unViaje
				                 fechaViaje: laFechaViaje
				                 cantPersonas: laCantPersonas
				                 cantCuotas: laCantCuotas ]
		ifTrue: [ 
			contratoNuevo := ContratoFlexible
				                 crear: numContrato
				                 viaje: unViaje
				                 fechaViaje: laFechaViaje
				                 cantPersonas: laCantPersonas
				                 cantCuotas: laCantCuotas ].
			
		self añadirContrato: contratoNuevo.
]

{ #category : #initialization }
Cliente >> inicializar: unDni apellido: unApellido ciudadResidencia: unaCiudad mail: unMail telefono: unTel [ 

	dni := unDni.
	apellido := unApellido.
	ciudadResidencia := unaCiudad.
	mail := unMail.
	telefono := unTel.
	preferencias := ''.
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

{ #category : #'as yet unclassified' }
Cliente >> obtenerContratosSinEfectivizar [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| infoContrato |
	colContratos do: [ 
		[ :contrato | 
		contrato verificarYObtenerInfo = '' ifFalse: [ 
			infoContrato := infoContrato , contrato verificarYObtenerInfo ] ] ].

^infoContrato.
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
"Metodo que muestra por Transcript todos los contratos de un cliente"

	colContratos do: [ :contrato | 
		Transcript
			show: contrato toString;
			cr ]
]

{ #category : #'as yet unclassified' }
Cliente >> verificarContratoClienteYPagarLaCantCuotas: laCantCuotas NumeroContrato: elNumeroContrato [

	^ colContratos whileFalse: [ :contrato | 
		contrato
			verificarContratoYPagarCantCuotas: laCantCuotas
			NumContrato: elNumeroContrato ]
]
