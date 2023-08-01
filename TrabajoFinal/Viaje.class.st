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

{ #category : #accessing }
Viaje >> obtenerCostoPorPersona [

	^ costoPersona
]

{ #category : #accessing }
Viaje >> obtenerValorImpuestos [

	^ valorImpuestos
]

{ #category : #printing }
Viaje >> toString [

	| cadena |
	cadena := 'nombre: ' , nombre , 'costo por persona: '
	          , costoPersona toString , 'valor impuestos: '
	          , valorImpuestos toString.

	^ cadena
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
