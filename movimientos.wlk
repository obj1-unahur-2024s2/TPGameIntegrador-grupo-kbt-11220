import wollok.game.*
import batalla.*
import dialogos.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*

object ataqueFisico {
	method conQueAtacar(pokemonAtacante) = pokemonAtacante.atk()
	method conQueDefenderse (pokemonEnemigo) = pokemonEnemigo.def()
}

//Ataques - 1 por tipo
class Ataque{
	var property name
	var property type
	var property damagetype
	var property dmg
	var property effect
	var property accuracy
	var property priority
	method image () = "ATAQUE " + name + ".png"
}
//ATAQUE VACIO PARA INICIALIZAR MOVE
const ninguno =new Ataque(
	name = "ninguno",
	type = ataqueFisico,
	damagetype = normal,
	dmg = 0,
	effect= "Ninguno",
	accuracy = 100,
	priority =false
)
//NORMAL
const cuchillada =new Ataque(
	name = "cuchillada",
	type = ataqueFisico,
	damagetype = normal,
	dmg = 2,
	effect= "Ataca con garras afiladas",
	accuracy = 100,
	priority =false
)
//PLANTA
const hojasnavaja =new Ataque(
	name = "hojas navaja",
	type = ataqueFisico,
	damagetype = planta,
	dmg = 2,
	effect= "Lanza hojas filosas",
	accuracy = 95,
	priority =false
)
//FUEGO
const lanzallamas =new Ataque(
	name = "lanzallamas",
	type = ataqueFisico,
	damagetype = fuego,
	dmg = 2,
	effect= "Quema con una explosion de fuego",
	accuracy = 100,
	priority =false
)
//AGUA
const surf =new Ataque(
	name = "surf",
	type = ataqueFisico,
	damagetype = agua,
	dmg = 2,
	effect= "Crea una ola gigante",
	accuracy = 100,
	priority =false
)
//HIELO
const rayohielo =new Ataque(
	name = "rayo hielo",
	type = ataqueFisico,
	damagetype = hielo,
	dmg = 2,
	effect= "Lanza un rayo de energia congelante",
	accuracy = 100,
	priority =false
)
//OSCURO
const tajoumbrio =new Ataque(
	name = "tajo umbrio",
	type = ataqueFisico,
	damagetype = oscuro,
	dmg = 2,
	effect= "Corta al oponente",
	accuracy = 100,
	priority =false
)
//HADA
const vientofeerico =new Ataque(
	name = "viento feerico",
	type = ataqueFisico,
	damagetype = hada,
	dmg = 2,
	effect= "Agita un viento de hadas y golpea",
	accuracy = 100,
	priority =false
)
//FANTASMA
const bolasombra =new Ataque(
	name = "bola sombra",
	type = ataqueFisico,
	damagetype = fantasma,
	dmg = 2,
	effect= "Arroja una masa sombria",
	accuracy = 100,
	priority =false
)
//PSIQUICO
const psicorrayo =new Ataque(
	name = "psicorrayo",
	type = ataqueFisico,
	damagetype = psiquico,
	dmg = 2,
	effect= "Ataca con un rayo peculiar",
	accuracy = 100,
	priority =false
)
//LUCHA
const brazomartillo =new Ataque(
	name = "brazo martillo",
	type = ataqueFisico,
	damagetype = lucha,
	dmg = 2,
	effect= "Balancea con su fuerte puño",
	accuracy = 90,
	priority =false
)
//ACERO
const cabezahierro =new Ataque(
	name = "cabeza hierro",
	type = ataqueFisico,
	damagetype = acero,
	dmg = 2,
	effect= "Golpea con su cabeza dura",
	accuracy = 100,
	priority =false
)
//ROCA
const tumbaroca =new Ataque(
	name = "tumba roca",
	type = ataqueFisico,
	damagetype = roca,
	dmg = 2,
	effect= "Lanza rocas para causar daño",
	accuracy = 95,
	priority =false
)
//SUELO
const terremoto = new Ataque(
	name = "terremoto",
	type = ataqueFisico,
	damagetype = suelo,
	dmg = 2,
	effect= "Causa un terremoto a su alrededor",
	accuracy = 100,
	priority =false
)
//ELECTRICO
const chispa =new Ataque(
	name = "chispa",
	type = ataqueFisico,
	damagetype = electrico,
	dmg = 2,
	effect= "Ataca con carga electrica",
	accuracy = 100,
	priority =false
)
//DRAGON
const alientodragon =new Ataque(
	name = "aliento dragon",
	type = ataqueFisico,
	damagetype = dragon,
	dmg = 2,
	effect= "Una poderosa rafaga",
	accuracy = 100,
	priority =false
)
//BICHO
const rayosenial =new Ataque(
	name = "rayo señal",
	type = ataqueFisico,
	damagetype = bicho,
	dmg = 2,
	effect= "Ataca con un rayo de luz",
	accuracy = 100,
	priority =false
)
//VENENO
const acido =new Ataque(
	name = "acido",
	type = ataqueFisico,
	damagetype = veneno,
	dmg = 2,
	effect= "Lanza un torrente de acido",
	accuracy = 100,
	priority =false
)
//VOLADOR
const ataqueala =new Ataque(
	name = "ataque ala",
	type = ataqueFisico,
	damagetype = volador,
	dmg = 2,
	effect= "Golpea con ambas alas",
	accuracy = 100,
	priority =false
)