import UIKit

// protocol
// defines responsibility that will be deleagted
protocol Feed {
    func refillWaterBowl()
}

// conforming to the protocol which has to inherit the function within it!
struct Owner: Feed {
    func refillWaterBowl() {
        print("Bowl is filled with water!!!!!!")
    }
}

// the pet will delegate the task
struct Pet {
    // the type will be whatever you call the protocol
    var delegate: Feed?
}



var timo = Owner()
timo.refillWaterBowl()

var musia = Pet()
musia.delegate = timo
musia.delegate?.refillWaterBowl()
