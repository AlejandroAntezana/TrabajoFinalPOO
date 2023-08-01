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
		'cantCuotas',
		'cantCuotasPagadas',
		'fechaProximoVencimiento'
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

{ #category : #accessing }
Contrato >> cantCuotas [

	^ cantCuotas
]

{ #category : #accessing }
Contrato >> cantCuotas: anObject [

	cantCuotas := anObject
]

{ #category : #accessing }
Contrato >> cantCuotasPagadas [

	^ cantCuotasPagadas
]

{ #category : #accessing }
Contrato >> cantCuotasPagadas: anObject [

	cantCuotasPagadas := anObject
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
Contrato >> efectivizarContrato [

	| fechaHoy |
	fechaHoy := Date today.
	[ cantCuotas = cantCuotasPagadas and: fechaHoy >= fechaViaje ] 
		ifTrue: [ contratoEfectivizado := true ].
	^ contratoEfectivizado
]

{ #category : #propio }
Contrato >> esProximoAVencer [

	| rta |
	rta := false.
	contratoEfectivizado ifFalse: [rta := Date today >= (fechaViaje-21) and: Date today <= (fechaViaje -7 )].
	^rta.
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
Contrato >> fechaProximoVencimiento [

	^ fechaProximoVencimiento
]

{ #category : #accessing }
Contrato >> fechaProximoVencimiento: anObject [

	fechaProximoVencimiento := anObject
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
	cantCuotas := laCantCuotas.
	cantCuotasPagadas := 0.
	numeroContrato := nroContrato.
	fechaContrato := Date today.
	fechaProximoVencimiento := Date today + 30.
	costoTotal := (unViaje obtenerCostoPorPersona) * laCantPersonas + (unViaje obtenerValorImpuestos)
]

{ #category : #accessing }
Contrato >> numeroContrato [

	^ numeroContrato
]

{ #category : #accessing }
Contrato >> numeroContrato: anObject [

	numeroContrato := anObject
]

{ #category : #accessing }
Contrato >> viaje [

	^ viaje
]

{ #category : #accessing }
Contrato >> viaje: anObject [

	viaje := anObject
]
