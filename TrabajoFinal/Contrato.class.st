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

{ #category : #propio }
Contrato >> añadirExcursion: excursion cantidadPersonasExcursion: laCantidadPersonas [

	^ SubclassResponsibility
]

{ #category : #propio }
Contrato >> calcularDevolucion [

	| monto montoActualAbonado fechaHoy |
	monto := 0.
	montoActualAbonado := costoTotal / cantCuotas * cantCuotasPagadas.
	fechaHoy := Date today.

	[ fechaHoy <= fechaViaje - 90 ] ifTrue: [ 
		monto := montoActualAbonado * 0.75 ].
	[ fechaHoy >= fechaViaje - 90 and: fechaHoy <= fechaViaje - 60 ] 
		ifTrue: [ monto := montoActualAbonado * 0.5 ].
	[ fechaHoy >= fechaViaje - 60 ] ifTrue: [ 
		monto := montoActualAbonado * 0.25 ].

	^ monto
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
Contrato >> debitarYActualizarCuotas: laCantCuotas [

	(cantCuotasPagadas < cantCuotas) ifTrue:[ cantCuotasPagadas:= cantCuotasPagadas + laCantCuotas. 
		(cantCuotasPagadas < cantCuotas) ifTrue: [ fechaProximoVencimiento := fechaProximoVencimiento + 30*laCantCuotas ]].
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

{ #category : #propio }
Contrato >> modificarPersonasContrato: laCantPersonas [

	| disponibilidadNecesaria |
	disponibilidadNecesaria := laCantPersonas - cantPersonas.

	[ 
	viaje
		verificarDisponibilidadYActualizarPersonas: fechaViaje
		disponibilidadNecesaria: disponibilidadNecesaria
		cantidadPersonas: laCantPersonas ] ifTrue: [ 
		viaje costoTotal: viaje obtenerCostoPorPersona * laCantPersonas
			+ viaje obtenerValorImpuestos.
		self cantPersonas: laCantPersonas ]
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
Contrato >> toString [

	^ 'Numero de Contrato:' , numeroContrato ,
'Fecha de Contrato:' , fechaContrato , 
'Costo Total:' , costoTotal , 
'Fecha del Viaje:' , fechaViaje ,
'Cantidad de Personas:' , cantPersonas ,
'Cantidad de Cuotas: ' , cantCuotas , 
'Cantidad de Cuotas Pagadas:' , cantCuotasPagadas , 
'Fecha del proximo vencimiento:' , fechaProximoVencimiento 
]

{ #category : #propio }
Contrato >> verificarContratoYPagarCantCuotas: laCantCuotas NumContrato: elNumContrato [

	| rta |
	rta := elNumContrato = numeroContrato.
	(rta and: Date today <= fechaViaje - 7) ifTrue: [ 
		self debitarYActualizarCuotas: laCantCuotas ].
	
	^rta.
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
