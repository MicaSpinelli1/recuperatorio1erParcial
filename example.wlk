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
  var property resistencia = 0

  method poder() = fuerza * resistencia
 
  method fueraDeCombate() {
    resistencia = 0
  }

  method curar() {
    resistencia = resistencia * 2
  }

  method aumentarFuerza(num) {
    fuerza = fuerza + num
  }

  method recibirVeneno() {
    self.fueraDeCombate()
  }
}

object obelix {
  var property fuerza = 0
  var fueraDeCombate = true

  method poder() = 100 + fuerza

  method fueraDeCombate() = fueraDeCombate

  method curar() {
    fueraDeCombate = false
  }

  method aumentarFuerza(num) {
    fuerza = fuerza + num
  }

  method recibirVeneno() {
    self.fueraDeCombate()
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

  method poderDeLaAldea() {
    habitantes.filter({habitante => !habitante.fueraDeCombate()}.map{h => h.poder()}.sum())
  }
}

object nuevoGalo {
  var property fuerza = 20
  var resistencia = 50


  method poder() = fuerza + resistencia * 2

  method fueraDeCombate() {
    self.poder() == 0
  }

  method curar() {
    resistencia = resistencia + 20
    fuerza = fuerza + 10
  }

  method aumentarFuerza(num) {
    fuerza = fuerza + num
  }

  method recibirVeneno() {
    self.fueraDeCombate()
  }
}

object nuevoIngrediente {
  method efecto(persona) {
    persona.recibirVeneno()
  }
}