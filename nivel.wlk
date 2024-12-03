import wollok.game.*
import batalla.*
import dialogos.*
import movimientos.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*

object pokeball {
    var property position = game.at(12, 14)
    method image() = "pokeball.gif"
}
object pokemonesCapturados {
    var numero = 0
    method sumar() {numero+=1}
    var property position = game.at(13, 14)
    method image() = "capturado" + numero.toString() + ".png"
}

object nivelCentral {
    var property number = 1
    var property name = "center"
    const musicaCentral = game.sound("musicaCentral.mp3")
    method descargar(){
        if(musicaCentral.played())game.schedule(100,{musicaCentral.stop()})
    }
	method cargar() {
        game.boardGround("nivelcentral.jpg")
        batalla.mapas(self.number())
        batalla.parar1()
        game.addVisual(new ElementoInterfaz(image="nivelcentral.jpg", position = game.at(0,0)))
        musicaCentral.shouldLoop(true)
        if(!musicaCentral.played())game.schedule(500,{musicaCentral.play()})
        const position = game.at(0,0)
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
        (0 .. 5).forEach({ n => posicionesParedes.add(new Position(x = n, y = 1))})
        (9 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 1))})
        (0 .. 5).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (9 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (0 .. 5).forEach({ n => posicionesParedes.add(new Position(x = n, y = 13)) })
        (9 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 13)) })
        (0 .. 6).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) })
        (9 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) })
        (0 .. 6).forEach({ n => posicionesParedes.add(new Position(x = 14, y = n)) })
        (9 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 14, y = n)) })
		posicionesParedes.addAll(
			[
			new Position(x = 1, y = 5)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
        //personaje
        game.addVisual(pokeball)
        game.addVisual(pokemonesCapturados)
		game.addVisual(personaje)
        game.addVisual(enfermeraJoy)
        game.addVisual(profesorOak)
        profesorOak.llamar()
        game.addVisual(venusaur)
        game.addVisual(pidgeot)
        game.addVisual(cartel)
        game.addVisual(teleport1A)
        game.onCollideDo(teleport1A,{personaje => teleport1A.irDerecha() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(1,7))})
        game.addVisual(teleport2A)
        game.onCollideDo(teleport2A,{personaje => teleport2A.irDerecha() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(1,8))})
        game.addVisual(teleport3A)
        game.onCollideDo(teleport3A,{personaje => teleport3A.irArriba() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(6,1))})
        game.addVisual(teleport4A)
        game.onCollideDo(teleport4A,{personaje => teleport4A.irArriba() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(7,1))})
        game.addVisual(teleport5A)
        game.onCollideDo(teleport5A,{personaje => teleport5A.irArriba() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(8,1))})
        game.addVisual(teleport6A)
        game.onCollideDo(teleport6A,{personaje => teleport6A.irIzquierda() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(13,7))})
        game.addVisual(teleport7A)
        game.onCollideDo(teleport7A,{personaje => teleport7A.irIzquierda() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(13,8))})
        //TECLADO
		keyboard.up().onPressDo{if (game.height()-1 > personaje.position().y()) personaje.ir(arriba)}
        keyboard.down().onPressDo{if (game.height()-14 < personaje.position().y()) personaje.ir(abajo)}
        keyboard.left().onPressDo{if (game.width()-15 < personaje.position().x()) personaje.ir(izquierda)}
        keyboard.right().onPressDo{if (game.width()-1 > personaje.position().x()) personaje.ir(derecha)}
        keyboard.z().onPressDo({personaje.interactuar()})
        keyboard.enter().onPressDo({juego.empezar()})
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}

