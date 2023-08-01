Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'colEtapas',
		'colFechasSalida',
		'diasDuracionViaje'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
ViajeOrganizado class >> crear: nombreViaje costoPersona: valor1 valorImpuestos: valor2 diasDuracionViaje: cantDias [

	| nuevoViajeOrganizado |
	nuevoViajeOrganizado := self new.
	nuevoViajeOrganizado
		inicializar: nombreViaje
		costoPersona: valor1
		valorImpuestos: valor2
		diasDuracionViaje: cantDias.
	^ nuevoViajeOrganizado
]

{ #category : #accessing }
ViajeOrganizado >> agregarFechaSalida: instanciaDate con: unEntero [

	| dupla |
	dupla := instanciaDate -> unEntero. "Crea una dupla con la fecha y el entero"
	colFechasSalida add: dupla
]

{ #category : #accessing }
ViajeOrganizado >> diasDuracionViaje [

	^ diasDuracionViaje
]

{ #category : #accessing }
ViajeOrganizado >> diasDuracionViaje: anObject [

	diasDuracionViaje := anObject
]

{ #category : #initialization }
ViajeOrganizado >> inicializar: nombreViaje costoPersona: valor1 valorImpuestos: valor2 diasDuracionViaje: cantDias [

	nombre := nombreViaje.
	costoPersona := valor1.
	valorImpuestos := valor2.
	diasDuracionViaje := cantDias.
	colEtapas := OrderedCollection new.
	colFechasSalida := OrderedCollection new.
]

{ #category : #accessing }
ViajeOrganizado >> obtenerFechasDeSalida [

	| fecha entero |
	colFechasSalida do: [ :dupla | 
		fecha := dupla key.
		entero := dupla value.
		Transcript
			show: 'Fecha: ';
			show: fecha printString;
			show: ', Entero: ';
			show: entero printString;
			cr ]
]

{ #category : #printing }
ViajeOrganizado >> toString [

	|cadena|
	cadena := super toString.
	
	cadena := cadena + 'fechas de salida disponibles: ' +
	
	colFechasSalida.
	
]
