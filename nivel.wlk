import wollok.game.*
import batalla.*
import movimientos.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*

object nivel1 {
    const musica = game.sound("Safari.mp3")
	method cargar() {
    	game.boardGround("fondoSafari.jpg")
        game.addVisual(new ElementoInterfaz(image="fondoSafari.jpg", position = game.at(0,0)))
        musica.shouldLoop(true)
        game.schedule(500,{musica.play()})
        const position = game.at(0,0)
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 0))}) // borde abajo
        (10 .. 20).forEach({ n => posicionesParedes.add(new Position(x = n, y = 1))})
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = largo)) }) // borde arriba 
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 28)) })
        (0 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 27)) })
        (14 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 26)) })
        (14 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 25)) })
        (14 .. ancho).forEach({ n => posicionesParedes.add(new Position(x = n, y = 24)) })
        (5 .. 8).forEach({ n => posicionesParedes.add(new Position(x = n, y = 26)) })
        (5 .. 8).forEach({ n => posicionesParedes.add(new Position(x = n, y = 25)) })
        (5 .. 8).forEach({ n => posicionesParedes.add(new Position(x = n, y = 24)) })
        (5 .. 7).forEach({ n => posicionesParedes.add(new Position(x = n, y = 23)) })
        (14 .. 16).forEach({ n => posicionesParedes.add(new Position(x = n, y = 23)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 9)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 10)) })
        (15 .. 18).forEach({ n => posicionesParedes.add(new Position(x = n, y = 11)) })
        (16 .. 17).forEach({ n => posicionesParedes.add(new Position(x = n, y = 12)) })
		(0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 0, y = n)) }) // borde izquierda
        (0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 1, y = n)) })
        (0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 2, y = n)) })
        (0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 3, y = n)) })
		(0 .. largo).forEach({ n => posicionesParedes.add(new Position(x = ancho, y = n)) }) // borde derecha
        (10 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 38, y = n)) })
        (10 .. 15).forEach({ n => posicionesParedes.add(new Position(x = 33, y = n)) })
        (10 .. 15).forEach({ n => posicionesParedes.add(new Position(x = 32, y = n)) })
        (17 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 33, y = n)) })
        (17 .. largo).forEach({ n => posicionesParedes.add(new Position(x = 32, y = n)) })
        (4 .. 7).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (9 .. 10).forEach({ n => posicionesParedes.add(new Position(x = n, y = 14)) })
        (4 .. 10).forEach({ n => posicionesParedes.add(new Position(x = n, y = 21)) })
        (5 .. 7).forEach({ n => posicionesParedes.add(new Position(x = n, y = 20)) })
        (14 .. 21).forEach({ n => posicionesParedes.add(new Position(x = 4, y = n)) })
        (14 .. 21).forEach({ n => posicionesParedes.add(new Position(x = 10, y = n)) })
        (16 .. 20).forEach({ n => posicionesParedes.add(new Position(x = 5, y = n)) })
        (16 .. 20).forEach({ n => posicionesParedes.add(new Position(x = 7, y = n)) })
		posicionesParedes.addAll(
			[
			new Position(x = 4, y = 1),
            new Position(x = 8, y = 2),
			new Position(x = 5, y = 1)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
		//AGUA
		const posicionesAgua = []
        (21 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 1))})
        (21 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 2))})
        (23 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 3))})
        (23 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 4))})
        (35 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 5))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 6))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 7))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 8))})
        (27 .. 38).forEach({ n => posicionesAgua.add(new Position(x = n, y = 9))})
        posicionesAgua.forEach({ posicionAgua => self.dibujar(new Agua(position = posicionAgua)) })
        //RIO
        const posicionesRio = []
        (10 .. 15).forEach({ n => posicionesRio.add(new Position(x = 32, y = n))})
        (10 .. 15).forEach({ n => posicionesRio.add(new Position(x = 33, y = n))})
        (17 .. 23).forEach({ n => posicionesRio.add(new Position(x = 32, y = n))})
        (17 .. 23).forEach({ n => posicionesRio.add(new Position(x = 33, y = n))})
        (28 .. 29).forEach({ n => posicionesRio.add(new Position(x = 32, y = n))})
        (28 .. 29).forEach({ n => posicionesRio.add(new Position(x = 33, y = n))})
        posicionesRio.forEach({ posicionRio => self.dibujar(new Rio(position = posicionRio)) })
        //CASCADA
        const posicionesCascada = []
        (24 .. 27).forEach({ n => posicionesCascada.add(new Position(x = 32, y = n))})
        (24 .. 27).forEach({ n => posicionesCascada.add(new Position(x = 33, y = n))})
        posicionesCascada.forEach({ posicionCascada => self.dibujar(new Cascada(position = posicionCascada)) })
        //personaje
		game.addVisual(personaje)
        game.addVisual(enfermeraJoy)
        game.addVisual(profesorOak)
        game.addVisual(venusaur)
        game.addVisual(pidgeot)
        game.addVisual(victini)
        game.addVisual(zweilous)
        game.addVisual(lapras)
        game.addVisual(rotom)
        game.addVisual(butterfree)
        game.addVisual(lairon)
        game.addVisual(wigglytuff)
        game.addVisual(sandile)
        game.addVisual(shedinja)
        game.addVisual(toxicroak)
        game.addVisual(bastiodon)
        game.addVisual(gardevoir)
        game.addVisual(kyurem)
        //TECLADO
		keyboard.up().onPressDo{if (game.height()-4 > personaje.position().y()) personaje.ir(arriba)}
        keyboard.down().onPressDo{if (game.height()-29 < personaje.position().y()) personaje.ir(abajo)}
        keyboard.left().onPressDo{if (game.width()-36 < personaje.position().x()) personaje.ir(izquierda)}
        keyboard.right().onPressDo{if (game.width()-2 > personaje.position().x()) personaje.ir(derecha)}
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
		}
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