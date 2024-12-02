import wollok.game.*
import batalla.*
import dialogos.*
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
		else{game.sound("bump.mp3").play()}
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

class Brillo {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = true
	method esAtravesable() = false
	method image() = "sparkle.gif"
	method interactuar (){}
}

class Luciernaga {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = true
	method esAtravesable() = true
	method image() = "firefly.gif"
	method interactuar (){}
}

class Agua {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = true
	method esAtravesable() = false
	method image() = "water2.gif"
	method interactuar (){}
}

class Rio {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method esAtravesable() = false
	method image() = "river.gif"
	method interactuar (){}
}

class Cascada {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method esAtravesable() = false
	method image() = "waterfall.gif"
	method interactuar (){}
}

class Pared {
	var property position
	method movete(direccion) {
		throw new DomainException(message = "No puedo pasar por aqui.", source = personaje)
	}
	method puedePisarte(_) = false
	method esAtravesable() = false
	method interactuar (){}
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
	method interactuar (){}
}

class Teleports {
	var property position
	method interactuar (){}
	method esAtravesable() = true
	method irDerecha(){
		game.clear()
		nivelDerecha.cargar()
	}
	method irIzquierda(){
		game.clear()
		nivelIzquierda.cargar()
	}
	method irArriba(){
		game.clear()
		nivelArriba.cargar()
	}
	method irCentral(){
		game.clear()
		nivelCentral.cargar()
	}
}
object teleport1A inherits Teleports(position = game.at(14,7)){}
object teleport2A inherits Teleports(position = game.at(14,8)){}
object teleport3A inherits Teleports(position = game.at(6,14)){}
object teleport4A inherits Teleports(position = game.at(7,14)){}
object teleport5A inherits Teleports(position = game.at(8,14)){}
object teleport6A inherits Teleports(position = game.at(0,7)){}
object teleport7A inherits Teleports(position = game.at(0,8)){}
object teleport1B inherits Teleports(position = game.at(0,7)){}
object teleport2B inherits Teleports(position = game.at(0,8)){}
object teleport3B inherits Teleports(position = game.at(6,0)){}
object teleport4B inherits Teleports(position = game.at(7,0)){}
object teleport5B inherits Teleports(position = game.at(8,0)){}
object teleport6B inherits Teleports(position = game.at(14,7)){}
object teleport7B inherits Teleports(position = game.at(14,8)){}