import testAldea.*

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
  var cantidad = 0

  method cantidad (num) {
    cantidad = num
  }

  method efecto(persona) {
    persona.curar(cantidad)
  }
}

object asterix {
  var property fuerza = 0
  var property resistencia = 2

  method poder() = fuerza * resistencia
 
  method fueraDeCombate() = resistencia <= 0
  

  method curar(cantidad) {
    resistencia = resistencia * 2
    fuerza = fuerza + cantidad
  }

  method aumentarFuerza(num) {
    fuerza = fuerza + num
  }

  method recibirVeneno() {
    self.fueraDeCombate()
  }

  method tomarPosion(posionMagica) {
    posionMagica.aplicarEfectos(self)
  }
}

object obelix {
  var property fuerza = 0
  var fueraDeCombate = true

  method poder() = 100 + fuerza

  method fueraDeCombate() = fueraDeCombate

  method curar(cantidad) {
    fueraDeCombate = false
    fuerza = fuerza + cantidad
  }

  method aumentarFuerza(num) {
    fuerza = fuerza + num
  }

  method recibirVeneno() {
    self.fueraDeCombate()
  }

  method tomarPosion(posionMagica) {
    posionMagica.aplicarEfectos(self)
  }
}

object posionMagica {
  const ingredientes = []

  method agregarIngredientes(ingrediente) {
    ingredientes.add(ingrediente)
  }

  method aplicarEfectos(persona) {
    ingredientes.forEach({ingrediente => ingrediente.efecto(persona)})
  }
}

object aldeaGala {
  const habitantes = []

  method sumarHabitantes(habitante) {
    habitantes.add(habitante)
  }

  method poderDeLaAldea() = habitantes.filter({h => !h.fueraDeCombate()}).map({h => h.poder()}).sum()
}

object nuevoGalo {
  var property fuerza = 20
  var resistencia = 50
  var poder = fuerza + resistencia * 2


  method poder() = poder

  method fueraDeCombate()  = poder < 5
    

  method curar(cantidad) {
    resistencia = resistencia + 20
    fuerza = fuerza + 10 + cantidad
  }

  method aumentarFuerza(num) {
    fuerza = fuerza + num
  }

  method recibirVeneno() {
    fuerza = 0
    resistencia = 0
  }

  method tomarPosion(posionMagica) {
    posionMagica.aplicarEfectos(self)
  }
}

object nuevoIngrediente {
  method efecto(persona) {
    persona.recibirVeneno()
  }
}