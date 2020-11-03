import comidas.*
import comensales.*

object cocina {
	const property todasLasComidas = []
	
	method todasLasComidasVegetarianas() { return todasLasComidas.filter({ comida=> comida.esAptoVegetariano() }) }
	method cantidadComidasVegetarianas() { return self.todasLasComidasVegetarianas().size() }
	
	method todasLasComidasNoVegetarianas() { return todasLasComidas.filter({ comida=> not comida.esAptoVegetariano() }) }
	method cantidadComidasNoVegetarianas() { return self.todasLasComidasNoVegetarianas().size() }
	 
	method buenaOfertaVegatariana() {
		return (self.cantidadComidasVegetarianas() - self.cantidadComidasNoVegetarianas()).abs().between(0,2)  	
	}
	
	method platoFuerteCarnivoro() {
		return self.todasLasComidasNoVegetarianas().max( {comida=> comida.valoracion()} )
	}
	
	method unPlatoPara(comensal) { return todasLasComidas.find( comensal.comidas().any{ {comida=> comensal.leAgrada(comida)} } ) }
	method elegirPlato(comensal) {
			if (not self.unPlatoPara(comensal).isEmpty()) {
				todasLasComidas.remove(self.unPlatoPara(comensal))
			} else { self.error('No hay ningún plato que le guste al comensal')}
	}
}