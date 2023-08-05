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

{ #category : #propios }
Cuota >> obtenerMontoDevolucion: costoTotal fechaViaje: laFechaViaje [

	| monto montoActualAbonado fechaHoy |
	monto := 0.
	fechaHoy := Date today.
	montoActualAbonado := costoTotal / cantCuotas * cantCuotasPagadas.
	[ fechaHoy <= laFechaViaje - 90 ] ifTrue: [ 
		monto := montoActualAbonado * 0.75 ].

	[ fechaHoy >= laFechaViaje - 90 and: fechaHoy <= laFechaViaje - 60 ] 
		ifTrue: [ monto := montoActualAbonado * 0.5 ].

	[ fechaHoy >= laFechaViaje - 60 ] ifTrue: [ 
		monto := montoActualAbonado * 0.25 ].

	^ monto
]

{ #category : #propios }
Cuota >> verificarEfectivizacion: laFechaViaje [

|contratoEfectivizado fechaHoy|
fechaHoy := Date today.
[ cantCuotas = cantCuotasPagadas and: laFechaViaje <= fechaHoy ] ifTrue: [contratoEfectivizado := true] .
^contratoEfectivizado 


]
