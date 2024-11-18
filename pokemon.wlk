import wollok.game.*
import batalla.*
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
	var property spa=0
	var property spd=0
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
			return game.at(9,9)
		}else{
			return game.at(25,15)
		}
	}
	method posicionDeLaVida (){
		if (side == "ally"){
			return game.at(20,11)
		}else{
			return game.at(16,22)
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
		}
		else{
			game.schedule(2000,{game.say(objetivo,objetivo.name()+" esquivo el ataque.")})
			game.schedule(6000,{owner.ocupado(false)})
		}
	}
	
	method recibirDanio (ataque,pokemon){
		hpActual = (hpActual - self.danio(ataque,pokemon)).max(0)
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
		spa= self.calcularStat(spa)
		spd= self.calcularStat(spd)
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
		spa =2
		spd =2
		spe =80
		types=[planta,suelo]
		moveset = [hojasnavaja,rayosolar,terremoto,bofetonlodo]
		self.stats()
	}
}

class Blaziken inherits Pokemon{
	override method statsBase(){
		name ="Blaziken"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =80
		types=[fuego,lucha]
		moveset = [colmillofuego,lanzallamas,brazomartillo,esferaaural]
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
		spa =2
		spd =2
		spe =80
		types=[agua,electrico]
		moveset = [tajoacuatico,surf,colmillotrueno,chispa]
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
		spa =2
		spd =2
		spe =65
		types=[planta,veneno]
		moveset = [hojasnavaja,rayosolar,puyanociva,acido]
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
		spa =2
		spd =2
		spe =65
		types=[normal,volador]
		moveset = [cuchillada,hipervoz,ataqueala,tajoaereo]
		self.stats()
	}
}

class Victini inherits Pokemon{
	override method statsBase () {
		name ="Victini"
		hp  =15
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =90
		types=[psiquico,fuego]
		moveset = [cabezazozen,psicorrayo,colmillofuego,lanzallamas]
		self.stats()
	}
}

class Zweilous inherits Pokemon{
	override method statsBase () {
		name ="Zweilous"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[oscuro,dragon]
		moveset = [tajoumbrio,pulsoumbrio,garradragon,alientodragon]
		self.stats()
	}
}

class Lapras inherits Pokemon{
	override method statsBase () {
		name ="Lapras"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[agua,hielo]
		moveset = [tajoacuatico,surf,colmillohielo,rayohielo]
		self.stats()
	}
}
class Rotom inherits Pokemon{
	override method statsBase () {
		name ="Rotom"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[electrico,fantasma]
		moveset = [colmillotrueno,chispa,puniosombra,bolasombra]
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
		spa =2
		spd =2
		spe =65
		types=[bicho,volador]
		moveset = [megacuerno,rayosenial,ataqueala,tajoaereo]
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
		spa =2
		spd =2
		spe =65
		types=[acero,roca]
		moveset = [cabezahierro,metalaser,tumbaroca,poderpasado]
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
		spa =2
		spd =2
		spe =65
		types=[normal,hada]
		moveset = [cuchillada,hipervoz,juegorudo,vientofeerico]
		self.stats()
	}
}

class Sandile inherits Pokemon{
	override method statsBase () {
		name ="Sandile"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[suelo,oscuro]
		moveset = [terremoto,bofetonlodo,tajoumbrio,pulsoumbrio]
		self.stats()
	}
}
class Shedinja inherits Pokemon{
	override method statsBase () {
		name ="Shedinja"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[bicho,fantasma]
		moveset = [megacuerno,rayosenial,puniosombra,bolasombra]
		self.stats()
	}
}
class Toxicroak inherits Pokemon{
	override method statsBase () {
		name ="Toxicroak"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[veneno,lucha]
		moveset = [puyanociva,acido,brazomartillo,esferaaural]
		self.stats()
	}
}
class Bastiodon inherits Pokemon{
	override method statsBase () {
		name ="Bastiodon"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[roca,acero]
		moveset = [tumbaroca,poderpasado,cabezahierro,metalaser]
		self.stats()
	}
}
class Gardevoir inherits Pokemon{
	override method statsBase () {
		name ="Gardevoir"
		hp  =10
		hpActual = hp // hpActual inicia en el valor máximo
		atk =2
		def =2
		spa =2
		spd =2
		spe =65
		types=[psiquico,hada]
		moveset = [cabezazozen,psicorrayo,juegorudo,vientofeerico]
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
		spa =2
		spd =2
		spe =100
		types=[dragon,hielo]
		moveset = [garradragon,alientodragon,colmillohielo,rayohielo]
		self.stats()
	}
}