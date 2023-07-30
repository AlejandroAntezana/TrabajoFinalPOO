Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'numeroContrato',
		'fechaContrato',
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
Contrato class >> crear: numContrato fechaContrato: unaFecha viaje: unaInstanciaViaje fechaViaje: fechaDelViaje cantPersonas: unNumero cantCuotas: unaCantidad cantCuotasPagadas: otraCantidad fechaProximoVencimiento: fechaVencimiento [

	| nuevoContrato |
	nuevoContrato := self new.
	nuevoContrato
		inicializar: numContrato
		fechaContrato: unaFecha
		viaje: unaInstanciaViaje
		fechaViaje: fechaDelViaje
		cantPersonas: unNumero
		cantCuotas: unaCantidad
		cantCuotasPagadas: otraCantidad
		fechaProximoVencimiento: fechaVencimiento.
	^nuevoContrato
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
Contrato >> inicializar: numContrato fechaContrato: unaFecha viaje: unaInstanciaViaje fechaViaje: fechaDelViaje cantPersonas: unNumero cantCuotas: unaCantidad cantCuotasPagadas: otraCantidad fechaProximoVencimiento: fechaVencimiento [

	numeroContrato := numContrato.
	fechaContrato := unaFecha.
	viaje := unaInstanciaViaje.
	fechaViaje := fechaDelViaje.
	cantPersonas := unNumero.
	cantCuotas := unaCantidad.
	cantCuotasPagadas := otraCantidad.
	fechaProximoVencimiento := fechaVencimiento
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
