Class {
	#name : #ViajeEspecial,
	#superclass : #Viaje,
	#instVars : [
		'fechaSalida',
		'ciudad',
		'fechaRegreso',
		'colExcursionesAdicionales'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
ViajeEspecial class >> crear: nombreViaje costoPersona: valor1 valorImpuestos: valor2 fechaSalida: fecha1 ciudad: ciudadDestino fechaRegreso: fecha2 disponibilidad: unEntero [

	| nuevoViaje |
	nuevoViaje := self new.

	nuevoViaje
		inicializar: nombreViaje
		costoPersona: valor1
		valorImpuestos: valor2
		ciudad: ciudadDestino
		fechaRegreso: fecha2
		fechaSalida: fecha1
		disponibilidad: unEntero.


	^ nuevoViaje
]

{ #category : #accessing }
ViajeEspecial >> ciudad [

	^ ciudad
]

{ #category : #accessing }
ViajeEspecial >> ciudad: anObject [

	ciudad := anObject
]

{ #category : #accessing }
ViajeEspecial >> fechaRegreso [

	^ fechaRegreso
]

{ #category : #accessing }
ViajeEspecial >> fechaRegreso: anObject [

	fechaRegreso := anObject
]

{ #category : #accessing }
ViajeEspecial >> fechaSalida [

	^ fechaSalida
]

{ #category : #accessing }
ViajeEspecial >> fechaSalida: anObject [

	fechaSalida := anObject
]

{ #category : #initialization }
ViajeEspecial >> inicializar: nombreViaje costoPersona: valor1 valorImpuestos: valor2 ciudad: nombreCiudad fechaRegreso: laFechaRegreso fechaSalida: unaFecha disponibilidad: laDisponibilidad [

	nombre := nombreViaje.
	costoPersona := valor1.
	valorImpuestos := valor2.
	ciudad := nombreCiudad.
	fechaRegreso := laFechaRegreso.
	colExcursionesAdicionales := OrderedCollection new.
	fechaSalida := FechaSalida crear: unaFecha Disponibilidad: laDisponibilidad .
]

{ #category : #printing }
ViajeEspecial >> toString [

	^ super toString , ' fecha salida: ' , fechaSalida fecha
	  , ' ciudad: ' ciudad , ' cantidad de pasajeros disponible: '
	  , fechaSalida disponibilidad , '.' 
]

{ #category : #propio }
ViajeEspecial >> verificarDisponibilidad: laFechaViaje cantidadPersonas: laCantPersonas [

	^ fechaSalida verificarDisponibilidadFecha: laFechaViaje  CantPersonas: laCantPersonas
]

{ #category : #propio }
ViajeEspecial >> verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 CantPersonas: laCantPersonas [

	^ (fecha1 <= fechaSalida fecha and: fechaSalida fecha <= fecha2) 
		  and: fechaSalida disponibilidad  >= laCantPersonas
]

{ #category : #propio }
ViajeEspecial >> verificarYAgregarPersonas: fechaViaje cantidadPersonas: unaCantidad [

	^ fechaSalida verificarYAgregar: fechaViaje cantidadPersonas: unaCantidad.
]

{ #category : #propio }
ViajeEspecial >> verificarYQuitarPersonas: fechaViaje cantidadPersonas: unaCantidad [

	 ^ fechaSalida verificarYQuitar: fechaViaje cantidadPersonas: unaCantidad.
]
