import wollok.game.*
import dialogos.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*

object batalla {
	var property mapas = 0
	method mapear() {return mapas}
	var property pokemonEnemigo  = new Pokemon()
	var property pokemonAliado = new Pokemon()
	var pokemonsEnemigos = null
	var property enemigo = null
	var property pokemonRestantes = null
	const musicaBatalla1 = game.sound("battle.mp3")
	const musicaBatalla2 = game.sound("battleleyenda.mp3")
	method parar1(){
		if(musicaBatalla1.played())game.schedule(100,{musicaBatalla1.stop()})
    }
	method parar2(){
		if(musicaBatalla2.played())game.schedule(100,{musicaBatalla2.stop()})
    }
	method iniciar (npc){
		game.clear()
		nivelCentral.descargar()
		nivelDerecha.descargar()
		nivelIzquierda.descargar()
		nivelArriba.descargar()
		personaje.ocupado(false)
		enemigo = npc
		pokemonsEnemigos = enemigo.pokemonTeam()
		pokemonEnemigo = pokemonsEnemigos.first()
		paredesMenu.generar()
		if(self.mapas()==1){game.addVisual(new ElementoInterfaz(image="fondobatallacentral.jpg", position = game.at(0,0)))}
		if(self.mapas()==2){game.addVisual(new ElementoInterfaz(image="fondobatalladerecha.jpg", position = game.at(0,0)))}
		if(self.mapas()==3){game.addVisual(new ElementoInterfaz(image="fondobatallaizquierda.jpg", position = game.at(0,0)))}
		if(self.mapas()==4){game.addVisual(new ElementoInterfaz(image="fondobatallaarriba.jpg", position = game.at(0,0)))}
		game.addVisual(new ElementoInterfaz(image="menu.png", position = game.at(0,0)))
		musicaBatalla1.shouldLoop(true)
    	if(!musicaBatalla1.played()&&self.mapas()==1)game.schedule(500,{musicaBatalla1.play()})
		if(!musicaBatalla1.played()&&self.mapas()==2)game.schedule(500,{musicaBatalla1.play()})
		if(!musicaBatalla1.played()&&self.mapas()==3)game.schedule(500,{musicaBatalla1.play()})
		if(!musicaBatalla2.played()&&self.mapas()==4)game.schedule(500,{musicaBatalla2.play()})
		if(personaje.pokemonVivos().isEmpty()){
			self.terminar()
			throw new Exception(message= "No tienes ningun pokemon para pelear...")
		}
		pokemonAliado = personaje.pokemonVivos().first()
		game.addVisual(pokemonAliado)
		game.addVisual(vidaAliado)
		self.actualizarMoveset()
		game.addVisual(move1)
		game.addVisual(move2)
		game.addVisual(move3)
		game.addVisual(move4)
		game.addVisual(pokemonEnemigo)
		game.addVisual(vidaEnemigo)
		vidaEnemigo.actualizar()
		game.addVisual(seleccionarSkill)
		keyboard.up().onPressDo{if (game.height()-13 > seleccionarSkill.position().y())
			seleccionarSkill.irVertical(arriba)
			game.sound("button.mp3").play()}
		keyboard.down().onPressDo{if (game.height()-14 < seleccionarSkill.position().y())
			seleccionarSkill.irVertical(abajo)
			game.sound("button.mp3").play()}
		keyboard.left().onPressDo{if (game.width()-14 < seleccionarSkill.position().x())
			seleccionarSkill.irHorizontal(izquierda)
			game.sound("button.mp3").play()}
		keyboard.right().onPressDo{if (game.width()-10 > seleccionarSkill.position().x())
			seleccionarSkill.irHorizontal(derecha)
			game.sound("button.mp3").play()}
		keyboard.z().onPressDo{seleccionarSkill.interactuar()
			game.sound("button.mp3").play()}
		keyboard.x().onPressDo{self.siguientePokemon()}
		keyboard.u().onPressDo({self.terminar()})

	const position = game.at(0,0)
	const ancho = game.width() - 1
	const largo = game.height() - 1
	const posParedes = []
	(0 .. 6).forEach{ n => posParedes.add(new Position(x=n, y=0)) }
	(0 .. 6).forEach{ n => posParedes.add(new Position(x=n, y=3)) }
	(0 .. 3).forEach{ n => posParedes.add(new Position(x=0, y=n)) }
	(0 .. 3).forEach{ n => posParedes.add(new Position(x=6, y=n)) }
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
	method siguientePokemon(){
		game.removeVisual(pokemonAliado)
		game.removeVisual(vidaAliado)
		personaje.pokemonTeam().randomize()
		pokemonAliado = personaje.pokemonVivos().first()
		game.sound("change.mp3").play()
		vidaAliado.actualizar()
		game.addVisual(pokemonAliado)
		game.addVisual(vidaAliado)
		self.actualizarMoveset()
		enemigo.ocupado(false)
	}
	method pokemonKO (quePokemon){
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
				game.removeVisual(vidaAliado)
				pokemonAliado = pokemonRestantes.first()
				game.addVisual(pokemonAliado)
				vidaAliado.actualizar()
				game.addVisual(vidaAliado)
				self.actualizarMoveset()
				enemigo.ocupado(false)
				personaje.ocupado(false)
			}
		}
	}
	method terminar(){
		enemigo.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
		self.parar1()
		game.clear()
		if(self.mapas()==1){nivelCentral.cargar()}
		if(self.mapas()==2){nivelDerecha.cargar()}
		if(self.mapas()==3){nivelIzquierda.cargar()}
		if(self.mapas()==4){nivelArriba.cargar()}
		self.derrotado(enemigo)
		personaje.ocupado(false)
	}
	method derrotado(poke){
		enemigo.perder()
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

object vidaAliado {
	var property numero = batalla.pokemonAliado().hpActual()
	var property position = game.at(8,5)
	method image() = numero.toString() + ".png"
	method actualizar () {numero = batalla.pokemonAliado().hpActual()}
}

object vidaEnemigo {
	var property numero = batalla.pokemonEnemigo().hpActual()
	var property position = game.at(1,12)
	method image() = numero.toString() + ".png"
	method actualizar () {numero = batalla.pokemonEnemigo().hpActual()}
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
	position = game.at(1,2)
){}

object move2 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(1),
	numero = 1,
	position = game.at(5,2)
){}

object move3 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(2),
	numero = 2,
	position = game.at(1,1)
){}

object move4 inherits Move (
	nombre = batalla.pokemonAliado().moveset().get(3),
	numero = 3,
	position = game.at(5,1)
){}

object seleccionarSkill{
	var property position = game.at(1,2)
	var property direccion = izquierda
	method direcciona() {return direccion}
	method image() = "seleccionar.png"
	method irHorizontal(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse(4)
	}
	method irVertical(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse(1)
	}
	method moverse (cantidad){
		if(!personaje.ocupado() && !batalla.enemigo().ocupado() && game.getObjectsIn(direccion.avanzar(position,cantidad)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,cantidad)
		}
	}
	method interactuar (){
		if (!personaje.ocupado() && !batalla.enemigo().ocupado()){
			batalla.pokemonAliado().owner().ocupado(true)
			batalla.pokemonEnemigo().atacar(self.deducirAtaque(batalla.pokemonEnemigo()),batalla.pokemonAliado())
			if(vidaAliado.numero() > 0){game.schedule(5000,{batalla.pokemonAliado().atacar(self.deducirAtaque(batalla.pokemonAliado()),batalla.pokemonEnemigo())})}
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
