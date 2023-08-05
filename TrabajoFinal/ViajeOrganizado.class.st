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

{ #category : #propios }
ViajeOrganizado >> actualizarCantPersonas: disponibilidadNecesaria FechaViaje: fechaViaje [
	colFechasSalida do: [ :cadaTupla| (cadaTupla x = fechaViaje) ifTrue: [cadaTupla y: cadaTupla y +disponibilidadNecesaria ]]
]

{ #category : #propios }
ViajeOrganizado >> agregarEtapa: laEtapa [

	colEtapas add: laEtapa.
]

{ #category : #accessing }
ViajeOrganizado >> agregarFechaSalida: instanciaDate con: disponibilidad [

colFechasSalida add: (FechaSalida crear: instanciaDate Disponibilidad: disponibilidad).
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
ViajeOrganizado >> modificarDisponibilidad: disponibilidad FechaSalida: fechaViaje [

| fechaParaModificar |
	fechaParaModificar := colFechasSalida detect: [ :cadaFecha | 
		                      cadaFecha fecha = fechaViaje ].
	fechaParaModificar disponibilidad: disponibilidad.
]

{ #category : #accessing }
ViajeOrganizado >> modificarFecha: fechaActual nuevaFecha: fechaNueva [

|fechaParaModificar|

fechaParaModificar := colFechasSalida detect: [ :cadaFecha | cadaFecha fecha = fechaActual ].
fechaParaModificar fecha: fechaNueva.


]

{ #category : #accessing }
ViajeOrganizado >> obtenerFechasDeSalida [
	colFechasSalida do: [ :cadaFecha | 
		Transcript
			show: 'Fecha de Salida: ';
			show: cadaFecha fecha printString;
			show: ', Disponibilidad: ';
			show: cadaFecha disponibilidad printString;
			cr ]

	
]

{ #category : #propios }
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

{ #category : #propio }
ViajeOrganizado >> verificarDisponibilidadYActualizarfechaViaje: fechaViaje nuevaFecha: nuevaFecha cantidadPersonas: cantPersonas [

	| modificar |
	modificar := false.
	colFechasSalida do: [ :fechaSalida | 
		[ fechaSalida fecha = fechaViaje ] ifTrue: [ 
			fechaSalida disponibilidad:
				fechaSalida disponibilidad + cantPersonas.
			modificar := true ] ].
	modificar ifTrue: [ 
		colFechasSalida do: [ :fechaSalida | 
			[ fechaSalida fecha = nuevaFecha ] ifTrue: [ 
				fechaSalida disponibilidad:
					fechaSalida disponibilidad - cantPersonas ] ] ]
]

{ #category : #'as yet unclassified' }
ViajeOrganizado >> verificarExcursionYAñadir: nombreExcursion CantPersonasExcursion: laCantPersonasExcursion [

	^colEtapas detect: [ :cadaEtapa | cadaEtapa verificarExcursionEtapa: nombreExcursion  CantPersonas: laCantPersonasExcursion isNotNil   ]
]

{ #category : #propio }
ViajeOrganizado >> verificarYAgregarPersonas: fechaViaje cantidadPersonas: unaCantidad [

|realizado|
realizado := false.
colFechasSalida do: [ :cadaFecha | [cadaFecha verificarYAgregar: fechaViaje cantidadPersonas: unaCantidad] ifTrue: [ realizado := true ] ].
^ realizado .
]

{ #category : #propio }
ViajeOrganizado >> verificarYQuitarPersonas: fechaViaje cantidadPersonas: unaCantidad [

	| realizado |
	realizado := false.
	colFechasSalida do: [ :cadaFecha | 
		[ 
		cadaFecha
			verificarYQuitar: fechaViaje
			cantidadPersonas: unaCantidad ] ifTrue: [ realizado := true ] ].
	^ realizado
]
