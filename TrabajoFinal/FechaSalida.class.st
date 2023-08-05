Class {
	#name : #FechaSalida,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'disponibilidad'
	],
	#category : #TrabajoFinal
}

{ #category : #accessing }
FechaSalida >> disponibilidad [

	^ disponibilidad
]

{ #category : #accessing }
FechaSalida >> disponibilidad: anObject [

	disponibilidad := anObject
]

{ #category : #accessing }
FechaSalida >> fecha [

	^ fecha
]

{ #category : #accessing }
FechaSalida >> fecha: anObject [

	fecha := anObject
]

{ #category : #'as yet unclassified' }
FechaSalida >> verificarDisponibilidadFecha:laFechaViaje CantPersonas: laCantPersonas [

	^ disponibilidad >= laCantPersonas and: fecha = laFechaViaje
]

{ #category : #'as yet unclassified' }
FechaSalida >> verificarDisponibilidadFechaEntre: laFecha1 Fecha2: laFecha2 CantPersonas: laCantPersonas [

	^ ((disponibilidad >= laCantPersonas
		  and: fecha >= laFecha1)
		  and: fecha <= laFecha2)
]

{ #category : #propios }
FechaSalida >> verificarYAgregar: fechaViaje cantidadPersonas: unaCantidad [
|realizado|
realizado := false.
[ fechaViaje = fecha and: disponibilidad >= unaCantidad ] ifTrue: [ self disponibilidad: disponibilidad - unaCantidad. realizado := true].
^ realizado.
]

{ #category : #propios }
FechaSalida >> verificarYQuitar: fechaViaje cantidadPersonas: unaCantidad [

	| realizado |
	realizado := false.
	[ fechaViaje = fecha ] ifTrue: [ 
		self disponibilidad: disponibilidad + unaCantidad.
		realizado := true ].
	^ realizado
]
