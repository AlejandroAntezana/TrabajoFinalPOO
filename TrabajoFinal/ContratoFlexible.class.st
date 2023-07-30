Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#instVars : [
		'valorPlus',
		'valorPlusAbonado',
		'colExcursionesAdicionales'
	],
	#category : #TrabajoFinal
}

{ #category : #accessing }
ContratoFlexible >> colExcursionesAdicionales [

	^ colExcursionesAdicionales
]

{ #category : #accessing }
ContratoFlexible >> colExcursionesAdicionales: unaDupla [

	colExcursionesAdicionales add: unaDupla 
]

{ #category : #initialization }
ContratoFlexible >> inicializar: numContrato fechaContrato: unaFecha viaje: unaInstanciaViaje fechaViaje: fechaDelViaje cantPersonas: unNumero cantCuotas: unaCantidad cantCuotasPagadas: otraCantidad fechaProximoVencimiento: fechaVencimiento [

	numeroContrato := numContrato.
	fechaContrato := unaFecha.
	viaje := unaInstanciaViaje.
	fechaViaje := fechaDelViaje.
	cantPersonas := unNumero.
	cantCuotas := unaCantidad.
	cantCuotasPagadas := otraCantidad.
	fechaProximoVencimiento := fechaVencimiento.
	valorPlus := 0.
	valorPlusAbonado := false.
	colExcursionesAdicionales := OrderedCollection new.
]

{ #category : #accessing }
ContratoFlexible >> valorPlus [

	^ valorPlus
]

{ #category : #accessing }
ContratoFlexible >> valorPlus: anObject [

	valorPlus := anObject
]

{ #category : #accessing }
ContratoFlexible >> valorPlusAbonado [

	^ valorPlusAbonado
]

{ #category : #accessing }
ContratoFlexible >> valorPlusAbonado: anObject [

	valorPlusAbonado := anObject
]
