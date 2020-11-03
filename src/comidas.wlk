class Comida {
	
	method peso()
	method valoracion()
	method esAptoVegetariano()
	method esAbundante() { return self.peso() > 250 } 
}

class Provoleta inherits Comida {
	const property tieneEspecias
	const property peso
	
	override method esAptoVegetariano() { return not tieneEspecias }	
	override method valoracion() { return if (self.esEspecial()) {120} else {80} }
	method esEspecial() { return self.esAbundante() or tieneEspecias }
}

class HamburguesasCarne inherits Comida {
	const property peso = 250
	const property esAptoVegetariano = false
	const property tipoPan
	
	override method valoracion() { return 60 + tipoPan.valoracion()}
}

class HamburguesasVegetarianas inherits Comida {
	const property peso = 250
	const property esAptoVegetariano = true
	const property tipoPan
	const property legumbreUtilizada
	
	override method valoracion() { return 60 + tipoPan.valoracion() + (2 * legumbreUtilizada.size()).min(17) }
}

class Parrillada inherits Comida {
	const property cortesPedidos = []
	const property esAptoVegetariano = false
	
	override method valoracion() { return (15 * self.maxCalidadCortes()) - self.cantCortes().abs() }
	method maxCalidadCortes() { return cortesPedidos.max( {corte => corte.calidad()} ) }
	method cantCortes() { return cortesPedidos.size()}
	override method peso() { return cortesPedidos.sum( {corte => corte.peso()} ) }	
	
}

class CortesCarne {
	const property nombre
	const property calidad
	const property peso	
}


object panIndustrial {
	const property valoracion = 0
}
object panCasero {
	const property valoracion = 20
}
object panMasaMadre {
	const property valoracion = 45
}

 