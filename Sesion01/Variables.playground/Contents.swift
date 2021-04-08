import UIKit

//*********************** Tipos variables ***********************
/*
 
 Variables mutables (var)
    Toda aquella variable que puede cambiar de valor a lo largo de todo su ciclo de vida en su scope o ámbito ({}, funciones, clases, estructuras, enums, etc).
  
 Variables inmutables (let)
    Toda aquella variable que se crea con un dato y este no puede ser alterado en todo su ciclo de vida en su scope o ámbito ({}, funciones, clases, estructuras, enums, etc).
 
 */


//variable mutable
var edad = 30
edad = 31
edad = 32

//variable inmutable
let nombre = "Kenyi"



//*********************** Tipos de declariación ***********************
/*
 
 Declaración implícita:
    * Dejamos que Swift determine el tipo de dato de la variable según el dato asignado.
    * Al declarar la variable nunca se especifica el tipo de dato de la misma.
 
 Declaración explícita:
    * Swift no determina el tipo de dato de la variable.
    * Al declarar la variable se le debe especificae el tipo de dato de la misma.
 
 */


//Declaración implícita inmutable
let apellido = "Rodriguez"

//Declaración implícita mutable
var apellido2 = "Bobadilla"

//Declaración explícita mutable
var precio: Double = 30

//Declaración explícita inmutable
let igv: Float = 3.5

let universidad: String = "UPC"

let colegio: String
colegio = "Innova school"

let total = Float(precio) + igv


let nombreCompleto1 = nombre + apellido
let nombreCompleto2 = nombre + " " + apellido
let nombreCompleto3 = "\(nombre) \(apellido) \(edad)"
let datos1 = "Nombre: \(nombre) - Apellido: \(apellido) - Edad: \(edad)"
print(datos1 + "\n")

let datos2 = "Nombre: \(nombre)\nApellido: \(apellido)\nEdad: \(edad)"
print(datos2)
