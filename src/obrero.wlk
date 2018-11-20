class Obrero {
	
	var property estaDeLicencia= false
	var property obras=#{}
	var property jornalesAdeudados = 0
	
	method agregarObra(obra)= obras.add(obra)
	
	method pasoPor(obra) {
		
		return obras.contains(obra)
		
	} 
	
	method ladrillos() = 0
	method metrosDeCanio() = 0
	method fosforos() = 0
	method arandelas() =0 
	method metrosDeCable()= 0
	method cintaAisladora()= 0
	
	method metrosDePared() = 0
	method implementoAgua() = 0
	method implementoGas() = 0
	method metrosDeCableElectrico() = 0
	
	method totalDeudaSueldo(uocra) {return jornalesAdeudados}
}


class Albanil inherits Obrero {
	
	 override method ladrillos() = 100
	 
	 override method metrosDePared() = 3
	 
	 override method totalDeudaSueldo(uocra) {return super(uocra) * uocra.sueldoAlbanil()}
	
}

class Gasista inherits Obrero {
	
	override method metrosDeCanio() =  3
	
	override method fosforos() = 20
	
	override method implementoGas()= 1
	
	override method totalDeudaSueldo(uocra) {return super(uocra) * uocra.sueldoEspecialistasBanioYCocina()}
		
} 

class Plomero inherits Obrero {
	
	override method metrosDeCanio() = 10
	
	override method arandelas() =  30
	
	override method implementoAgua() = 0.5
	
	override method totalDeudaSueldo(uocra) {return super(uocra) * uocra.sueldoEspecialistasBanioYCocina()}
	


}

class Electricista inherits Obrero {
	
	override method metrosDeCable() = 4
	
	override method cintaAisladora() = 1
	
	override method metrosDeCableElectrico() = 4	
	
	override method totalDeudaSueldo(uocra) {return super(uocra) * uocra.sueldoElectricistas()}
}


object uocra {
	
	method sueldoAlbanil() = 2000
	method sueldoEspecialistasBanioYCocina() = 	3000
	method sueldoElectricistas() = 3500
	
}