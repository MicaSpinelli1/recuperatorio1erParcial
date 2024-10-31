object dulceDeLeche {
  method efecto(persona) {
    persona.aumentarFuerza(10)
  }
}

object muerdago {
  var tamano = 0

  method tamano(num) {
    tamano = num
  }

  method efecto(persona) {
    persona.aumentarFuerza(tamano)
  }
}

object aceiteDeRoca {
  method efecto(persona) {
    persona.curar()
  }
}