object nivelDerecha {
    var property number = 2
    var property name = "right"
    const musicaDerecha = game.sound("musicaDerecha.mp3")
    method descargar(){
        if(musicaDerecha.played())game.schedule(100,{musicaDerecha.stop()})
    }
	method cargar() {
    	game.boardGround("nivelderecha.jpg")
        batalla.mapas(self.number())
        batalla.parar1()
        game.addVisual(new ElementoInterfaz(image="nivelderecha.jpg", position = game.at(0,0)))
        musicaDerecha.shouldLoop(true)
        if(!musicaDerecha.played())game.schedule(500,{musicaDerecha.play()})
        const position = game.at(0,0)
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 0))})
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 1))})
        (0 .. 6).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) })
        (9 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 14, y = n)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 13)) })
        (9 .. 13).forEach({ n => posicionesParedes.add(new Position(x = n, y = 12)) })
        (9 .. 13).forEach({ n => posicionesParedes.add(new Position(x = n, y = 11)) })
        (12 .. 13).forEach({ n => posicionesParedes.add(new Position(x = n, y = 10)) })
        (12 .. 13).forEach({ n => posicionesParedes.add(new Position(x = n, y = 9)) })
		posicionesParedes.addAll(
			[
			new Position(x = 4, y = 10),
            new Position(x = 12, y = 3)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
        //personaje
        game.addVisual(pokeball)
        game.addVisual(pokemonesCapturados)
		game.addVisual(personaje)
        game.addVisual(butterfree)
        game.addVisual(wigglytuff)
        game.addVisual(teleport1B)
        game.onCollideDo(teleport1B,{personaje => teleport1B.irCentral() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(13,7))})
        game.addVisual(teleport2B)
        game.onCollideDo(teleport2B,{personaje => teleport2B.irCentral() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(13,8))})
        //luciernagas
        const posicionesLuciernaga = []
        posicionesLuciernaga.addAll(
			[
			new Position(x = 9, y = 13),
            new Position(x = 13, y = 11),
            new Position(x = 2, y = 5)
			]
		)
        posicionesLuciernaga.forEach({ posicionLuciernaga => self.dibujar(new Luciernaga(position = posicionLuciernaga)) })
        //TECLADO
		keyboard.up().onPressDo{if (game.height()-1 > personaje.position().y()) personaje.ir(arriba)}
        keyboard.down().onPressDo{if (game.height()-15 < personaje.position().y()) personaje.ir(abajo)}
        keyboard.left().onPressDo{if (game.width()-15 < personaje.position().x()) personaje.ir(izquierda)}
        keyboard.right().onPressDo{if (game.width()-1 > personaje.position().x()) personaje.ir(derecha)}
        keyboard.z().onPressDo({personaje.interactuar()})
        keyboard.enter().onPressDo({juego.empezar()})
    }
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}

object nivelIzquierda {
    var property number = 3
    var property name = "left"
    const musicaIzquierda = game.sound("musicaIzquierda.mp3")
    method descargar(){
        if(musicaIzquierda.played())game.schedule(100,{musicaIzquierda.stop()})
    }
	method cargar() {
    	game.boardGround("nivelizquierda.jpg")
        batalla.mapas(self.number())
        batalla.parar1()
        game.addVisual(new ElementoInterfaz(image="nivelizquierda.jpg", position = game.at(0,0)))
        musicaIzquierda.shouldLoop(true)
        if(!musicaIzquierda.played())game.schedule(500,{musicaIzquierda.play()})
        const position = game.at(0,0)
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14))})
        (6 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 13))})
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 0)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = n, y = 1)) })
        (11 .. 13).forEach({ n => posicionesParedes.add(new Position(x = 1, y = n)) })
        (11 .. 13).forEach({ n => posicionesParedes.add(new Position(x = 3, y = n)) })
        (8 .. 13).forEach({ n => posicionesParedes.add(new Position(x = 6, y = n)) })
        (8 .. 12).forEach({ n => posicionesParedes.add(new Position(x = 7, y = n)) })
        (1 .. 3).forEach({ n => posicionesParedes.add(new Position(x = n, y = 8)) })
		posicionesParedes.addAll(
			[
			new Position(x = 5, y = 8),
            new Position(x = 12, y = 3),
            new Position(x = 12, y = 10),
            new Position(x = 12, y = 11),
            new Position(x = 10, y = 4),
            new Position(x = 10, y = 5),
			new Position(x = 9, y = 9)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
		//AGUA
		const posicionesAgua = []
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 1))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 2))})
        (1 .. 3).forEach({ n => posicionesAgua.add(new Position(x = n, y = 3))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 4))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 5))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 6))})
        posicionesAgua.forEach({ posicionAgua => self.dibujar(new Agua(position = posicionAgua)) })
        //RIO
        const posicionesRio = []
        (8 .. 12).forEach({ n => posicionesRio.add(new Position(x = 7, y = n))})
        posicionesRio.forEach({ posicionRio => self.dibujar(new Rio(position = posicionRio)) })
        //CASCADA
        const posicionesCascada = []
        (13 .. 14).forEach({ n => posicionesCascada.add(new Position(x = 7, y = n))})
        posicionesCascada.forEach({ posicionCascada => self.dibujar(new Cascada(position = posicionCascada)) })
        //personaje
        game.addVisual(pokeball)
        game.addVisual(pokemonesCapturados)
		game.addVisual(personaje)
        game.addVisual(lapras)
        game.addVisual(lairon)
        game.addVisual(teleport6B)
        game.onCollideDo(teleport6B,{personaje => teleport6B.irCentral() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(1,7))})
        game.addVisual(teleport7B)
        game.onCollideDo(teleport7B,{personaje => teleport7B.irCentral() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(1,8))})
        //TECLADO
		keyboard.up().onPressDo{if (game.height()-1 > personaje.position().y()) personaje.ir(arriba)}
        keyboard.down().onPressDo{if (game.height()-15 < personaje.position().y()) personaje.ir(abajo)}
        keyboard.left().onPressDo{if (game.width()-15 < personaje.position().x()) personaje.ir(izquierda)}
        keyboard.right().onPressDo{if (game.width()-1 > personaje.position().x()) personaje.ir(derecha)}
        keyboard.z().onPressDo({personaje.interactuar()})
        keyboard.enter().onPressDo({juego.empezar()})
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}

