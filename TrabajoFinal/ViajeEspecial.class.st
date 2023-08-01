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
	nuevoViaje := self
		              crear: nombreViaje
		              costoPersona: valor1
		              valorImpuestos: valor2.
	nuevoViaje
		inicializar: nombreViaje
		costoPersona: valor1
		valorImpuestos: valor2.
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
ViajeEspecial >> inicializar: nombreViaje costoPersona: valor1 valorImpuestos: valor2 fechaSalida: fecha1 ciudad: ciudadDestino fechaRegreso: fecha2 disponibilidad: unEntero [

	nombre := nombreViaje.
	costoPersona := valor1.
	valorImpuestos := valor2.
	fechaSalida := fecha1.
	ciudad := ciudadDestino.
	fechaRegreso := fecha2.
	disponibilidad := unEntero .
]

{ #category : #printing }
ViajeEspecial >> toString [

	| cadena |
	cadena := super toString.
	cadena := cadena + ' fecha salida: ' + fechaSalida + ', ciudad: '
	          + ciudad + ', cantidad de pasajeros disponible: '
	          + disponibilidad + '.'.
	^cadena.
]
