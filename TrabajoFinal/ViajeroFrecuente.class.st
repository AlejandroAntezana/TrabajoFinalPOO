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
ViajeroFrecuente >> inicializar: unApellido dni: undni ciudadResidencia: unaCiudad mail: unMail telefono: unTel preferencias: lasPref [

	apellido := unApellido.
	dni := undni.
	ciudadResidencia := unaCiudad.
	mail := unMail.
	telefono := unTel.
	colContratos := OrderedCollection new.
	millasAcumuladas := 0.
	
]

{ #category : #accessing }
ViajeroFrecuente >> millasAcumuladas [
 ^ millasAcumuladas.
]
