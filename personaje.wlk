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
	method esAtravesable() = false
	method image() = "water2.gif"
}

class Rio {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method esAtravesable() = false
	method image() = "river.gif"
}

class Cascada {
	const property position
	method movete(direccion) { }
	method puedePisarte(_) = false
	method esAtravesable() = false
	method image() = "waterfall.gif"
}

class Pared {
	var property position
	method movete(direccion) {
		throw new DomainException(message = "No puedo pasar por aqui.", source = personaje)
	}
	method puedePisarte(_) = false
	method esAtravesable() = false
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

class Teleport {
	var property position
	var property destino
	method image() = ""
	method esAtravesable() = true
}

object teleports{
	var property listaTps1 = []
	var property listaTps2 = []
	var property listaTps3 = []
	var property listaTps4 = []
	var property listaTps5 = []
	var property listaTps6 = []
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
	method generarCentral() {
		listaTps1.add(new Teleport(position = new Position(x=14,y=7),destino = new Position(x=1, y=7)))
		listaTps1.add(new Teleport(position = new Position(x=14,y=8),destino = new Position(x=1, y=8)))
		listaTps2.add(new Teleport(position = new Position(x=0,y=7),destino = new Position(x=13, y=7)))
		listaTps2.add(new Teleport(position = new Position(x=0,y=8),destino = new Position(x=13, y=8)))
		listaTps3.add(new Teleport(position = new Position(x=6,y=14),destino = new Position(x=6, y=1)))
		listaTps3.add(new Teleport(position = new Position(x=7,y=14),destino = new Position(x=7, y=1)))
		listaTps3.add(new Teleport(position = new Position(x=8,y=14),destino = new Position(x=8, y=1)))
		listaTps1.forEach {teleport=>game.addVisual(teleport)}
		listaTps1.forEach{tp=>game.whenCollideDo(tp,{personaje=>personaje.position(tp.destino())})
		self.irDerecha()}
		listaTps2.forEach {teleport=>game.addVisual(teleport)}
		listaTps2.forEach{tp=>game.whenCollideDo(tp,{personaje=>personaje.position(tp.destino())})
		self.irIzquierda()}
		listaTps3.forEach {teleport=>game.addVisual(teleport)}
		listaTps3.forEach{tp=>game.whenCollideDo(tp,{personaje=>personaje.position(tp.destino())})
		self.irArriba()}
	}
	method generarDerecha() {
		listaTps4.add(new Teleport(position = new Position(x=0,y=7),destino = new Position(x=13, y=7)))
		listaTps4.add(new Teleport(position = new Position(x=0,y=8),destino = new Position(x=13, y=8)))
		listaTps4.forEach {teleport=>game.addVisual(teleport)}
		listaTps4.forEach{tp=>game.whenCollideDo(tp,{personaje=>personaje.position(tp.destino())})
		self.irCentral()}
	}
	method generarIzquierda() {
		listaTps5.add(new Teleport(position = new Position(x=14,y=7),destino = new Position(x=1, y=7)))
		listaTps5.add(new Teleport(position = new Position(x=14,y=8),destino = new Position(x=1, y=8)))
		listaTps5.forEach {teleport=>game.addVisual(teleport)}
		listaTps5.forEach{tp=>game.whenCollideDo(tp,{personaje=>personaje.position(tp.destino())})
		self.irCentral()}
	}
	method generarArriba() {
		listaTps6.add(new Teleport(position = new Position(x=6,y=0),destino = new Position(x=6, y=13)))
		listaTps6.add(new Teleport(position = new Position(x=7,y=0),destino = new Position(x=6, y=13)))
		listaTps6.add(new Teleport(position = new Position(x=8,y=0),destino = new Position(x=6, y=13)))
		listaTps6.forEach {teleport=>game.addVisual(teleport)}
		listaTps6.forEach{tp=>game.whenCollideDo(tp,{personaje=>personaje.position(tp.destino())})
		self.irCentral()}
	}
}