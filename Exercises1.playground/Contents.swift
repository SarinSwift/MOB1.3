import UIKit

/*:
Exercise 1
Write a closure that prints the string "Learning Swift" and assign the closure to a variable. Then call the closure.
*/
let learning = {
    print("Learning Swift")
}
learning()

/*:
Exercise 2
Write a closure that takes two integers and returns the sum of the integers. Assign the closure to a variable and then call the closure. The closure can be written in a few different ways. Experiment and try 2 ways.
*/
let twoInts: (Int, Int) -> Int = { int1, int2 in
    int1 + int2
}
twoInts(3, 10)

/*:
Exercise 3
Write a closure that returns the value 42, without assigning the closure to a variable. Immediately call the closure and also ignore the return value from the closure.
*/
let return42 = {
    return 42
}
return42()


func returnFourty2(closure: () -> ()) {
    closure()
}
returnFourty2 {
    return 42
}
/*:
Exercise 4
Sort the array:

let numbers = [22, 10, 42, 100, 8, 4]
Use a closure and the sorted(by:) method.
*/
 let numbers = [22, 10, 42, 100, 8, 4]
 print(numbers.sorted(by: { $0 < $1 }))
 
 
 
/*:
Exercise 5
Write a function that returns a closure. The function should contain the following variable:

let message = "This is an important message"
The closure that the function returns should print the value of that variable.
*/

let message = "This is an important message"
func returnClosure(str1: String) -> () {
    print(str1)
}
returnClosure(str1: message)    
returnClosure(str1: "sarin")
