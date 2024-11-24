import wollok.game.*
import batalla.*
import dialogos.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import tipo.*

class Pokemon {
	var property owner=self
	var property name=""
	var property hp=0
	var property atk=0
	var property def=0
	var property spe=0
	var property types=[nulo,nulo]
	var property moveset = [ninguno,ninguno,ninguno,ninguno]
	var property side="ally"
	var property hpActual=10
	method image () = if (side == "ally"){
			return name + "3Dback.png"
		}else{
			return name + "3D.png"
		}
	method position (){
		if (side == "ally"){
			return game.at(1,4)
		}else{
			return game.at(8,7)
		}
	}
	method posicionDeLaVida (){
		if (side == "ally"){
			return game.at(8,5)
		}else{
			return game.at(1,12)
		}
	}
	method estaVivo () = hpActual != 0
	method recuperarse(){
		hpActual = hp
	}
	method elAtaqueAcerto (ataque, objetivo) = (1 .. 100).anyOne() <= ataque.accuracy()
	method atacar(ataque,objetivo){
		self.owner().ocupado(true)
		game.say(self, name + " ha usado " + ataque.name())
		game.sound("attack.mp3").play()
        if (self.elAtaqueAcerto(ataque, objetivo)){
			objetivo.recibirDanio (ataque,self)	
			vidaAliado.actualizar()
			vidaEnemigo.actualizar()
		}
		else{
			game.schedule(2000,{game.say(objetivo,objetivo.name()+" esquivo el ataque.")})
			game.schedule(6000,{owner.ocupado(false)})
		}
	}
	
	method recibirDanio (ataque,pokemon){
		hpActual = (hpActual - self.danio(ataque,pokemon)).max(0).round()
		if (self.hpActual() == 0){
				game.schedule(4000,{game.say(self, self.name() + " no puede continuar.")})
				game.schedule(6500,{batalla.pokemonKO(self)})
		} else game.schedule(6000,{pokemon.owner().ocupado(false)})
	}
	method danio(ataque,pokemon){
		return (((ataque.dmg()*ataque.type().conQueAtacar(pokemon)/ataque.type().conQueDefenderse(self)))*self.calcularMultiplicador(ataque,pokemon))
	}
	method calcularEficacia(ataque){
		var multiplicador = 1
		self.types().forEach({tipo=>multiplicador*=tipo.calcularMultiplicador (ataque.damagetype())})
		return multiplicador
	}
	method calcularMultiplicador(ataque,pokemon){
		var multiplicador= self.calcularEficacia(ataque)
		if (multiplicador == 0) game.schedule(2000,{game.say(self,"Es inmune al ataque!")})else{
			if (multiplicador >= 2) game.schedule(2000,{game.say(self,"Es super efectivo!")})
			if (multiplicador <= 0.5) game.schedule(2000,{game.say(self,"No es muy efectivo...")})
			if(multiplicador < 2 && multiplicador > 0.5) game.schedule(2000,{game.say(self,"El ataque dio en el blanco!")})
		}
		if (pokemon.types().contains(ataque.damagetype())) multiplicador *= 1.5
		multiplicador *= new Range(start = 85, end = 100).anyOne() / 100
		return multiplicador
	}
	method calcularStat (stat) = stat
	method stats(){
		hp= self.calcularStat(hp)
		atk= self.calcularStat(atk)
		def= self.calcularStat(def)
		spe = self.calcularStat(spe)
		hpActual=hp
	}
	method statsBase() {}
}

class Torterra inherits Pokemon{
	override method statsBase(){
		name ="Torterra"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =80
		types=[planta,suelo]
		moveset = [hojasnavaja,terremoto,cabezahierro,cuchillada]
	//	self.stats()
	}
}

class Blaziken inherits Pokemon{
	override method statsBase(){
		name ="Blaziken"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =80
		types=[fuego,lucha]
		moveset = [lanzallamas,brazomartillo,tumbaroca,tajoumbrio]
		self.stats()
	}
}

class Lanturn inherits Pokemon{
	override method statsBase(){
		name ="Lanturn"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =80
		types=[agua,electrico]
		moveset = [surf,chispa,rayosenial,bolasombra]
		self.stats()
	}
}

class Venusaur inherits Pokemon{
	override method statsBase(){
		name ="Venusaur"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =65
		types=[planta,veneno]
		moveset = [hojasnavaja,acido,tumbaroca,psicorrayo]
		self.stats()
	}
}

class Pidgeot inherits Pokemon{
	override method statsBase () {
		name ="Pidgeot"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =65
		types=[normal,volador]
		moveset = [cuchillada,ataqueala,vientofeerico,tajoumbrio]
	//	self.stats()
	}
}

class Lapras inherits Pokemon{
	override method statsBase () {
		name ="Lapras"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =65
		types=[agua,hielo]
		moveset = [surf,rayohielo,psicorrayo,alientodragon]
		self.stats()
	}
}

class Butterfree inherits Pokemon{
	override method statsBase () {
		name ="Butterfree"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =65
		types=[bicho,volador]
		moveset = [rayosenial,ataqueala,acido,chispa]
		self.stats()
	}
}

class Lairon inherits Pokemon{
	override method statsBase () {
		name ="Lairon"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =65
		types=[acero,roca]
		moveset = [cabezahierro,tumbaroca,terremoto,brazomartillo]
		self.stats()
	}
}

class Wigglytuff inherits Pokemon{
	override method statsBase () {
		name ="Wigglytuff"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =65
		types=[normal,hada]
		moveset = [cuchillada,vientofeerico,psicorrayo,chispa]
		self.stats()
	}
}

class Kyurem inherits Pokemon{
	override method statsBase () {
		name ="Kyurem"
		hp  =20
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spe =100
		types=[dragon,hielo]
		moveset = [alientodragon,rayohielo,bolasombra,lanzallamas]
		self.stats()
	}
}