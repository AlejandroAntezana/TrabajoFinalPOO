Class {
	#name : #EmpresaTurismo,
	#superclass : #Object,
	#instVars : [
		'colClientes',
		'colViajes'
	],
	#category : #TrabajoFinal
}

{ #category : #creation }
EmpresaTurismo class >> create [
|nuevaEmpresa|
nuevaEmpresa := self new.
nuevaEmpresa initialize.
^nuevaEmpresa .
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> agregarEtapa: elViaje laEtapa: laEtapa [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje agregarEtapa: laEtapa ]
]

{ #category : #propios }
EmpresaTurismo >> agregarExcursionAContrato: dniCliente numeroContrato: nroContrato excursion: unaExcursion cantidadPersonasExcursion: cantPersonasExcursion [

	| unCliente |
	unCliente := self buscarCliente: dniCliente.
	[ unCliente isNotNil ] ifTrue: [ 
		unCliente
			buscarYAgregrarExcurision: nroContrato
			excursion: unaExcursion
			cantidadPersonasExcursion: cantPersonasExcursion ]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> altaViajeEspecial: unNombre CostoPersona: unCostoPersona ValorImpuestos: elValorImpuestos FechaSalida: laFechaSalida FechaRegreso: laFechaRegreso Ciudad: laCiudad Disponibilidad: laDisponibilidad [

	| unViaje |
	unViaje := self buscarViaje: unNombre.

	unViaje ifNil: [colViajes add:[ViajeEspecial crear: unNombre  costoPersona: unCostoPersona   valorImpuestos: elValorImpuestos  fechaSalida:  laFechaSalida  ciudad:laCiudad  fechaRegreso: laFechaRegreso   disponibilidad: laDisponibilidad]]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> altaViajeOrganizado: unNombre CostoPersona: unCostoPersona ValorImpuesto: elValorImpuestos DuracionViaje: losDiasDuracionViaje [

	| unViaje |
	unViaje := self buscarViaje: unNombre.

	unViaje ifNil: [ 
		colViajes add: [ 
			ViajeOrganizado crearViajeOrganizado: unNombre costoPersona: unCostoPersona valorImpuestos: elValorImpuestos  diasDuracionViaje: losDiasDuracionViaje  ] ]
]

{ #category : #propios }
EmpresaTurismo >> buscarCliente: dniCliente [

	| unCliente |
	unCliente := colClientes detect: [ :cliente | 
		             cliente dni = dniCliente ].
	
	^unCliente.
]

{ #category : #propios }
EmpresaTurismo >> buscarViaje: nombreViaje [

	| unViaje |
	unViaje := colViajes detect: [ :viaje | viaje nombre = nombreViaje ].

	^ unViaje
]

{ #category : #propios }
EmpresaTurismo >> buscarViajesDisponiblesFecha1: fecha1 Fecha2: fecha2 [

	| viajes |
	viajes := ''.
	colViajes do: [ :viaje | 
		viaje verificarAltaDeViaje ifTrue: [ 
			[ viaje verificarDisponibilidadEntreFecha1: fecha1 Fecha2: fecha2 ] 
				ifTrue: [ viajes := viajes , viaje toString ] ] ]
]

{ #category : #propios }
EmpresaTurismo >> cancelarContrato: dniCliente numeroContrato: numContrato [

|unCliente montoDevolucion|

unCliente := self buscarCliente: dniCliente.

[ unCliente isNotNil ] ifTrue: [ montoDevolucion := unCliente verificarYCancelarContrato: numContrato  ].

^montoDevolucion 
]

{ #category : #propios }
EmpresaTurismo >> efectivizarContratoACliente: elDniCliente numeroContrato: nroContrato [
|unCliente|
unCliente := self buscarCliente: elDniCliente.

[ unCliente isNotNil ] ifTrue: [ unCliente efectivizarContrato: nroContrato ].

]

{ #category : #propios }
EmpresaTurismo >> generarContratoCliente: numContrato dni: dniCliente Viaje: elViaje cantidadPersonas: laCantPersonas cantidadCuotas: laCantCuotas fechaViaje: laFechaViaje pagaPlus: abonaPlus [

	| unViaje unCliente |
	unViaje := self buscarViaje: elViaje.

	[ unViaje isNotNil ] ifTrue: [ 
		[ 
		unViaje
			verificarDisponibilidad: laFechaViaje
			cantidadPersonas: laCantPersonas ] ifTrue: [ 
			unCliente := self buscarCliente: dniCliente.
			[ unCliente isNotNil ] ifTrue: [ 
				unCliente
					generarContrato: numContrato
					viaje: elViaje
					fechaViaje: laFechaViaje
					cantidadPersonas: laCantPersonas
					cantCuotas: laCantCuotas
					pagaPlus: abonaPlus ] ] ].
]

{ #category : #propios }
EmpresaTurismo >> inicioDelDia [

	| colClientesRecordatorio |
	colClientesRecordatorio := OrderedCollection new.
	colClientesRecordatorio := colClientes select: [ :cliente | 
		                           cliente controlarVencimiento ]
]

{ #category : #initialization }
EmpresaTurismo >> initialize [ 
	colClientes := OrderedCollection new.
	colViajes := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarCiudad: elViaje nuevaCiudad: laNuevaCiudad [
	
	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje ciudad: laNuevaCiudad ]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarCostoViaje: elViaje nuevoCosto: elNuevoCosto [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje costoPersona: elNuevoCosto]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarDisponibilidad: elViaje cupoNuevo: elNuevoCupo [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje disponibilidad: elNuevoCupo ]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarFechaRegreso: elViaje nuevaFechaRegreso: laNuevaFechaRegreso [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje fechaRegreso: laNuevaFechaRegreso ]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarFechaSalida: elViaje nuevoFechaSalida: laNuevaFechaSalida [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje fechaSalida: laNuevaFechaSalida].
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarImpuestosViaje: elViaje nuevoImpuesto: elNuevoImpuesto [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje valorImpuestos: elNuevoImpuesto ]
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> modificarNombreViaje: elViaje nuevoNombre: elNuevoNombre [

	|unViaje|
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje nombre: elNuevoNombre ]. 
]

{ #category : #propios }
EmpresaTurismo >> pagarCuotasContratoCantCuotas: laCantCuotas NumContrato:numContrato DniCliente: dniCliente [
	(self buscarCliente: dniCliente) ifNotNil: [(self buscarCliente: dniCliente) verificarContratoYPagarCantCuotas: laCantCuotas NumContrato: numContrato].
]

{ #category : #'as yet unclassified' }
EmpresaTurismo >> quitarEtapa: elViaje laEtapa: laEtapa [

	| unViaje |
	unViaje := self buscarViaje: elViaje.
	unViaje ifNotNil: [ unViaje quitarEtapa: laEtapa ]
]
