Class {
	#name : #Excursion,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'cupo',
		'costo'
	],
	#category : #TrabajoFinal
}

{ #category : #accessing }
Excursion >> costo [

	^ costo
]

{ #category : #accessing }
Excursion >> costo: anObject [

	costo := anObject
]

{ #category : #accessing }
Excursion >> cupo [

	^ cupo
]

{ #category : #accessing }
Excursion >> cupo: anObject [

	cupo := anObject
]

{ #category : #accessing }
Excursion >> nombre [

	^ nombre
]

{ #category : #accessing }
Excursion >> nombre: anObject [

	nombre := anObject
]

{ #category : #'as yet unclassified' }
Excursion >> verificarYActualizar: nombreExcursion CantPersonasExcursion: laCantPersonasExcursion [

	| unaExcursion |
	unaExcursion := nil.
	(nombre = nombreExcursion and: laCantPersonasExcursion <= cupo) 
		ifTrue: [ cupo := cupo - laCantPersonasExcursion. unaExcursion := self ].
	^ unaExcursion
]
