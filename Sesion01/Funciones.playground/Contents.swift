import UIKit

//********************* Funciones *********************
/*
    PARTES:
        * func
        * nombreFuncion
        * Argumentos o parámetros
        * Tipo de dato de retorno
            - Se define por la flecha (->)
            - Este tipo es opcional cuando se trata de un Void
            - (-> Float) (-> Void) (-> Int)
 
    func nombreFuncion(Argumentos) -> Float { //Code here }
 
    func nombreFuncion(Argumentos) -> Void { //Code here }
    func nombreFuncion(Argumentos) { //Code here }
 
 
 
    ARGUMENTOS:
        * alias de la variable (_, nombre, o nada)
        * el nombre de la variable
        * el tipo de dato de la variable
    
    (_ variable: Int, _ variable: Float)
    (alias variable: Int, alias variable: Float)
    (variable: Int,variable: Float)
 */



//JAMAS, PERO NUNCA LO USES!!!!!!
func sumar(_ n1: Int, _ n2: Int) -> Int {
    return n1 + n2
}
sumar(4, 9)

//LO RECOMENDADO
func sumar(numero1 n1: Int, conNumero2 n2: Int) -> Int { n1 + n2}
sumar(numero1: 15, conNumero2: 10)

func sumar(n1: Int, n2: Int) -> Int { n1 + n2 }
sumar(n1: 4, n2: 10)

func sumarNumero1(_ n1: Int, conNumero2 n2: Int) -> Int { n1 + n2 }
sumarNumero1(4, conNumero2: 4)

func sumarN1(_ n1: Int, n2: Int) -> Int { n1 + n2 }
sumarN1(7, n2: 9)



//*********** parámetros de envio opcional **************
func registrarUsuarioConNombre(_ nombre: String, apellido: String, departamento: String = "Lima") {
    
    print(departamento)
}

registrarUsuarioConNombre("Kenyi", apellido: "Rodriguez", departamento: "Arequipa")
registrarUsuarioConNombre("José", apellido: "Arteaga")
