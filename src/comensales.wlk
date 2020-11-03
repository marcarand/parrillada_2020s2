import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method satisfecho() { return comidas.sum( {comida => comida.peso()} ) >= (peso*0.01) }
}

class Vegetariano inherits Comensal {
	override method leAgrada(unaComida) { return unaComida.esAptoVegetariano() and (unaComida.valoracion() > 85) }
	override method satisfecho() { return super() and comidas.all( {comida => not comida.esAbundante()} )}
}

class HambrePopular inherits Comensal {
	override method leAgrada(unaComida) { return unaComida.esAbundante() }
}

class DePaladarFina inherits Comensal {
	// valoracion peso.between(150,300)
	override method leAgrada(unaComida) { return unaComida.peso().between(150,300) and (unaComida.valoracion() > 100) }
}