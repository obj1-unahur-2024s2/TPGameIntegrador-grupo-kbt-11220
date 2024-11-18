import wollok.game.*
import batalla.*
import movimientos.*
import nivel.*
import npc.*
import personaje.*
import pokemon.*

class Tipo {
	var property debilidades = []
	var property resistencias = []
	var property inmunidades = []
	method calcularMultiplicador (damagetype) {
		if (debilidades.contains(damagetype)) return 2
		if (resistencias.contains(damagetype)) return 0.5
		if (inmunidades.contains(damagetype)) return 0
		return 1
	}
}

object normal inherits Tipo (
	debilidades = [lucha], 
	inmunidades = [fantasma]
){}

object lucha inherits Tipo (
	debilidades = [volador,psiquico,hada], 
	resistencias = [roca,bicho,oscuro]
){}

object volador inherits Tipo(
	debilidades = [roca,electrico,hielo],
	resistencias = [lucha,bicho,planta],
	inmunidades = [suelo]
){}

object veneno inherits Tipo(
	debilidades = [suelo,psiquico],
	resistencias = [lucha,self,bicho,planta,hada]
){}

object suelo inherits Tipo(
	debilidades = [agua,planta,hielo],
	resistencias = [veneno,roca],
	inmunidades = [electrico]
){}

object roca inherits Tipo(
	debilidades = [lucha,acero,agua,planta],
	resistencias = [normal,volador,veneno,fuego]
){}

object bicho inherits Tipo(
	debilidades = [volador,roca,fuego],
	resistencias = [lucha,suelo,planta]
){}

object fantasma inherits Tipo(
	debilidades = [self,oscuro],
	resistencias = [veneno,bicho],
	inmunidades = [normal,lucha]
){}

object acero inherits Tipo(
	debilidades = [lucha,suelo,fuego],
	resistencias = [normal,lucha,roca,bicho,self,planta,psiquico,hielo,dragon,hada],
	inmunidades = [veneno]
){}

object fuego inherits Tipo(
	debilidades = [suelo,roca,agua],
	resistencias = [bicho,acero,self,planta,hielo,hada]
){}

object agua inherits Tipo(
	debilidades = [planta,electrico],
	resistencias = [acero,fuego,self,hielo]
){}

object planta inherits Tipo(
	debilidades = [volador,veneno,bicho,fuego,hielo],
	resistencias = [suelo,agua,self,electrico]
){}
object electrico inherits Tipo(
	debilidades = [suelo],
	resistencias = [volador,acero,self]
){}

object psiquico inherits Tipo(
	debilidades = [bicho,fantasma,oscuro],
	resistencias = [lucha,self]
){}

object hielo inherits Tipo(
	debilidades = [lucha,roca,acero,fuego],
	resistencias = [self]
){}

object dragon inherits Tipo(
	debilidades = [hielo,self,hada],
	resistencias = [fuego,agua,planta,electrico]
){}
object oscuro inherits Tipo(
	debilidades = [lucha,bicho,hada],
	resistencias = [fantasma,self],
	inmunidades = [psiquico]
){}

object hada inherits Tipo(
	debilidades = [veneno,acero],
	resistencias = [lucha,bicho,oscuro],
	inmunidades = [dragon]
){}
object nulo inherits Tipo(
	inmunidades = []
){}