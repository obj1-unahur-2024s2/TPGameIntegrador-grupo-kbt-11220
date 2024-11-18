import wollok.game.*
import batalla.*
import movimientos.*
import nivel.*
import personaje.*
import pokemon.*
import tipo.*

class Npc{
	var property direccion = npcAbajo
	var property pokemonTeam = []
	var property ocupado = false
	var property cumplioProposito = false
	method esAtravesable() = false
	method mirarpersonaje (){
		direccion = personaje.direccion().opuesta()
	}
	method hablar(mensaje){
		self.mirarpersonaje()
		game.say(self,mensaje)
	}
	method agregarPokemon(poke){
		poke.statsBase()
		pokemonTeam.add(poke)
	}
}

object npcIzquierda {
	method opuesta() = npcDerecha
	method image() {return "Izquierda.png"}
	method avanzar (position,cantidad) {return position.left(cantidad)}
}
object npcDerecha {
	method opuesta() = npcIzquierda
	method image() {return "Derecha.png"}
	method avanzar (position,cantidad) {return position.right(cantidad)}
}
object npcArriba {
	method opuesta() = npcAbajo
	method image() {return "Arriba.png"}
	method avanzar (position,cantidad) {return position.up(cantidad)}
}
object npcAbajo {
	method opuesta() = npcArriba
	method image() {return "Abajo.png"}
	method avanzar (position,cantidad) {return position.down(cantidad)}
}

object enfermeraJoy inherits Npc{
	var property npcDireccion = npcAbajo
	method position () = game.at(5,6)
	method image () = "Joy" + npcDireccion.image()
	method interactuar(){
		personaje.ocupado(true)
		self.hablar("Bienvenido a la Zona Safari! Dejame recuperar tu salud.")
		game.sound("heal.mp3").play()
		game.schedule(2000, {personaje.ocupado(false)})
		personaje.pokemonTeam().forEach{pokemon=>pokemon.recuperarse()}
	}
}

object profesorOak inherits Npc{
	var property npcDireccion = npcAbajo
	method image () = "Oak" + npcDireccion.image()
	method position () = game.at(7,4)
	method interactuar (){
		personaje.ocupado(true)
		self.hablar("Bienvenido! Aqui tienes tus 3 Pokemon. Comienza tu aventura!")
		game.sound("button.mp3").play()
		if(!cumplioProposito){
			personaje.agregarPokemon(new Torterra(owner=personaje))
			personaje.agregarPokemon(new Blaziken(owner=personaje))
			personaje.agregarPokemon(new Lanturn(owner=personaje))
			cumplioProposito = true
		}
		if(cumplioProposito&&venusaur.perdio()&&pidgeot.perdio()&&victini.perdio()&&zweilous.perdio()&&lapras.perdio()&&butterfree.perdio()&&rotom.perdio()&&lairon.perdio()&&wigglytuff.perdio()&&sandile.perdio()&&shedinja.perdio()&&toxicroak.perdio()&&bastiodon.perdio()&&gardevoir.perdio()&&kyurem.perdio()){
		self.hablar("Felicidades! Has derrotado a todos los Pokemon!")
		game.sound("winner.mp3").play()
		game.clear()
		game.addVisual("fin.jpg").at(0,0)
		game.sound("ending.mp3").play()
		}
		game.schedule(2000,{personaje.ocupado(false)})
	}
}

