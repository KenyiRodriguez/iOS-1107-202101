import UIKit

class Persona {
    
    private let nombre  : String
    private let apellido: String
    public  let edad    : Int
    
    public var nombreCompleto: String {
        "\(self.nombre) \(self.apellido)"
    }
    
    public var informacion: String {
        "Nombre: \(self.nombre)\nApellido: \(self.apellido)\nEdad: \(self.edad)"
    }
    
    init(nombre: String, apellido: String, edad: Int) {
        self.nombre     = nombre
        self.apellido   = apellido
        self.edad       = edad
    }
}

class Alumno: Persona {
    
    var carrera: String
    
    init(nombre: String, apellido: String, edad: Int, carrera: String) {
        
        self.carrera = carrera
        super.init(nombre: nombre, apellido: apellido, edad: edad)
    }
}

class Hijo: Alumno {
    
    override init(nombre: String, apellido: String, edad: Int, carrera: String) {
        super.init(nombre: nombre, apellido: apellido, edad: edad, carrera: carrera)
    }
}