object nivelArriba {
    var property number = 4
    const musicaArriba = game.sound("musicaArriba.mp3")
    method descargar(){
        if(musicaArriba.played())game.schedule(100,{musicaArriba.stop()})
    }
	method cargar() {
    	game.boardGround("nivelarriba.jpg")
        batalla.mapas(self.number())
        batalla.parar1()
        batalla.parar2()
        game.addVisual(new ElementoInterfaz(image="nivelarriba.jpg", position = game.at(0,0)))
        musicaArriba.shouldLoop(true)
        if(!musicaArriba.played())game.schedule(500,{musicaArriba.play()})
        const position = game.at(0,0)
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n))})
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 1, y = n))})
        (0 .. 3).forEach({ n => posicionesParedes.add(new Position(x = 2, y = n)) })
        (8 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 2, y = n)) })
        (0 .. 2).forEach({ n => posicionesParedes.add(new Position(x = 3, y = n)) })
        (11 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 3, y = n)) })
        (0 .. 2).forEach({ n => posicionesParedes.add(new Position(x = 4, y = n)) })
        (7 .. 9).forEach({ n => posicionesParedes.add(new Position(x = 4, y = n)) })
        (12 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 4, y = n)) })
        (0 .. 2).forEach({ n => posicionesParedes.add(new Position(x = 5, y = n)) })
        (7 .. 9).forEach({ n => posicionesParedes.add(new Position(x = 5, y = n)) })
        (12 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 5, y = n)) })
        (13 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 6, y = n)) })
        (10 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 7, y = n)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 14, y = n)) })
        (0 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 13, y = n)) })
        (0 .. 3).forEach({ n => posicionesParedes.add(new Position(x = 12, y = n)) })
        (8 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 12, y = n)) })
        (0 .. 2).forEach({ n => posicionesParedes.add(new Position(x = 11, y = n)) })
        (11 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 11, y = n)) })
        (0 .. 2).forEach({ n => posicionesParedes.add(new Position(x = 10, y = n)) })
        (7 .. 9).forEach({ n => posicionesParedes.add(new Position(x = 10, y = n)) })
        (12 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 10, y = n)) })
        (0 .. 2).forEach({ n => posicionesParedes.add(new Position(x = 9, y = n)) })
        (7 .. 9).forEach({ n => posicionesParedes.add(new Position(x = 9, y = n)) })
        (12 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 9, y = n)) })
        (13 .. 14).forEach({ n => posicionesParedes.add(new Position(x = 8, y = n)) })
		posicionesParedes.addAll(
			[
			new Position(x = 0, y = 0)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
        //personaje
        game.addVisual(pokeball)
        game.addVisual(pokemonesCapturados)
		game.addVisual(personaje)
        game.addVisual(kyurem)
        game.addVisual(kyuremImagen)
        game.addVisual(teleport3B)
        game.onCollideDo(teleport3B,{personaje => teleport3B.irCentral() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(6,13))})
        game.addVisual(teleport4B)
        game.onCollideDo(teleport4B,{personaje => teleport4B.irCentral() game.sound("stairs.mp3").play() self.descargar()  personaje.position(game.at(7,13))})
        game.addVisual(teleport5B)
        game.onCollideDo(teleport5B,{personaje => teleport5B.irCentral() game.sound("stairs.mp3").play() self.descargar() personaje.position(game.at(8,13))})
        //brillos
        const posicionesBrillo = []
        posicionesBrillo.addAll(
			[
			new Position(x = 4, y = 8),
            new Position(x = 5, y = 8),
            new Position(x = 4, y = 9),
            new Position(x = 5, y = 9),
            new Position(x = 9, y = 8),
            new Position(x = 9, y = 9),
			new Position(x = 10, y = 8),
            new Position(x = 10, y = 9),
            new Position(x = 7, y = 11),
            new Position(x = 7, y = 12),
            new Position(x = 2, y = 9),
            new Position(x = 12, y = 9),
            new Position(x = 3, y = 11),
			new Position(x = 11, y = 11),
            new Position(x = 5, y = 12),
			new Position(x = 9, y = 12)
			]
		)
        posicionesBrillo.forEach({ posicionBrillo => self.dibujar(new Brillo(position = posicionBrillo)) })
        //TECLADO
		keyboard.up().onPressDo{if (game.height()-1 > personaje.position().y()) personaje.ir(arriba)}
        keyboard.down().onPressDo{if (game.height()-15 < personaje.position().y()) personaje.ir(abajo)}
        keyboard.left().onPressDo{if (game.width()-15 < personaje.position().x()) personaje.ir(izquierda)}
        keyboard.right().onPressDo{if (game.width()-1 > personaje.position().x()) personaje.ir(derecha)}
        keyboard.z().onPressDo({personaje.interactuar()})
        keyboard.enter().onPressDo({juego.empezar()})
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}

