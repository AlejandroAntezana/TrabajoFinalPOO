Class {
	#name : #ViajeEspecial,
	#superclass : #Viaje,
	#instVars : [
		'fechaSalida',
		'ciudad',
		'fechaRegreso',
		'disponibilidad'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
ViajeEspecial class >> crear: nombreViaje costoPersona: valor1 valorImpuestos: valor2 fechaSalida: fecha1 ciudad: ciudadDestino fechaRegreso: fecha2 disponibilidad: unEntero [

	| nuevoViaje |
	nuevoViaje := self new.

	nuevoViaje
		inicializarViajeEspecial: nombreViaje
		costoPersona: valor1
		valorImpuestos: valor2
		fechaSalida: fecha1
		ciudad: ciudadDestino
		fechaRegreso: fecha2
		disponibilidad: unEntero.

	^ nuevoViaje
]

{ #category : #propio }
ViajeEspecial >> actualizarCantPersonas: laCantPersonas [

	self disponibilidad: disponibilidad + laCantPersonas.
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
ViajeEspecial >> disponibilidad [

	^ disponibilidad
]

{ #category : #accessing }
ViajeEspecial >> disponibilidad: anObject [

	disponibilidad := anObject
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
ViajeEspecial >> inicializarViajeEspecial: nombreViaje costoPersona: valor1 valorImpuestos: valor2 fechaSalida: fecha1 ciudad: ciudadDestino fechaRegreso: fecha2 disponibilidad: unEntero [

	self
		inicializar: nombreViaje
		costoPersona: valor1
		valorImpuestos: valor2.

	fechaSalida := fecha1.
	ciudad := ciudadDestino.
	fechaRegreso := fecha2.
	disponibilidad := unEntero
]

{ #category : #printing }
ViajeEspecial >> toString [

	| cadena |
	cadena := super toString.
	cadena := cadena , ciudad , fechaSalida toString
	          , fechaRegreso toString , disponibilidad toString.
	^ cadena
]

{ #category : #propio }
ViajeEspecial >> verificarDisponibilidad: laFechaViaje cantidadPersonas: laCantPersonas [

	^ [ self fechaSalida = laFechaViaje ] and: [ 
		  self disponibilidad >= laCantPersonas and:
			  self viajeDisponible ]
]

{ #category : #propio }
ViajeEspecial >> verificarDisponibilidadEntreFecha1: fecha1 fecha2: fecha2 [

	| rta |
	rta := fecha1 <= fechaSalida and fechaSalida
	       <= fecha2 and disponibilidad >= 1.

	^ rta.
]
