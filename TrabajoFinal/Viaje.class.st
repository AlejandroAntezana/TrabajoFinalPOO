Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoPersona',
		'valorImpuestos',
		'viajeDisponible'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
Viaje class >> crear: nombreViaje costoPersona: valor1 valorImpuestos: valor2 [
|nuevoViaje|
nuevoViaje := self new.
nuevoViaje inicializar: nombreViaje costoPersona: valor1 valorImpuestos: valor2.
^nuevoViaje
]

{ #category : #testing }
Viaje class >> isAbstract [
		
	^ self == Viaje
]

{ #category : #accessing }
Viaje >> costoPersona [

	^ costoPersona
]

{ #category : #accessing }
Viaje >> costoPersona: unPrecio [

	costoPersona := unPrecio.
]

{ #category : #initialization }
Viaje >> inicializar: nombreViaje costoPersona: valor1 valorImpuestos: valor2 [

	nombre := nombreViaje.
	costoPersona := valor1.
	valorImpuestos := valor2.
	viajeDisponible := true. 
]

{ #category : #accessing }
Viaje >> nombre [

	^ nombre
]

{ #category : #accessing }
Viaje >> nombre: nombreViaje [

	nombre := nombreViaje.
]

{ #category : #printing }
Viaje >> toString [

	| cadena |
	cadena := 'nombre: ' + nombre + 'costo por persona: ' + costoPersona
	          + 'valor impuestos: ' + valorImpuestos.
	
	^cadena.
]

{ #category : #accessing }
Viaje >> valorImpuestos [

	^ valorImpuestos
]

{ #category : #accessing }
Viaje >> valorImpuestos: unValor [

	valorImpuestos := unValor
]

{ #category : #accessing }
Viaje >> viajeDisponible [

	^ viajeDisponible
]

{ #category : #accessing }
Viaje >> viajeDisponible: anObject [

	viajeDisponible := anObject
]
