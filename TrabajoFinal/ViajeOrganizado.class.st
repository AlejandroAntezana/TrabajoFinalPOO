Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'colEtapas',
		'colFechasSalida',
		'diasDuracionViaje',
		'colExcursionesAdicionales'
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

{ #category : #'as yet unclassified' }
ViajeOrganizado >> actualizarCantPersonas: disponibilidadNecesaria FechaViaje: fechaViaje [
	colFechasSalida do: [ :cadaTupla| (cadaTupla x = fechaViaje) ifTrue: [cadaTupla y: cadaTupla y +disponibilidadNecesaria ]]
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> agregarEtapa: laEtapa [

	colEtapas add: laEtapa.
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

{ #category : #'as yet unclassified' }
ViajeOrganizado >> quitarEtapa: laEtapa [
	
	colEtapas remove: laEtapa.
]

{ #category : #printing }
ViajeOrganizado >> toString [

	^ super toString , 'Fechas de salida disponibles: ' , colFechasSalida 
		  do: [ :cadaFecha | 
			  'fecha: ' ,cadaFecha fecha , ' disponibilidad :' , cadaFecha disponibilidad
			  , ' - ' ] , '. Cantidad de etapas: ' , colEtapas length , '. Dias de duracion del viaje: ', diasDuracionViaje
]

{ #category : #propio }
ViajeOrganizado >> verificarDisponibilidad: laFechaViaje cantidadPersonas: laCantPersonas [

	"Devuelve la primar instancia que da verdadero a verificiarDisponibilidadFecha: CantPersonas, si devuelve nul devolvemos falso y sino true"

	^ [ 
	  colFechasSalida detect: [ :fechaSalida | 
		  fechaSalida
			  verificarDisponibilidadFecha: laFechaViaje
			  CantPersonas: laCantPersonas ] ] ifNil: false ifNotNil: true
]

{ #category : #propios }
ViajeOrganizado >> verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 CantPersonas: laCantPersonas [

	^ [ 
	  colFechasSalida detect: [ :fechaSalida | 
		  fechaSalida
			  verificarDisponibilidadEntreFecha1: fecha1
			  Fecha2: fecha2
			  CantPersonas: laCantPersonas ] ] ifNil: false ifNotNil: true
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
