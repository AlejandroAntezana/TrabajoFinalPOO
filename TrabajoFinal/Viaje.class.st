Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoPersona',
		'valorImpuestos'
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

{ #category : #propio }
Viaje >> actualizarCantPersonas: laCantPersonas [

^ SubclassResponsibility.
]

{ #category : #accessing }
Viaje >> costoPersona: unPrecio [

	costoPersona := unPrecio.
]

{ #category : #propio }
Viaje >> infoViajeSiDisponibleFecha1: fecha1 Fecha2: fecha2 CantPersonas: laCantPersonas [

	^ (self verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 CantPersonas: laCantPersonas ) 
		  ifTrue: self toString
]

{ #category : #initialization }
Viaje >> inicializar: nombreViaje costoPersona: valor1 valorImpuestos: valor2 [

	nombre := nombreViaje.
	costoPersona := valor1.
	valorImpuestos := valor2.
	
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

	^ 'nombre: ' , nombre , 'costo por persona: '
	          , costoPersona toString , 'valor impuestos: '
	          , valorImpuestos toString.

]

{ #category : #accessing }
Viaje >> valorImpuestos: unValor [

	valorImpuestos := unValor
]

{ #category : #propio }
Viaje >> verificarDisponibilidad: laFechaViaje cantidadPersonas: laCantPersonas [

	^ SubclassResponsibility
]

{ #category : #propio }
Viaje >> verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 CantPersonas: laCantPersonas [

	^ SubclassResponsibility
]

{ #category : #propio }
Viaje >> verificarDisponibilidadYActualizarPersonas: fechaViaje disponibilidadNecesaria: disponibilidadNecesaria cantidadPersonas: laCantPersonas [

	| cantPersonasModificada |
	cantPersonasModificada := false.

	[ 
	self
		verificarDisponibilidad: fechaViaje
		cantidadPersonas: disponibilidadNecesaria ] ifTrue: [ 
		(self actualizarCantPersonas: laCantPersonas) ifTrue: [ 
			cantPersonasModificada := true ] ].

	^ cantPersonasModificada
]

{ #category : #propio }
Viaje >> verificarDisponibilidadYActualizarfechaViaje:fechaViaje nuevaFecha: nuevaFecha  cantidadPersonas: cantPersonas [
^ SubclassResponsibility .
]

{ #category : #propio }
Viaje >> verificarYAgregarPersonas: fechaViaje cantidadPersonas: unaCantidad [

	^ SubclassResponsibility 
]

{ #category : #propio }
Viaje >> verificarYQuitarPersonas: fechaViaje cantidadPersonas: unaCantidad [
^SubclassResponsibility 
	
]
