import UIKit

//******************** OPCINALES ********************
/*
 
    * Son variables de un tipo de dato especial
    * Pueden admitir un (nulo, nil, null, vacio) o un dato existente
    * Al acceder a estas variables especiales, estamos accediendo a un puntero de memoria, en el cual se guarda el dato de la misma.
    * Para acceder al dato real almacenado en esta variable debemos desempaquetar el dato con el operador (??)
 */

var edadNormal: Int = 30
edadNormal = 31
//edadNormal = nil (No se puede asignar, ya que no permite nulos)

var edadOpcional: Int? = 30
edadOpcional = 31
//edadOpcional = nil

let sumaEdades = edadNormal + (edadOpcional ?? 0)

var arrayNombres: [String]? = []
arrayNombres?.append("Kenyi")
arrayNombres?.append("Jimmy")
arrayNombres?.append("Juan")

print(arrayNombres ?? [])

arrayNombres = nil
arrayNombres?.append("Kenyi")
arrayNombres?.append("Jimmy")
arrayNombres?.append("Juan")

print(arrayNombres ?? ["SIN ELEMENTOS"])



//***************** GUARD LET, GUARD VAR *****************
/*
    * Crea una variable segura en el scope actual donde se esta ejecutando
    * Una variable segura es una variable distinta de nil. Es decir, no admite nulos
    * Nos permite capturar el error del nulo y ejecutar un proceso de contingencia
    * DETIENE TODO EL PROCESO, ya que usa un return como parte del syntax y es obligatorio
    * SÓLO SE USA DENTRO DE FUNCIONES
 */

func guard_agregarPersonaConNombre(_ nombre: String?, apellido: String?, ciudad: String?) {
    
    guard let nombreSeguro = nombre else {
        print("No seas firulais e ingresa un dato para el nombre")
        print("Opera lo que quieras")
        return
    }
    
    guard let apellidoSeguro = apellido else {
        print("No seas firulais e ingresa un dato para el apellido")
        print("Opera lo que quieras")
        return
    }

    let ciudadSegura = ciudad ?? "Lima"
    
    print("Se agrego a \(nombreSeguro) \(apellidoSeguro) de la ciudad de \(ciudadSegura)")
}

func guard_agregarPersonaConNombreGeneral(_ nombre: String?, apellido: String?, ciudad: String?) {
    
    guard let nombreSeguro = nombre, let apellidoSeguro = apellido else {
        print("No seas firulais e ingresa un nombre y un apellido válido")
        print("Opera lo que quieras")
        return
    }
    
    let ciudadSegura = ciudad ?? "Lima"
    print("Se agrego a \(nombreSeguro) \(apellidoSeguro) de la ciudad de \(ciudadSegura)")
}

guard_agregarPersonaConNombre(nil, apellido: "rodriguez", ciudad: nil)


func guard_agregarPersonaConNombreNOHACER(_ nombre: String?, apellido: String?, ciudad: String?) {
    
    if nombre == nil {
        print("No seas firulais e ingresa un dato para el nombre")
        print("Opera lo que quieras")
        return
    }
    
    if apellido == nil {
        print("No seas firulais e ingresa un dato para el apellido")
        print("Opera lo que quieras")
        return
    }

    let ciudadSegura = ciudad ?? "Lima"
    
    print("Se agrego a \(nombre!) \(apellido ?? "") de la ciudad de \(ciudadSegura)")
}



//***************** IF LET, IF VAR *****************
/*
    * Crea una variable segura dentro un nuevo scope
    * Una variable segura es una variable distinta de nil. Es decir, no admite nulos
    * Nos permite ejecutar un proceso alterno en caso se exitoso y error
    * SÓLO SE USA DENTRO DE FUNCIONES
 */


func iflet_agregarPersonaConNombre(_ nombre: String?, apellido: String?, ciudad: String?) {
    
    if let nombreSeguro = nombre {
        
        if let apellidoSeguro = apellido {
            
            let ciudadSegura = ciudad ?? "Lima"
            print("Se agrego a \(nombreSeguro) \(apellidoSeguro) de la ciudad de \(ciudadSegura)")
            
        } else {
            
            print("No seas firulais e ingresa un dato para el apellido")
            print("Opera lo que quieras")
        }
        
    } else {
        
        print("No seas firulais e ingresa un dato para el nombre")
        print("Opera lo que quieras")
    }
}

func iflet_agregarPersonaConNombreGeneral(_ nombre: String?, apellido: String?, ciudad: String?) {
    
    if let nombreSeguro = nombre, let apellidoSeguro = apellido {
        
        let ciudadSegura = ciudad ?? "Lima"
        print("Se agrego a \(nombreSeguro) \(apellidoSeguro) de la ciudad de \(ciudadSegura)")
        
    } else {
        
        print("No seas firulais e ingresa un nombre y un apellido válido")
        print("Opera lo que quieras")
    }
}
