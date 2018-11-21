import obrero.*
class Obra {
	var property obreros= #{}
		var property stockLadrillo= 0
		var property stockCanio=0
		var property stockCable=0
		var property stockCinta=0
		var property stockFosforo=0
		var property stockArandela=0
		
		var property ladrilloPedido=0
		var property canioPedido=0
		var property cablePedido=0
		var property cintaPedido=0
		var property fosforoPedido=0
		var property arandelaPedido=0
		
		var property metrosCuadradosPared=0
		var property implementosGas=0
		var property implementosAgua=0
		var property metrosCableElectrico=0
		
		var property efectivo= 100000
	
	method obrerosDisponibles() {
		
		return obreros.filter {obrero => not obrero.estaDeLicencia()}
	}
	
	method agregarObrero(obrero) {
		
		obreros.add(obrero)
		obrero.agregarObra(self)
	}
	
	method renunciaObrero(obrero) {
		
		if (not (obrero.estaDeLicencia()))
		
		{obreros.remove(obrero)}
		
		else {self.error("Las leyes laborales están para respetarse - licencia implica estabilidad laboral")}
	}
	method registrarJornadaLaboral() {
		
				if (not (self.obrerosDisponibles().isEmpty()))
		{self.obrerosDisponibles().forEach{obrero => self.modificarStockYRecepcion(obrero)}}
			
				else { self.error("No hay obreros disponibles para trabajar")}
	}
	
	method modificarStockYRecepcion(obrero) {
		
		metrosCuadradosPared += obrero.metrosDePared()
		implementosGas += obrero.implementoGas()
		implementosAgua += obrero.implementoAgua()
		metrosCableElectrico += obrero.metrosDeCableElectrico()
		
		stockLadrillo-= obrero.ladrillos()
		stockCanio-= obrero.metrosDeCanio()
		stockCable-= obrero.metrosDeCable()
		stockCinta-= obrero.cintaAisladora()
		stockFosforo-= obrero.fosforos()
		stockArandela-= obrero.arandelas()
		
		ladrilloPedido =+ obrero.ladrillos()
		canioPedido =+ obrero.metrosDeCanio()
		cablePedido =+ obrero.metrosDeCable()
		cintaPedido =+ obrero.cintaAisladora()
		fosforoPedido =+ obrero.fosforos()
		arandelaPedido =+ obrero.arandelas()
		

		
		obrero.jornalesAdeudados(obrero.jornalesAdeudados()+1)
	}
	
	method tieneAObrero(obrero) {
		
		return obreros.contains(obrero)
		
	}
	
	method implementosDeAguaNecesarios() =0
	method implementosDeGasNecesarios() =0
	method metrosDeCablesElectricosNecesarios()=0
	
	
	
	method metrosCuadradosListo() {return metrosCuadradosPared >= self.metrosCuadradosNecesarios()}
	method implementosDeAguaListo() {return implementosAgua >= self.implementosDeAguaNecesarios()} 
	method implementosDeGasListo(){return implementosGas >= self.implementosDeGasNecesarios()}
	method metrosDeCablesElectricosListo(){return metrosCableElectrico >= self.metrosDeCablesElectricosNecesarios()}
	
	method estaTerminada() {return self.metrosCuadradosListo() and self.implementosDeAguaListo()
							and self.implementosDeGasListo() and self.metrosDeCablesElectricosListo()
	}
	
	
	method totalDeuda() {return obreros.sum{obrero => obrero.totalDeudaSueldo(uocra)}}
	
	method registrarPago() {obreros.forEach{obrero=> efectivo -= obrero.totalDeudaSueldo(uocra)
													obrero.jornalesAdeudados(0)
	}}

	method metrosCuadradosNecesarios() {return self.habitacionesTotales() * 50}
	
	method habitacionesTotales() 
	
}



class Casa inherits Obra {
	
	var property cantHabitaciones
	var property cantBanios
	
	override method habitacionesTotales() { return cantHabitaciones }
	
	override method implementosDeAguaNecesarios() {return cantBanios * 10}
	
	override method implementosDeGasNecesarios() {return cantBanios * 8 + cantHabitaciones * 3}
	
	override method metrosDeCablesElectricosNecesarios() {return cantHabitaciones * 50 + 100}
	
	
}

class Edificio inherits Obra{
	
	var property cantPisos
	var property departamentosPorPiso
	var property habitacionesPorDepartamento = 0
	var property cantAscensores
	const property baniosPorDepto = 1
	
	method departamentosTotales() {return cantPisos * departamentosPorPiso}
	
	override method habitacionesTotales() {return self.departamentosTotales() * habitacionesPorDepartamento}
	
	method baniosTotales() {return self.habitacionesTotales() * baniosPorDepto}
		
	override method implementosDeAguaNecesarios() {return self.baniosTotales() * 10}
	
	override method implementosDeGasNecesarios() {
		
				return self.baniosTotales() * 8 + self.habitacionesTotales() * 3
	}
	override method metrosDeCablesElectricosNecesarios() {
		
				return self.habitacionesTotales() * 50 + cantPisos * 100 + cantAscensores * 300
	}
}
