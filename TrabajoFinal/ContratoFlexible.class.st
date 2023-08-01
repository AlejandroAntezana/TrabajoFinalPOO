Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#instVars : [
		'valorPlus',
		'disponibilidadExcursiones',
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

{ #category : #accessing }
ContratoFlexible >> disponibilidadExcursiones [

	^ disponibilidadExcursiones
]

{ #category : #accessing }
ContratoFlexible >> disponibilidadExcursiones: anObject [

	disponibilidadExcursiones := anObject
]

{ #category : #initialization }
ContratoFlexible >> inicializar: nroContrato viaje: unViaje fechaViaje: laFechaViaje cantPersonas: laCantPersonas cantCuotas: laCantCuotas [

	super
		inicializar: nroContrato
		viaje: unViaje
		fechaViaje: laFechaViaje
		cantPersonas: laCantPersonas
		cantCuotas: laCantCuotas .
		valorPlus := costoTotal * 0.15.
		disponibilidadExcursiones := cantPersonas - 1.
	
]

{ #category : #propios }
ContratoFlexible >> modificarFechaViajeContrato: nuevaFecha [
 viaje verificarDisponibilidadYActualizar: fechaViaje fechaNueva: nuevaFecha cantidadPersonas: cantPersonas.
]

{ #category : #printing }
ContratoFlexible >> toString [

	| cadena |
	cadena := super toString.
	cadena := cadena , 'Valor del Plus:' + valorPlus
	          + 'Disponibilidad para Excursiones:'
	          + disponibilidadExcursiones + 'Excursiones Contratadas:'
	          + colExcursionesAdicionales 
]

{ #category : #accessing }
ContratoFlexible >> valorPlus [

	^ valorPlus
]

{ #category : #accessing }
ContratoFlexible >> valorPlus: anObject [

	valorPlus := anObject
]