object venusaur inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Venusaur(side="enemy",owner=self))
	}
	method image () = "Venusaur.png"
	method position () = game.at(35,12)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Saaaur!!!")
			game.sound("Venusaur.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Venu...")
			game.sound("Venusaur.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Venusaur(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object pidgeot inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 60
	method PokemonTeam(){
		self.agregarPokemon(new Pidgeot(side="enemy",owner=self))
	}
	method image () = "Pidgeot.png"
	method position () = game.at(36,23)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Pidgeoot!!!")
			game.sound("Pidgeot.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Piii...")
			game.sound("Pidgeot.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Pidgeot(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object victini inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 50
	method PokemonTeam(){
		self.agregarPokemon(new Victini(side="enemy",owner=self))
	}
	method image () = "Victini.png"
	method position () = game.at(4,26)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Victory!!!")
			game.sound("Victini.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Viii...")
			game.sound("Victini.mp3").play()
			if(!cumplioProposito){
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object zweilous inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Zweilous(side="enemy",owner=self))
	}
	method image () = "Zweilous.png"
	method position () = game.at(26,19)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Owwww!!!")
			game.sound("Zweilous.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Zzzz...")
			game.sound("Zweilous.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Zweilous(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object lapras inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 60
	method PokemonTeam(){
		self.agregarPokemon(new Lapras(side="enemy",owner=self))
	}
	method image () = "Lapras.png"
	method position () = game.at(34,5)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Laaaa!!!")
			game.sound("Lapras.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Lapras...")
			game.sound("Lapras.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lapras(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object rotom inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 15
	method PokemonTeam(){
		self.agregarPokemon(new Rotom(side="enemy",owner=self))
	}
	method image () = "Rotom.png"
	method position () = game.at(18,3)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Bzzzt!!!")
			game.sound("Rotom.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Bzzzt...")
			game.sound("Rotom.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Rotom(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object butterfree inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 30
	method PokemonTeam(){
		self.agregarPokemon(new Butterfree(side="enemy",owner=self))
	}
	method image () = "Butterfree.png"
	method position () = game.at(16,8)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Freeeee!!!")
			game.sound("Butterfree.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Free...")
			game.sound("Butterfree.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Butterfree(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object lairon inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Lairon(side="enemy",owner=self))
	}
	method image () = "Lairon.png"
	method position () = game.at(6,19)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Laaaaai!!!")
			game.sound("Lairon.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Grrr...")
			game.sound("Lairon.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Lairon(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object wigglytuff inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 40
	method PokemonTeam(){
		self.agregarPokemon(new Wigglytuff(side="enemy",owner=self))
	}
	method image () = "Wigglytuff.png"
	method position () = game.at(9,10)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Tuff!!!")
			game.sound("Wigglytuff.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Wiggly...")
			game.sound("Wigglytuff.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Wigglytuff(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object sandile inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 25
	method PokemonTeam(){
		self.agregarPokemon(new Sandile(side="enemy",owner=self))
	}
	method image () = "Sandile.png"
	method position () = game.at(24,6)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Chomp chomp!!!")
			game.sound("Sandile.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Chomp...")
			game.sound("Sandile.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Sandile(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object shedinja inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 50
	method PokemonTeam(){
		self.agregarPokemon(new Shedinja(side="enemy",owner=self))
	}
	method image () = "Shedinja.png"
	method position () = game.at(15,22)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("....!!!")
			game.sound("Shedinja.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar(".......")
			game.sound("Shedinja.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Shedinja(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object toxicroak inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 90
	method PokemonTeam(){
		self.agregarPokemon(new Toxicroak(side="enemy",owner=self))
	}
	method image () = "Toxicroak.png"
	method position () = game.at(23,14)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Croak croak!!!")
			game.sound("Toxicroak.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Croak...")
			game.sound("Toxicroak.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Toxicroak(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object bastiodon inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Bastiodon(side="enemy",owner=self))
	}
	method image () = "Bastiodon.png"
	method position () = game.at(11,26)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Aaargh!!!")
			game.sound("Bastiodon.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Grrr...")
			game.sound("Bastiodon.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Bastiodon(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object gardevoir inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 70
	method PokemonTeam(){
		self.agregarPokemon(new Gardevoir(side="enemy",owner=self))
	}
	method image () = "Gardevoir.png"
	method position () = game.at(28,13)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Weeeee!!!")
			game.sound("Gardevoir.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Wuuu...")
			game.sound("Gardevoir.mp3").play()
			if(!cumplioProposito){
				personaje.agregarPokemon(new Gardevoir(owner=personaje))
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}

object kyurem inherits Npc{
	var property npcDireccion = npcAbajo
	var property perdio = false
	var property iq = 100
	method PokemonTeam(){
		self.agregarPokemon(new Kyurem(side="enemy",owner=self))
	}
	method image () = "Kyurem.png"
	method position () = game.at(22,23)
	method interactuar (){
		personaje.ocupado(true)
		if (!perdio){
			self.hablar("Kyuuuu!!!")
			game.sound("Kyurem.mp3").play()
			self.PokemonTeam()
			game.schedule(2000,{batalla.iniciar(self)})
			perdio = true
		}else{
			self.hablar("Kyuuuu...")
			game.sound("Kyurem.mp3").play()
			if(!cumplioProposito){
				cumplioProposito = true
				}
			game.schedule(2000,{personaje.ocupado(false)})
		}
	}
}