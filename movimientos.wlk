import wollok.game.*
import batalla.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*
import tipo.*

object ataqueFisico {
	method conQueAtacar(pokemonAtacante) = pokemonAtacante.atk()
	method conQueDefenderse (pokemonEnemigo) = pokemonEnemigo.def()
}

object ataqueEspecial {
	method conQueAtacar(pokemonAtacante) = pokemonAtacante.spa()
	method conQueDefenderse (pokemonEnemigo) = pokemonEnemigo.spd()
}

//Ataques - 1 fisico y 1 especial por tipo
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
const hipervoz =new Ataque(
	name = "hiper voz",
	type = ataqueEspecial,
	damagetype = normal,
	dmg = 2,
	effect= "Lanza un horrible sonido",
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
const rayosolar =new Ataque(
	name = "rayo solar",
	type = ataqueEspecial,
	damagetype = planta,
	dmg = 2,
	effect= "Junta luz y la lanza en un rayo",
	accuracy = 100,
	priority =false
)
//FUEGO
const colmillofuego =new Ataque(
	name = "colmillo fuego",
	type = ataqueFisico,
	damagetype = fuego,
	dmg = 2,
	effect= "Muerde con sus colmillos ardientes",
	accuracy = 95,
	priority =false
)
const lanzallamas =new Ataque(
	name = "lanzallamas",
	type = ataqueEspecial,
	damagetype = fuego,
	dmg = 2,
	effect= "Quema con una explosion de fuego",
	accuracy = 100,
	priority =false
)
//AGUA
const tajoacuatico =new Ataque(
	name = "tajo acuatico",
	type = ataqueFisico,
	damagetype = agua,
	dmg = 2,
	effect= "Agua presurizada como una cuchilla",
	accuracy = 100,
	priority =false
)
const surf =new Ataque(
	name = "surf",
	type = ataqueEspecial,
	damagetype = agua,
	dmg = 2,
	effect= "Crea una ola gigante",
	accuracy = 100,
	priority =false
)
//HIELO
const colmillohielo = new Ataque(
	name = "colmillo hielo",
	type = ataqueFisico,
	damagetype = hielo,
	dmg = 2,
	effect= "Muerde con colmillos congelados",
	accuracy = 95,
	priority =false
)
const rayohielo =new Ataque(
	name = "rayo hielo",
	type = ataqueEspecial,
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
const pulsoumbrio =new Ataque(
	name = "pulso umbrio",
	type = ataqueEspecial,
	damagetype = oscuro,
	dmg = 2,
	effect= "Lanza una horrible aura",
	accuracy = 100,
	priority =false
)
//HADA
const juegorudo =new Ataque(
	name = "juego rudo",
	type = ataqueFisico,
	damagetype = hada,
	dmg = 2,
	effect= "Ataca jugando bruscamente",
	accuracy = 90,
	priority =false
)
const vientofeerico =new Ataque(
	name = "viento feerico",
	type = ataqueEspecial,
	damagetype = hada,
	dmg = 2,
	effect= "Agita un viento de hadas y golpea",
	accuracy = 100,
	priority =false
)
//FANTASMA
const puniosombra =new Ataque(
	name = "puño sombra",
	type = ataqueFisico,
	damagetype = fantasma,
	dmg = 2,
	effect= "Golpea desde las sombras",
	accuracy = 100,
	priority =false
)
const bolasombra =new Ataque(
	name = "bola sombra",
	type = ataqueEspecial,
	damagetype = fantasma,
	dmg = 2,
	effect= "Arroja una masa sombria",
	accuracy = 100,
	priority =false
)
//PSIQUICO
const cabezazozen =new Ataque(
	name = "cabezazo zen",
	type = ataqueFisico,
	damagetype = psiquico,
	dmg = 2,
	effect= "Enfoca su poder en la cabeza y ataca",
	accuracy = 90,
	priority =false
)
const psicorrayo =new Ataque(
	name = "psicorrayo",
	type = ataqueEspecial,
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
const esferaaural =new Ataque(
	name = "esfera aural",
	type = ataqueEspecial,
	damagetype = lucha,
	dmg = 2,
	effect= "Libera un pulso de poder de aura",
	accuracy = 100,
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
const metalaser =new Ataque(
	name = "metalaser",
	type = ataqueEspecial,
	damagetype = acero,
	dmg = 2,
	effect= "Lanza un rayo de acero",
	accuracy = 95,
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
const poderpasado =new Ataque(
	name = "poder pasado",
	type = ataqueEspecial,
	damagetype = roca,
	dmg = 2,
	effect= "Ataca con poder prehistorico",
	accuracy = 100,
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
const bofetonlodo =new Ataque(
	name = "bofeton lodo",
	type = ataqueEspecial,
	damagetype = suelo,
	dmg = 2,
	effect= "Junta y lanza lodo",
	accuracy = 100,
	priority =false
)
//ELECTRICO
const colmillotrueno =new Ataque(
	name = "colmillo trueno",
	type = ataqueFisico,
	damagetype = electrico,
	dmg = 2,
	effect= "Muerde con colmillos electrficados",
	accuracy = 95,
	priority =false
)
const chispa =new Ataque(
	name = "chispa",
	type = ataqueEspecial,
	damagetype = electrico,
	dmg = 2,
	effect= "Ataca con carga electrica",
	accuracy = 100,
	priority =false
)
//DRAGON
const garradragon =new Ataque(
	name = "garra dragon",
	type = ataqueFisico,
	damagetype = dragon,
	dmg = 2,
	effect= "Corta con garras enormes",
	accuracy = 100,
	priority =false
)
const alientodragon =new Ataque(
	name = "aliento dragon",
	type = ataqueEspecial,
	damagetype = dragon,
	dmg = 2,
	effect= "Una poderosa rafaga",
	accuracy = 100,
	priority =false
)
//BICHO
const megacuerno =new Ataque(
	name = "megacuerno",
	type = ataqueFisico,
	damagetype = bicho,
	dmg = 2,
	effect= "Embiste con su cuerno",
	accuracy = 85,
	priority =false
)
const rayosenial =new Ataque(
	name = "rayo señal",
	type = ataqueEspecial,
	damagetype = bicho,
	dmg = 2,
	effect= "Ataca con un rayo de luz",
	accuracy = 100,
	priority =false
)
//VENENO
const puyanociva =new Ataque(
	name = "puya nociva",
	type = ataqueFisico,
	damagetype = veneno,
	dmg = 2,
	effect= "Golpea con un brazo venenoso",
	accuracy = 100,
	priority =false
)
const acido =new Ataque(
	name = "acido",
	type = ataqueEspecial,
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
const tajoaereo =new Ataque(
	name = "tajo aereo",
	type = ataqueEspecial,
	damagetype = volador,
	dmg = 2,
	effect= "Ataca con una espada de aire",
	accuracy = 95,
	priority =false
)