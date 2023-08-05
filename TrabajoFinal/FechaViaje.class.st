Class {
	#name : #FechaViaje,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'disponibilidad'
	],
	#category : #TrabajoFinal
}

{ #category : #accessing }
FechaViaje >> disponibilidad [

	^ disponibilidad
]

{ #category : #accessing }
FechaViaje >> disponibilidad: anObject [

	disponibilidad := anObject
]

{ #category : #accessing }
FechaViaje >> fecha [

	^ fecha
]

{ #category : #accessing }
FechaViaje >> fecha: anObject [

	fecha := anObject
]

{ #category : #'as yet unclassified' }
FechaViaje >> verificarDisponibilidad: laCantPersonas Fecha: laFechaViaje [

	^ disponibilidad >= laCantPersonas and: fecha = laFechaViaje
]

{ #category : #'as yet unclassified' }
FechaViaje >> verificarDisponibilidadFecha:laFechaViaje CantPersonas: laCantPersonas [

	^ disponibilidad >= laCantPersonas and: fecha = laFechaViaje
]
