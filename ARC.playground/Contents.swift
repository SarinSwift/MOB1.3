import UIKit


class Person {
    var name: String
    var favorite: Fruit?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Fruit {
    var fruitName: String
    var owner: Person?
    
    init(fruitName: String) {
        self.fruitName = fruitName
        print("\(fruitName) is being initialized")
    }
    
    deinit {
        print("\(fruitName) is being deinitialized")
    }
}


//                EXAMPLE OF RELATIONSHIP (Stroing reference on 2 instances linked together)



//                *var sarin*                                     *var mango*
//                      | (Strong)                                    | (Strong)
//                      |                                             |
//                     👇🏼                                            👇🏼
//             <Person instance>                                 <Fruit instance>
//              name: "Sarin"                (Strong)              name: "Mango"
//         favorite: <Fruit instance> <<------------------->> owner: <Person instance>



var sarin: Person?
var mango: Fruit?

sarin = Person(name: "Sarin")
mango = Fruit(fruitName: "Mango")

// assigning sarin with a mango, and setting the owner of the mango.
// This is an example of a string reference when we link 2 instances together
sarin!.favorite = mango
mango!.owner = sarin


// when we set both variables to nil, in the console you will see that both are deinitialized properly.
// But once we add in the above code 👆🏼👆🏼, you can see that both never get deinitialized
mango = nil
sarin = nil









//          Fixing the bug: WEAK
// Break the strong reference cycle by using weak references. We choose to use weak because the object can be optional thus not incrementing the reference count.

class Fruitt {
    var fruitName: String
    weak var owner: Person?         // <<<- put in weak
    
    init(fruitName: String) {
        self.fruitName = fruitName
        print("\(fruitName) is being initialized")
    }
    
    deinit {
        print("\(fruitName) is being deinitialized")
    }
}

//                      EXAMPLE OF RELATIONSHIP (Strong and weak reference)



//                *var sarin*                                     *var mango*
//                      |                                             |
//                      | (Strong)                                    | (Strong)
//                      |                                             |
//                     👇🏼                                            👇🏼
//             <Person instance>                                 <Fruit instance>
//              name: "Sarin"                (Strong)              name: "Mango"
//         favorite: <Fruit instance>   ----------------->>  owner: weak <Person instance>
//                                      <<-----------------
//                                          (Weak)








//          Fixing the bug: UNOWNED
class Fruittt {
    var fruitName: String
    unowned var owner: Person        // <<<- put in unowned
    
    init(fruitName: String, owner: Person) {        // the initializer is modified to accept the owner as a parameter
        self.fruitName = fruitName
        self.owner = owner
        print("\(fruitName) is being initialized")
    }
    
    deinit {
        print("\(fruitName) is being deinitialized")
    }
}
// now this makes the relationship between Person and Fruit different.
// A 'Person' may have a fruit, but a 'Fruit' must have a corresponding owner



//                           EXAMPLE OF RELATIONSHIP(Strong and unowned reference)



//                *var sarin*
//                      |
//                      | (Strong)
//                      |
//                     👇🏼
//             <Person instance>                                 <Fruit instance>
//              name: "Sarin"                (Strong)              name: "Mango"
//         favorite: <Fruit instance>   ----------------->>    owner: <Person instance>
//                                      <<-----------------
//                                          (Unowned)
