import wollok.game.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*

object batalla {
	var property pokemonEnemigo  = new Pokemon()
	var property pokemonAliado = new Pokemon()
	var pokemonsEnemigos = null
	var property enemigo = null
	method iniciar (npc){
		game.clear()
		personaje.ocupado(false)
		enemigo = npc
		pokemonsEnemigos = enemigo.pokemonTeam()
		pokemonEnemigo = pokemonsEnemigos.first()
		paredesMenu.generar()
		game.addVisual(new ElementoInterfaz(image="fondobatalla.jpg", position = game.at(0,0)))
		game.addVisual(new ElementoInterfaz(image="menu2.png", position = game.at(0,0)))
		if(personaje.pokemonVivos().isEmpty()){
			self.terminar()
			throw new Exception(message= "No tienes ningun pokemon para pelear")
		}
		pokemonAliado = personaje.pokemonVivos().first()
		game.addVisual(pokemonAliado)
		self.actualizarMoveset()
		game.addVisual(move1)
		game.addVisual(move2)
		game.addVisual(move3)
		game.addVisual(move4)
		game.addVisual(pokemonEnemigo)
		game.addVisual(seleccionarSkill)
		keyboard.up().onPressDo{if (game.height()-26 > seleccionarSkill.position().y())
			seleccionarSkill.irVertical(arriba)
			game.sound("button.mp3").play()}
		keyboard.down().onPressDo{if (game.height()-29 < seleccionarSkill.position().y())
			seleccionarSkill.irVertical(abajo)
			game.sound("button.mp3").play()}
		keyboard.left().onPressDo{if (game.width()-39 < seleccionarSkill.position().x())
			seleccionarSkill.irHorizontal(izquierda)
			game.sound("button.mp3").play()}
		keyboard.right().onPressDo{if (game.width()-32 > seleccionarSkill.position().x())
			seleccionarSkill.irHorizontal(derecha)
			game.sound("button.mp3").play()}
		keyboard.z().onPressDo{seleccionarSkill.interactuar()
			game.sound("button.mp3").play()}
		keyboard.x().onPressDo{seleccionarSkill.atras()}
		keyboard.u().onPressDo({self.terminar()})
	const position = game.at(0,0)
	const ancho = game.width() - 1
	const largo = game.height() - 1
	const posParedes = []
	(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=0)) }
	(0 .. 9).forEach{ n => posParedes.add(new Position(x=n, y=5)) }
	(0 .. 5).forEach{ n => posParedes.add(new Position(x=0, y=n)) }
	(0 .. 5).forEach{ n => posParedes.add(new Position(x=9, y=n)) }
	posParedes.forEach { p => game.addVisual(new Pared(position = p))}
	posParedes.forEach({ posParedes => self.dibujar(new Pared(position = posParedes)) })
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	method actualizarMoveset (){
		move1.actualizar()
		move2.actualizar()
		move3.actualizar()
		move4.actualizar()
	}
	method pokemonKO (quePokemon){
		var pokemonRestantes
		if (quePokemon == pokemonEnemigo){
			pokemonRestantes = pokemonsEnemigos.filter({pokemon=>pokemon.estaVivo()})
			if (pokemonRestantes.isEmpty()){
				enemigo.perdio(true)
				self.terminar()
			} 	else{
				game.removeVisual(pokemonEnemigo)
				pokemonEnemigo = pokemonRestantes.first()
				game.addVisual(pokemonEnemigo)
				personaje.ocupado(false)
			}
		}else{
			pokemonRestantes = personaje.pokemonTeam().filter({pokemon=>pokemon.estaVivo()})
			if(pokemonRestantes.isEmpty()) self.terminar()	else{
				game.removeVisual(pokemonAliado)
				pokemonAliado = pokemonRestantes.first()
				game.addVisual(pokemonAliado)
				self.actualizarMoveset()
				enemigo.ocupado(false)
			}
		}
	}
	method terminar(){
		enemigo.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
		game.clear()
		nivel1.cargar()
		personaje.ocupado(false)
	}
	method elPokemonMasRapido() {
		if (pokemonEnemigo.spe() > pokemonAliado.spe()) return pokemonEnemigo else return pokemonAliado 
	}
	method elPokemonMasLento(){
		if (pokemonEnemigo.spe() <= pokemonAliado.spe()) return pokemonEnemigo else return pokemonAliado 		
	}
}

class ElementoInterfaz{
	var property image
	var property position = game.origin()
}

class Move{
	var property esMove = true
	var property nombre
	var property numero
	var property position
	method image () = nombre.image()
	method esAtravesable () = true
	method actualizar () {nombre = batalla.pokemonAliado().moveset().get(numero)}
}

object move1 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(0),
	numero = 0,
	position = game.at(1,4)
){}

object move2 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(1),
	numero = 1,
	position = game.at(8,4)
){}

object move3 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(2),
	numero = 2,
	position = game.at(1,1)
){}

object move4 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(3),
	numero = 3,
	position = game.at(8,1)
){}

object seleccionarSkill{
	var property position = game.at(1,4)
	var property direccion = izquierda
	method direcciona() {return direccion}
	method image() = "seleccionar.png"
	method irHorizontal(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse(7)
	}
	method irVertical(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse(3)
	}
	method moverse (cantidad){
		if(!personaje.ocupado() && !batalla.enemigo().ocupado() && game.getObjectsIn(direccion.avanzar(position,cantidad)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,cantidad)
		}
	}
	method interactuar (){
		if (!personaje.ocupado() && !batalla.enemigo().ocupado()){
			batalla.elPokemonMasRapido().owner().ocupado(true)
			batalla.elPokemonMasRapido().atacar(self.deducirAtaque(batalla.elPokemonMasRapido()),batalla.elPokemonMasLento())
			game.schedule(5000,{if(!batalla.elPokemonMasRapido().owner().ocupado())batalla.elPokemonMasLento().atacar(self.deducirAtaque(batalla.elPokemonMasLento()),batalla.elPokemonMasRapido())})
		}
	}
	method deducirAtaque(quienAtaca){
		if (quienAtaca == batalla.pokemonAliado()) return game.getObjectsIn(position).find({elemento=>elemento/*.respondsTo("esMove") && elemento*/.esMove()}).nombre() else {
			if ((1 .. 100).anyOne() <= batalla.pokemonEnemigo().owner().iq()){
				return batalla.pokemonEnemigo().moveset().max({ataque=>batalla.pokemonAliado().calcularEficacia(ataque)})
			}
			const random = new Range (start = 0, end = batalla.pokemonEnemigo().moveset().size()-1).anyOne()
			return batalla.pokemonEnemigo().moveset().get(random)
		} 
	}
	method atras(){}
}