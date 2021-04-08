import UIKit


let arrayNotas1 = [3, 9, 20, 15, 13]
let arrayNotas2: [Int] = [3, 9, 20, 15, 13]
var arrayNotas3: [Int] = []
var arrayNotas4 = [Int]()

var arrayNombres = ["Kenyi", "Jose", "Sagar", "Akio", "Shirley"]
var arrayNombres1: [String] = []
var arrayNombres2 = [String]()

/*
 VIEJO!!!!!!! y OBSOLETO
 for (int i = 0; i < array.length; i++) { codigo }
 */


for nombre in arrayNombres {
    print(nombre)
}

print("\n************************\n")

for i in 0..<arrayNombres.count {
    let nombre = arrayNombres[i]
    print("\(i) - \(nombre)")
}

print("\n************************\n")

for iterador in arrayNombres.enumerated() {
    print("\(iterador.offset) - \(iterador.element)")
}
