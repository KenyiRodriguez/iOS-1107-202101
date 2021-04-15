import UIKit

//***************** DICCIONARIOS *******************
/*
 
    * Es una colección de datos
    * Responde a una estructura de clave, valor
    * Todo dato se guarda en una clave
    * ES NECESARIO REALIZAR UNA DECLARACIÓN EXPLÍCITA
    * Los diccionarios pueden ser del mismo tipo de dato
    * Los diccionarios pueden ser de disinto tipo de dato (esto es lo mas usual)
    * Lo recomendado es que la llave del diccionario sea del tipo String y el dato del mismo sea del tipo Any (Cualquiera)
    * La llave debe ser única. No se puede repetir.
 */

var diccionarioVacio: [String: Any] = [:]

var datosAlumno: [String: Any] = ["nombre"  : "Kenyi",
                                  "apellido": "Rodriguez",
                                  "edad"    : 30,
                                  "estatura": 1.76,
                                  "soltero" : true]

datosAlumno["direccion"] = "Calle los olvidados de dios 666"
datosAlumno["edad"] = 31

print(datosAlumno)

print("\n************************\n")


//************* Obtener información de un diccionario *****************

let nombre = datosAlumno["nombre"] ?? "Nombre no definido"
print(nombre)

for informacion in datosAlumno {
    print("\(informacion.key) : \(informacion.value)")
}


print("\n************************\n")
//*********** Curiosidades ************
/*
    El diccionario lo podemos enumarar como si fuera un Array
 */
var notas: [Int: Any] = [0: 13,
                            1: 10.8,
                            2: 9.6,
                            3: 14]

print(notas[0] ?? "No definido")





//VOLVEMOS EN 15 MINUTOS 8:15













