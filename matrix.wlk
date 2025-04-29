//NAVE
object nave {
	var property pasajeros = [morfeo,neo,trinity]
	method sube(pasajero) {pasajeros.add(pasajero)}
	method baja(pasajero) {pasajeros.remove(pasajero)}
	method cantidadDePasajeros() {return pasajeros.size()}
	method chocar() {
		pasajeros.forEach({pasajero=>pasajero.saltar()})
		pasajeros.clear()
	}
	method estaElElegido() {
		return pasajeros.any({pasajero => pasajero.esElElegido()})
	}
	method acelerar() {
		pasajeros.filter({pasajero => not pasajero.esElElegido()})
		.forEach({pasajero=>pasajero.saltar()})
	}
	method pasajeroConMasVitalidad() {
		return pasajeros.max{ pasajero=> pasajero.vitalidad()}
	}
	method pasajeroConMenosVitalidad() {
		return pasajeros.min{ pasajero=> pasajero.vitalidad()}
	}
	method estaEquilibrada() {
		return self.pasajeroConMasVitalidad().vitalidad() < self.pasajeroConMenosVitalidad().vitalidad()*2  
	}
}

//PASAJEROS
object neo {
 	var property energia = 100
    method vitalidad() {return energia/10}
 	method esElElegido() {return true}
 	method saltar() {energia = energia/2}
}
object morfeo{
	var property cansado = false
	var property vitalidad = 8
	method esElElegido() {return false}
 	method saltar() {
 		cansado = not cansado
 		vitalidad = 0.max(vitalidad -1)
 	}
}
object trinity {
	method vitalidad() {return 0}
    method esElElegido() {return false}
 	method saltar() {}
}

/*
Tenemos a neo, morfeo y trinity que son los pasajeros de la nave, que pueden bajarse de la nave y eventualmente volver a subir. 
* Neo es el elegido, empieza con 100 de energia, pero cuando salta pierde la mitad de su energia. Su vitalidad es la décima parte de su energía
* Morfeo no es el elegido. Su vitalidad es inicialmente 8, pero puede variar, empieza descansado y al saltar se cansa, pero si salta estando cansado, vuelve a quedar descansado. Siempre que salta, su vitalidad disminuye en 1. 
* Trinity sabe decir su vitalidad, que siempre es 0. Saltar no la afecta. No es la elegida.

De la nave nos interesa averiguar: 
* Cuántos pasajeros hay
* El pasajero de mayor vitalidad
* Si está equilibrada en vitalidad, lo que sucede cuando ninguno de los pasajeros tiene más que el doble de vitalidad que cualquier otro pasajero.
* Si el elegido está en la nave 

Y también hay hechos que le suceden a la nave
* Cuando la nave choca, todos sus pasajeros saltan para salvarse y se van de la nave. 
* Cuando la nave acelera, todos sus pasajeros, excepto el elegido, saltan de alegría y permanecen en la nave.	
*/