Class {
	#name : #ViajeroFrecuente,
	#superclass : #Cliente,
	#instVars : [
		'millasAcumuladas'
	],
	#category : #TrabajoFinal
}

{ #category : #accessing }
ViajeroFrecuente >> añadirMillas: millasAñadidas [

	millasAcumuladas := millasAcumuladas + millasAñadidas
]

{ #category : #initialization }
ViajeroFrecuente >> inicializar: unDni apellido: unApellido ciudadResidencia: unaCiudad mail: unMail telefono: unTel [

	dni := unDni.
	apellido := unApellido.
	ciudadResidencia := unaCiudad.
	mail := unMail.
	telefono := unTel.
	preferencias := ''.
	colContratos := OrderedCollection new.
	millasAcumuladas := 0.
]

{ #category : #accessing }
ViajeroFrecuente >> millasAcumuladas [
 ^ millasAcumuladas.
]
