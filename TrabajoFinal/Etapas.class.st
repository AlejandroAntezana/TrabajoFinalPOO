Class {
	#name : #Etapas,
	#superclass : #Object,
	#instVars : [
		'diaLlegada',
		'diasDePermanencia',
		'hotel',
		'tipoPension',
		'colActividades',
		'colExcursionesAdicionales'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
Etapas class >> crear: fechaLlegada diasDePermanencia: cantDias hotel: nombreHotel tipoPension: laPension [

	| nuevaEtapa |
	nuevaEtapa := self new.
	nuevaEtapa
		inicializar: fechaLlegada
		diasDePermanencia: cantDias
		hotel: nombreHotel
		tipoPension: laPension.
	^nuevaEtapa 
]

{ #category : #accessing }
Etapas >> colActividades [

	^ colActividades
]

{ #category : #accessing }
Etapas >> colActividades: anObject [

	colActividades add: anObject
]

{ #category : #accessing }
Etapas >> diaLlegada [

	^ diaLlegada
]

{ #category : #accessing }
Etapas >> diaLlegada: anObject [

	diaLlegada := anObject
]

{ #category : #accessing }
Etapas >> diasDePermanencia [

	^ diasDePermanencia
]

{ #category : #accessing }
Etapas >> diasDePermanencia: anObject [

	diasDePermanencia := anObject
]

{ #category : #accessing }
Etapas >> hotel [

	^ hotel
]

{ #category : #accessing }
Etapas >> hotel: anObject [

	hotel := anObject
]

{ #category : #initialization }
Etapas >> inicializar: fechaLlegada diasDePermanencia: cantDias hotel: nombreHotel tipoPension: laPension [ 

diaLlegada := fechaLlegada .
diasDePermanencia := cantDias .
hotel := nombreHotel .
tipoPension := laPension .
colActividades := OrderedCollection new.
]

{ #category : #accessing }
Etapas >> tipoPension [

	^ tipoPension
]

{ #category : #accessing }
Etapas >> tipoPension: anObject [

	tipoPension := anObject
]

{ #category : #'as yet unclassified' }
Etapas >> verificarExcursionEtapa: nombreExcursion CantPersonas: laCantPersonasExcursion [

	^ colExcursionesAdicionales detect: [ :cadaExcursion | 
		  (cadaExcursion
			   verificarYActualizar: nombreExcursion
			   CantPersonasExcursion: laCantPersonasExcursion) isNotNil ]
]
