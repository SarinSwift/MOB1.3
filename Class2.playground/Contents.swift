import UIKit

let name = "Mike"
let goodbye = {
    print("see you later \(name)")
}
goodbye()


// In Class Activity II
// testing closures and escaping closures





// Case 1:

func flyAway(finalStage: String){
    print("\(finalStage) emerged, flying away... ")
}
// function that takes a clusore as a parameter
func metamorphosis(initialStage:String, completion: (String) -> Void){
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...5 {
        print("\(initialStage) inside cocoon")
    }
    completion("🦋")
}
metamorphosis(initialStage:"🐛", completion: flyAway)
// trailing closure:
// this is a NON escaping closure because it's not the last thing that executes in the function
metamorphosis(initialStage: "🐛") { (str) in
    print("\(str) emerged, flying away...")
}





// Case 2: Using escaping function with a variable

func flyAway2(finalStage: String){
    print("\(finalStage) emerged, flying away... ")
}

var closureThing: (String) -> Void = { _ in return }

// now there is an @escaping because we are using an escaping closure
func metamorphosis2(initialStage:String, completion: @escaping (String) -> Void){
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...5 {
        print("\(initialStage) inside cocoon")
    }
    closureThing = completion
}
metamorphosis2(initialStage:"🐛", completion: flyAway)
// trailing closure:
// this is a NON escaping closure because it's not the last thing that executes in the function
metamorphosis2(initialStage: "🐛") { (str) in
    print("\(str) emerged, flying away...")
}





// Case 3: Using @escaping with asynchronization

// escaping closures always get runs after the whole execution dies!!!
func metamorphosis3(initialStage:String, completion: @escaping (String) -> Void){
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...5 {
        print("\(initialStage) inside cocoon")
    }
    DispatchQueue.main.async {
        completion("🦋")
    }
}
metamorphosis3(initialStage:"🐛", completion: flyAway)
// trailing closure:
// this is a NON escaping closure because it's not the last thing that executes in the function
metamorphosis3(initialStage: "🐛") { (str) in
    print("\(str) emerged, flying away...")
}




// Reduce method to find the largest numeber!!

var numbers = [1, 20, 3, 4, 13, 6, 7, 80, 9, 15]
let largestNumber = numbers.reduce(0) { (result, current) -> Int in
    return max(result, current)
}
print(largestNumber)
