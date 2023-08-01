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

{ #category : #accessing }
Viaje >> costoPersona: unPrecio [

	costoPersona := unPrecio.
]

{ #category : #propio }
Viaje >> infoViajeSiDisponibleFecha1: fecha1 Fecha2: fecha2 [

	^ (self verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2) 
		  ifTrue: self toString
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

{ #category : #propio }
Viaje >> verificarAltaDeViaje [

	^viajeDisponible = true.
]

{ #category : #propio }
Viaje >> verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 [

	^SubclassResponsibility 
]

{ #category : #accessing }
Viaje >> viajeDisponible [

	^ viajeDisponible
]

{ #category : #accessing }
Viaje >> viajeDisponible: anObject [

	viajeDisponible := anObject
]
