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

{ #category : #creation }
ViajeOrganizado class >> crearViajeOrganizado: nombreViaje costoPersona: valor1 valorImpuestos: valor2 diasDuracionViaje: cantDias [

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

{ #category : #initialization }
ViajeOrganizado >> inicializarViajeOrganizado: nombreViaje costoPersona: valor1 valorImpuestos: valor2 diasDuracionViaje: cantDias [

	nombre := nombreViaje.
	costoPersona := valor1.
	valorImpuestos := valor2.
	diasDuracionViaje := cantDias.
	colEtapas := OrderedCollection new.
	colFechasSalida := OrderedCollection new
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

	| cadena |
	cadena := super toString.

	cadena := cadena , 'fechas de salida disponibles: '
	          , [ colFechasSalida select: [ :tupla | tupla y >= 1 ] ] 
		          do: [ :x | x ] toString.

	cadena := cadena , 'cantidad de etapas: ' , colEtapas length
	          , 'dias de duracion del viaje: ' , diasDuracionViaje
]

{ #category : #propios }
ViajeOrganizado >> verificarDisponibilidad: laFechaViaje cantidadPersonas: laCantPersonas [

	| rta |
	rta := false.
	[ viajeDisponible ] ifTrue: [ 
		rta := colFechasSalida detect: [ :cadaTupla | 
			       cadaTupla x = laFechaViaje and:
				       cadaTupla y >= laCantPersonas ] ].
	^ rta
]

{ #category : #propios }
ViajeOrganizado >> verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 [

	| rta |
	rta := false.
	rta := colFechasSalida anySatisfy: [ :tupla | 
		       tupla x <= fecha1 and: tupla x <= fecha2 and y >= 1 ].

	^ rta
]

{ #category : #propios }
ViajeOrganizado >> verificarDisponibilidadYActualizar: fechaViaje fechaNueva: nuevaFecha cantidadPersonas: cantPersonas [

	| fechaNuevaEncontrada fechaAnteriorEncontrada fechaNuevaDisponible |
	fechaNuevaEncontrada := false.
	fechaAnteriorEncontrada := false.
	fechaNuevaDisponible := false.

	colFechasSalida do: [ :cadaTupla | 
		[ cadaTupla x = nuevaFecha ] ifTrue: [ 
			fechaNuevaEncontrada := true.
			[ cadaTupla y >= cantPersonas ] ifTrue: [ 
				fechaNuevaDisponible := true.
				cadaTupla y: cadaTupla y - cantPersonas ] ] ].
	
	fechaNuevaDisponible ifTrue: [ 
		fechaAnteriorEncontrada whileFalse: [ 
			colFechasSalida do: [ :cadaTupla | 
				cadaTupla x = fechaViaje ifTrue: [ 
					fechaAnteriorEncontrada := true.
					cadaTupla y: cadaTupla y + cantPersonas ] ] ] ]
]
