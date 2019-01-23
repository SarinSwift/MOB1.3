import UIKit

// return this function to a closure

func add(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

// 1. Drop the func
// 2. Assign to var
// 3. Remove names
// 4. Add equal sign
// 5. put the names behind the {
// 6. add in keyword
// 7. add return keyword and then
let closure: (Int, Int) -> (Int) = { number1, number2 in
    return number1 + number2
}
closure(2, 5)






// creatiung a closure
var names = ["Sarin", "Chris", "Andrea", "Brown"]
print(names.sorted { $0 < $1 })
print(names.sorted(by: { (str, str2) -> Bool in
    return str < str2
}))
// creating a closure and then passing into a parameter that needs a closure!!
let reversedAlaphabeticalOrder: (_ str1: String, _ str2: String) -> Bool = { str1, str2 in
    return str1 > str2
}
print(names.sorted(by: reversedAlaphabeticalOrder))
