import wollok.game.*
import batalla.*
import dialogos.*
import movimientos.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*


object nivelCentral {
    var property number = 1
    var property name = "center"
    const musica = game.sound("Safari.mp3")
	method cargar() {
    	game.boardGround("nivelcentral.jpg")
        batalla.mapas(self.number())
        game.addVisual(new ElementoInterfaz(image="nivelcentral.jpg", position = game.at(0,0)))
        musica.shouldLoop(true)
        game.schedule(500,{musica.play()})
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
		game.addVisual(personaje)
        game.addVisual(enfermeraJoy)
        game.addVisual(profesorOak)
        game.addVisual(venusaur)
        game.addVisual(pidgeot)
        game.addVisual(cartel)
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
    const musica = game.sound("Safari.mp3")
	method cargar() {
    	game.boardGround("nivelderecha.jpg")
        batalla.mapas(self.number())
        game.addVisual(new ElementoInterfaz(image="nivelderecha.jpg", position = game.at(0,0)))
        musica.shouldLoop(true)
        game.schedule(500,{musica.play()})
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
		game.addVisual(personaje)
        game.addVisual(butterfree)
        game.addVisual(wigglytuff)
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
    const musica = game.sound("Safari.mp3")
	method cargar() {
    	game.boardGround("nivelizquierda.jpg")
        batalla.mapas(self.number())
        game.addVisual(new ElementoInterfaz(image="nivelizquierda.jpg", position = game.at(0,0)))
        musica.shouldLoop(true)
        game.schedule(500,{musica.play()})
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
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 1))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 2))})
        (1 .. 2).forEach({ n => posicionesAgua.add(new Position(x = n, y = 3))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 4))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 5))})
        (1 .. 7).forEach({ n => posicionesAgua.add(new Position(x = n, y = 6))})
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
		game.addVisual(personaje)
        game.addVisual(lapras)
        game.addVisual(lairon)
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
    const musica = game.sound("Safari.mp3")
	method cargar() {
    	game.boardGround("nivelarriba.jpg")
        batalla.mapas(self.number())
        game.addVisual(new ElementoInterfaz(image="nivelarriba.jpg", position = game.at(0,0)))
        musica.shouldLoop(true)
        game.schedule(500,{musica.play()})
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
		game.addVisual(personaje)
        game.addVisual(kyurem)
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