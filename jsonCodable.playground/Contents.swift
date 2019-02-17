import UIKit

// Encoding custom model to JSON data and from JSON data
// let's get started with encoding and decoding real data
struct CarSize: Codable {
    var height: Int
    var length: Int
}

enum CarType: String, Codable {
    case Unknown
    case Porsche
    case BMW
}

class Car: NSObject, Codable {
    // starting off by giving them all a value because we wouldn't want to initialize anything first
    var name: String = ""
    var companyURL: URL? = nil
    var yearOfManufacture: Int = 0
    var isNew:Bool = true
    var otherDetailsData: [String:String]? = nil
    var carType: CarType = .Unknown
    var carSize: CarSize = CarSize(height: 0, length: 0)
}


// ENOCODE:
// create a car instance and encode it to JSON data
var myCar = Car()
myCar.name = "City ZX"
myCar.companyURL = URL(string: "www.porsche.com/")
myCar.isNew = true
myCar.yearOfManufacture = 2018
myCar.otherDetailsData = ["color": "White", "fuelType": "Petrol", "interiorColor": "Beige"]
myCar.carSize = CarSize(height: 100, length: 200)
myCar.carType = .Porsche

let jsonData = try? JSONEncoder().encode(myCar)
if let jsonDataString = String(data: jsonData!, encoding: .utf8) {
    print(jsonDataString)
}


// DECODE:
// json data below that conforms to Car class metadata
// decode this json data back to a Car object
let jsonString = """
{
"name":"City ZX",
"isNew":true,
"yearOfManufacture":2018,
"companyURL":"www.honda.com",
"carType":"Sedan",
"carSize":{
"height":200,
"height":100
},
"otherDetailsData":{
"color":"Red",
"fuelType":"Petrol"
},
}
"""

// converting from string to data, and then from data into a Car object
if let jsonDataFromString = jsonString.data(using: .utf8) {
    let someonesCar = try? JSONDecoder().decode(Car.self, from: jsonDataFromString)
    print(someonesCar as Any)
}









// CODINGKEYS used
// Handling different key names in JSON and Model class/struct
class Book: NSObject, Codable {
    var name: String = ""
    var publisher: String = ""
    var author:String = ""
    var numberOfPages:Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name = "bookName"
        case publisher
        case author = "writtenBy"
        case numberOfPages = "pagesInTheBook"
    }
}

// ENCODE:
var bookObj = Book()
bookObj.name = "The Fountain Head"
bookObj.publisher = "Transworld Digital"
bookObj.author = "Ayn Rand"
bookObj.numberOfPages = 262

let encodedObject = try? JSONEncoder().encode(bookObj)
if let encodedObjectString = String(data: encodedObject!, encoding: .utf8) {
    print(encodedObjectString)
}
// This encode json will rename the property names in JSON as defined in CodingKeys enum
//      'name' property will get renamed to 'bookName'
//      'author' property will get renamed to 'writtenBy'
//      'numberOfPages' property will get renamed to 'pagesInTheBook'


// DECODE:
let jsonString1 = """
{ "bookName":"The brief history of time",
"publisher":"Transworld Digital",
"writtenBy":"Stephen Hawking",
"isReleased":true,
"pagesInTheBook":226 }
"""

if let jsonData = jsonString1.data(using: .utf8) {
    if let bookObj = try? JSONDecoder().decode(Book.self, from: jsonData) {
        print("\(bookObj.name), \(bookObj.author), \(bookObj.publisher), \(bookObj.numberOfPages)")
    }
}
// decoded objects from JSON will automatically map keys from JSON data to the keys you have defined in your Book model class
