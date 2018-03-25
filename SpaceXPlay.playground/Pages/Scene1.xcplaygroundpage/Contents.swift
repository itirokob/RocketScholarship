//: [Previous](@previous)
/*:
 
 # Space
 ## Budget: $30000
 
 Help John to decide which metal to use!
 
*/
struct iron {
    var price = 200
    var resistance = 10
}

struct aluminum {
    var price = 100
    var resistance = 7
}

struct niobium {
    var price = 150
    var resistance = 5
}
/*:
 
 Choose one of the metals above and atribute in composition variable:

*/
let composition = niobium() //Aqui vai ter um placeholder
/*:
 When you choose, let's launch our rocket!!!
*/
//Hide
import PlaygroundSupport
import UIKit

let vc = JonScene()

PlaygroundPage.current.liveView = vc.view

//Hide
/*:
Type launch() to launch our rocket!
*/
launch()
//:[Next](@next)
