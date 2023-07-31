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

{ #category : #accessing }
ContratoFlexible >> valorPlus [

	^ valorPlus
]

{ #category : #accessing }
ContratoFlexible >> valorPlus: anObject [

	valorPlus := anObject
]
