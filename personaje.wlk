import wollok.game.*
import batalla.*
import movimientos.*
import nivel.*
import npc.*
import pokemon.*
import tipo.*

object personaje {
	var property position = game.at(7,2)
	method image ()= "" + direccion.image()
	var property direccion = arriba
	var property ocupado = false
	var property pokemonTeam = []
	method ir(nuevaDireccion){
		if(!ocupado){
			direccion = nuevaDireccion
			self.moverse()
		}
	}
	method moverse (){
		if(game.getObjectsIn(direccion.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,1)
		}
	}
	method interactuar (){
		game.getObjectsIn(direccion.avanzar(position,1)).forEach({npc=>if(!ocupado){npc.interactuar()}})
	}
	method agregarPokemon(poke){
		poke.statsBase()
		pokemonTeam.add(poke)
	}
	method pokemonVivos (){
		return pokemonTeam.filter({pokemon=>pokemon.estaVivo()})
	}
}
object izquierda {
	method opuesta() = npcDerecha
	method image() {return "personajeIzquierda.png"}
	method avanzar (position,cantidad) {return position.left(cantidad)}
}
object derecha {
	method opuesta() = npcIzquierda
	method image() {return "personajeDerecha.png"}
	method avanzar (position,cantidad) {return position.right(cantidad)}
}
object arriba {
	method opuesta() = npcAbajo
	method image() {return "personajeArriba.png"}
	method avanzar (position,cantidad) {return position.up(cantidad)}
}
object abajo {
	method opuesta() = npcArriba
	method image() {return "personajeAbajo.png"}
	method avanzar (position,cantidad) {return position.down(cantidad)}
}

class Agua {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = true
	method image() = "water2.gif"
}

class Rio {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method image() = "river.gif"
}

class Cascada {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method image() = "waterfall.gif"
}

class Pared {
	var property position
	method movete(direccion) {
		throw new DomainException(message = "No puedo pasar por aqui.", source = personaje)
	}
	method puedePisarte(_) = false
}

object paredesMenu {
	method generar(){
		const ancho = game.width() 
		const largo = game.height() 
		const posParedes = []
		(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=0)) }
		(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=5)) }
		(0 .. 5).forEach{ n => posParedes.add(new Position(x=0, y=n)) }
		(0 .. 5).forEach{ n => posParedes.add(new Position(x=9, y=n)) }
		posParedes.forEach { p => game.addVisual(new Pared(position = p))}
	}
	method puedePisarte(_) = false
}