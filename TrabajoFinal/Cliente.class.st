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

{ #category : #propios }
Cliente >> buscarContrato: nroContrato [
|unContrato|

unContrato := colContratos detect: [ :contrato | contrato numeroContrato = nroContrato ].

^unContrato .
]

{ #category : #propios }
Cliente >> buscarYAgregrarExcurision: nroContrato excursion: unaExcursion cantidadPersonasExcursion: cantPersonasExcursion [

	| unContrato |
	unContrato := self buscarContrato: nroContrato.

	[ unContrato isNotNil ] ifTrue: [ 
		unContrato añadirExcursion: unaExcursion  cantidadPersonasExcursion: cantPersonasExcursion ]
]

{ #category : #accessing }
Cliente >> ciudadResidencia [

	^ ciudadResidencia
]

{ #category : #accessing }
Cliente >> ciudadResidencia: anObject [

	ciudadResidencia := anObject
]

{ #category : #propios }
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
Cliente >> efectivizarContrato: nroContrato [
|unContrato efectivizado|
efectivizado := false.
unContrato := self buscarContrato: nroContrato.
[unContrato isNotNil ] ifTrue: [ (unContrato efectivizarContrato) ifTrue: [ efectivizado := true ] ].
^ efectivizado
]

{ #category : #propios }
Cliente >> eliminarContrato: numContrato [

|unContrato|

unContrato := self buscarContrato: numContrato.

colContratos remove: unContrato.

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

	self añadirContrato: contratoNuevo 
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

{ #category : #propios }
Cliente >> obtenerContratosSinEfectivizar [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| infoContrato |
	infoContrato := ''.
	 colContratos do: [ 
		                [ :contrato | 
		                contrato verificarYObtenerInfo = '' ifFalse: [ 
			                infoContrato := infoContrato
			                                , contrato verificarYObtenerInfo ] ] ].

	^ infoContrato
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

{ #category : #propios }
Cliente >> verificarContratoClienteYPagarLaCantCuotas: laCantCuotas NumeroContrato: elNumeroContrato [

	colContratos do: [ :cadaContrato | 
		(cadaContrato
			 verificarContratoYPagarCantCuotas: laCantCuotas
			 NumContrato: elNumeroContrato)].
	
]

{ #category : #propios }
Cliente >> verificarYCancelarContrato: numContrato [

|unContrato montoDevolucion|

unContrato := self buscarContrato: numContrato.

[ unContrato isNotNil ] ifTrue: [ montoDevolucion := unContrato calcularDevolucion. self eliminarContrato: numContrato ].

^montoDevolucion 
]
