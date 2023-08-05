Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'numeroContrato',
		'contratoEfectivizado',
		'fechaContrato',
		'costoTotal',
		'viaje',
		'fechaViaje',
		'cantPersonas',
		'cuotas',
		'colExcursionesContratadas'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
Contrato class >> crear: numContrato viaje: unViaje fechaViaje: laFechaDelViaje cantPersonas: laCantPersonas cantCuotas: laCantCuotas [

	| nuevoContrato |
	nuevoContrato := self new.
	nuevoContrato inicializar: numContrato viaje: unViaje fechaViaje: laFechaDelViaje cantPersonas: laCantPersonas  cantCuotas: laCantCuotas.
	^ nuevoContrato
]

{ #category : #propio }
Contrato >> agregarPersonasAContrato: unaCantidad [

	[ viaje verificarYAgregarPersonas: fechaViaje cantidadPersonas: unaCantidad ] ifTrue: [ 
		self cantPersonas: cantPersonas + unaCantidad.
		self costoTotal:
			cantPersonas * viaje costoPersona + viaje valorImpuestos ]
]

{ #category : #propio }
Contrato >> añadirExcursion: excursion cantidadPersonasExcursion: laCantidadPersonas [

	^ SubclassResponsibility
]

{ #category : #propio }
Contrato >> calcularDevolucion [

	^ cuotas obtenerMontoDevolucion: costoTotal
]

{ #category : #accessing }
Contrato >> cantPersonas [

	^ cantPersonas
]

{ #category : #accessing }
Contrato >> cantPersonas: anObject [

	cantPersonas := anObject
]

{ #category : #accessing }
Contrato >> contratoEfectivizado [

	^ contratoEfectivizado
]

{ #category : #accessing }
Contrato >> contratoEfectivizado: anObject [

	contratoEfectivizado := anObject
]

{ #category : #accessing }
Contrato >> costoTotal [

	^ costoTotal
]

{ #category : #accessing }
Contrato >> costoTotal: anObject [

	costoTotal := anObject
]

{ #category : #propio }
Contrato >> debitarYActualizarCuotas: laCantCuotas [

	cuotas cantCuotasPagadas < cuotas cantCuotas ifTrue: [ 
		cuotas cantCuotasPagadas: cuotas cantCuotasPagadas + laCantCuotas.
		
		cuotas cantCuotasPagadas < cuotas cantCuotas ifTrue: [ 
			cuotas fechaProximoVencimiento:
				cuotas fechaProximoVencimiento + 30 * laCantCuotas ] ]
]

{ #category : #propio }
Contrato >> efectivizarContrato [

	| fechaHoy |
	fechaHoy := Date today.
	^ cuotas verificarEfectivizacion:fechaViaje
]

{ #category : #propio }
Contrato >> esProximoAVencer [

	^ Date today >= (fechaViaje - 21) and:
			       Date today <= (fechaViaje - 7)
]

{ #category : #accessing }
Contrato >> fechaContrato [

	^ fechaContrato
]

{ #category : #accessing }
Contrato >> fechaContrato: anObject [

	fechaContrato := anObject
]

{ #category : #accessing }
Contrato >> fechaViaje [

	^ fechaViaje
]

{ #category : #accessing }
Contrato >> fechaViaje: anObject [

	fechaViaje := anObject
]

{ #category : #initialization }
Contrato >> inicializar: nroContrato viaje: unViaje fechaViaje: laFechaViaje cantPersonas: laCantPersonas cantCuotas: laCantCuotas [

	viaje := unViaje.
	fechaViaje := laFechaViaje.
	cantPersonas := laCantPersonas.
	numeroContrato := nroContrato.
	fechaContrato := Date today.
	costoTotal := unViaje obtenerCostoPorPersona * laCantPersonas
	              + unViaje obtenerValorImpuestos.
	cuotas := Cuota crear: laCantCuotas CostoTotal: costoTotal.
	colExcursionesContratadas  := OrderedCollection new.
]

{ #category : #accessing }
Contrato >> numeroContrato [

	^ numeroContrato
]

{ #category : #accessing }
Contrato >> numeroContrato: anObject [

	numeroContrato := anObject
]

{ #category : #printing }
Contrato >> obtenerNombreExcursiones [

	| nombresExcursiones |
	nombresExcursiones := ''.
	^ colExcursionesContratadas do: [ :cadaExcursion | 
		  nombresExcursiones := nombresExcursiones , cadaExcursion nombre ]
]

{ #category : #propio }
Contrato >> quitarPersonasAContrato: unaCantidad [

	[ 
	viaje
		verificarYQuitarPersonas: fechaViaje
		cantidadPersonas: unaCantidad ] ifTrue: [ 
		self cantPersonas: cantPersonas + unaCantidad.
		self costoTotal:
			cantPersonas * viaje costoPersona + viaje valorImpuestos ]
]

{ #category : #printing }
Contrato >> toString [

	^ 'Numero de Contrato:' , numeroContrato , 'Fecha de Contrato:'
	  , fechaContrato , 'Costo Total:' , costoTotal , 'Fecha del Viaje:'
	  , fechaViaje , 'Cantidad de Personas:' , cantPersonas
	  , 'Cantidad de Cuotas: ' , cuotas cantCuotas
	  , 'Cantidad de Cuotas Pagadas:' , cuotas cantCuotasPagadas
	  , 'Fecha del proximo vencimiento:' , cuotas fechaProximoVencimiento
	, 'Excursiones contratadas: ' , self obtenerNombreExcursiones 
]

{ #category : #propio }
Contrato >> verificarContratoYPagarCantCuotas: laCantCuotas NumContrato: elNumContrato [

	(elNumContrato = numeroContrato and: Date today <= fechaViaje - 7) ifTrue: [ 
		self debitarYActualizarCuotas: laCantCuotas ].

]

{ #category : #printing }
Contrato >> verificarYObtenerInfo [

	| texto |
	texto := ''.
	contratoEfectivizado ifFalse: [ texto := self toString ].
	^ texto
]

{ #category : #accessing }
Contrato >> viaje [

	^ viaje
]

{ #category : #accessing }
Contrato >> viaje: anObject [

	viaje := anObject
]