object final {
    const musicaFinal = game.sound("ending.mp3")
	method cargar() {
        game.clear()
        personaje.ocupado(true)
    	game.boardGround("fin.jpg")
        game.addVisual(new ElementoInterfaz(image="fin.jpg", position = game.at(0,0)))
        musicaFinal.shouldLoop(true)
        game.schedule(500,{musicaFinal.play()})
        const position = game.at(0,0)
	}
}

object juego {
	var juegoIniciado = false
	method empezar(){
		if (not juegoIniciado){
			game.removeVisual(pantallaDeInicio)
			juegoIniciado = true
			pantallaDeInicio.terminarAnimacion()
            game.addVisual(instrucciones)
            instrucciones.iniciarAnimacion()
		}
	}
    method continuar(){
		game.removeVisual(instrucciones)
        instrucciones.terminarAnimacion()
	}
}

object pantallaDeInicio{
    var property position = game.at(0,0)
    var imagen = false
	method iniciarAnimacion(){game.onTick(250,"Animacion del menu",{self.cambiar()})}
	method terminarAnimacion(){game.removeTickEvent("Animacion del menu")}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image() {
		if(imagen)
			return "title1.jpg"
		else
			return "title2.jpg"
	}
}

object instrucciones {
    var property position = game.at(0,0)
    var property imagen = false
    method iniciarAnimacion(){game.onTick(250,"Animacion del menu",{self.cambiar()})}
	method terminarAnimacion(){game.removeTickEvent("Animacion del menu")}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image() {
		if(imagen)
			return "instrucciones1.jpg"
		else
			return "instrucciones2.jpg"
	}
}