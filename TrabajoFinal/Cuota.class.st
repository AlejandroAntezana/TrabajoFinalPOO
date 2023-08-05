Class {
	#name : #Cuota,
	#superclass : #Object,
	#instVars : [
		'costoCuota',
		'cantCuotas',
		'cantCuotasPagadas',
		'fechaProximoVencimiento'
	],
	#category : #TrabajoFinal
}

{ #category : #'as yet unclassified' }
Cuota class >> crear: laCantCuotas CostoTotal: elMontoTotal [

	| nuevaCuota |
	nuevaCuota := self new.
	nuevaCuota inicializar: laCantCuotas costoTotal: elMontoTotal.

	^ nuevaCuota
]

{ #category : #accessing }
Cuota >> cantCuotas [

	^ cantCuotas
]

{ #category : #accessing }
Cuota >> cantCuotas: anObject [

	cantCuotas := anObject
]

{ #category : #accessing }
Cuota >> cantCuotasPagadas [

	^ cantCuotasPagadas
]

{ #category : #accessing }
Cuota >> cantCuotasPagadas: anObject [

	cantCuotasPagadas := anObject
]

{ #category : #accessing }
Cuota >> costoCuota [

	^ costoCuota
]

{ #category : #accessing }
Cuota >> costoCuota: anObject [

	costoCuota := anObject
]

{ #category : #accessing }
Cuota >> fechaProximoVencimiento [

	^ fechaProximoVencimiento
]

{ #category : #accessing }
Cuota >> fechaProximoVencimiento: anObject [

	fechaProximoVencimiento := anObject
]

{ #category : #'as yet unclassified' }
Cuota >> inicializar: laCantCuotas costoTotal: elCostoTotal [

	cantCuotas := laCantCuotas.
cantCuotasPagadas := 0.
fechaProximoVencimiento :=  Date today + 30 .
costoCuota := elCostoTotal / cantCuotas
]
