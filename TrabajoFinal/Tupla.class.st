Class {
	#name : #Tupla,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
Tupla class >> crearTuplaX: valorX Y:valorY [
	
	|tupla|
	
	 tupla := self new.
	
	tupla inicializarTuplaX: valorX Y: valorY.
	
	^tupla. 
	
]

{ #category : #initialization }
Tupla >> inicializarTuplaX: valorX Y: valorY [

 	x:= valorX.
	y:= valorY.
	
	
]

{ #category : #accessing }
Tupla >> x [

	^ x
]

{ #category : #accessing }
Tupla >> x: anObject [

	x := anObject
]

{ #category : #accessing }
Tupla >> y [

	^ y
]

{ #category : #accessing }
Tupla >> y: anObject [

	y := anObject
]
