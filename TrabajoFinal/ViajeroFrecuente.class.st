Class {
	#name : #ViajeroFrecuente,
	#superclass : #Cliente,
	#instVars : [
		'millasAcumuladas'
	],
	#category : #TrabajoFinal
}

{ #category : #accessing }
ViajeroFrecuente >> añadirMillas: millasAñadidas [

	millasAcumuladas := millasAcumuladas + millasAñadidas
]

{ #category : #propios }
ViajeroFrecuente >> efectivizarContrato: nroContrato [
|contrato|
contrato := self buscarContrato: nroContrato.
[ super efectivizarContrato: nroContrato ] ifTrue: [self añadirMillas: (contrato costoTotal )/ 10000 * 50 ]
]

{ #category : #initialization }
ViajeroFrecuente >> inicializar: unDni apellido: unApellido ciudadResidencia: unaCiudad mail: unMail telefono: unTel [

	dni := unDni.
	apellido := unApellido.
	ciudadResidencia := unaCiudad.
	mail := unMail.
	telefono := unTel.
	preferencias := ''.
	colContratos := OrderedCollection new.
	millasAcumuladas := 0.
]

{ #category : #accessing }
ViajeroFrecuente >> millasAcumuladas [
 ^ millasAcumuladas.
]

{ #category : #propios }
ViajeroFrecuente >> verificarYCancelarContrato: numContrato [

	| montoDevolucion |
	montoDevolucion := super verificarYCancelarContrato: numContrato.
	[ montoDevolucion > 0 ] ifTrue: [ self añadirMillas: (montoDevolucion / 10000) * 50 ].
	^ montoDevolucion
]
