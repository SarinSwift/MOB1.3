# MOB1.3

## Personal Notes
**[Class 1](https://github.com/SarinSwift/MOB1.3/tree/master/Class1.playground)**
*Jan.22*
- steps to create a closure
- creating an example of a closure

**[Class 2](https://github.com/SarinSwift/MOB1.3/tree/master/Class2.playground)**
*Jan.24*
- Testing closures 
- Escaping closures
- Non escaping closures
- Functions that takes a closure as a parameter
- Using @escaping with asynchronization
- Reduce method to find the largest numeber

**[Class 3](https://github.com/SarinSwift/MOB1.3/tree/master/Class3.playground)**
*Jan.29*
- Creating protocols
- Conforming to protocols
- Protocol / Delegate / Delegator

**[Memory management](https://github.com/SarinSwift/MOB1.3/tree/master/ARC.playground)**
*Feb.17*
- Reference counting: A technique of storing number of references, pointers, objects, block or memory, disk space, etc.
Reference counting, however, only applies to instances of a class since classes are reference types.
- ARC helps store references into memory and helps clean up when it's not being used! ARC allocates new memory everytime a class instance is created through init(). That chunk of memory holds the instance together with the values of the property. Once the instance is no longer needed, ARC deallocates that memory space of that instance and calls deinit().  
**Weak reference:** ARC automatically sets weak references to 'nil' when the instance is deallocated hence the use of 'var' instead of 'let'.  
**Unowned reference:** always has a value. ARC will never set unowned references to nil, so we declare them using non optional types. If you try access the value of an unowned reference after that instance has been deallocated, you will get a runtime error.

**[JSON Serialization](https://github.com/SarinSwift/MOB1.3/tree/master/jsonCodable.playground)**
*Feb.17*
- Codable: Adopting to Codable protocols allows you to serialize them to and from the built-in data formats. You can encode and decode from XML, Property List, JSONEncode, JSONDecoder.  
**Encoding:** allows you to covert from your type to 'Data'  
**Decoding:** converts from Jsondata back to an instance, or in other words, back into our data model.  
**CodingKeys:** CodingKeys are enum type nested in your type which conforms to String, and CodingKey. You must include all properties(cases) in the enum even if you're not renaming them.

**[Alamofire](https://github.com/Alamofire/Alamofire)**
*Feb.26*  
Alamofire: A networking library for iOS which seeks to simplify handling requests and responses, serializing json, authentication, etc.  

* Methods available:  
  - Alamofire.upload: Upload files with multipart, stream, file or data methods.  
  - Alamofire.download: Download files or resume a download already in progress.  
  - Alamofire.request: Requests not associated with file transfers.  

Alamofire is built to be asynchronous(in the background) - allows to safely access the network without having to worry about the threads. 
The main thread is responsible for runningthe user interface. So, if you block the main thread for any amount of significant time, the user interface will become unacceptably unresponsive.   
* Benefits:  
   - Provides easily accessible utilities methods to make quick and dirty requests.  
   - You can chain a response handler via a closure to parse the response or to handle any errors during the networking request  
   - Parameters: Has the ability to post data to a server or specify what one is querying for.  
   - Can reduce boilerplate code in your project / Makes code look cleaner  
   - Large corporations use these third party libraries!  


## Class Exercises
**[Closures](https://github.com/SarinSwift/MOB1.3/tree/master/Exercises1.playground)**
- Writing closures
- Closures that take in parameters
- Closures that return a value
- Function that returns a closure

**[Functions, closures, and ARC](https://github.com/SarinSwift/MOB1.3/tree/master/Functions-Closures-and-ARC-master)**
- Function Anatomy
(Instance and class methods)
- Closures
(Closures vs functions)
- Higher order functions
- Shorthand Closures
- ARC 
(Retain count, retain cycles, weak/strong/unowned references)

## Class Projects
**[Pomodoro](https://github.com/SarinSwift/MOB1.3/tree/master/pom-starter-master)**
*Communication patterns (Jan.31)*
1. implementing target-action pattern for event handling
2. notifications with Notification Center

**[Change Text](https://github.com/SarinSwift/MOB1.3/tree/master/ChangeText)**
- passing information from source view controller to destination view controller using a completion handler
- Changed from using completion handlers to using delegates


**[Change BGColor](https://github.com/SarinSwift/MOB1.3/tree/master/ChangingBGColor)**
- passing information from source view controller to destination view controller using a completion handler
- Changed from using delegates to using completion handlers

**[Communication Class](https://github.com/SarinSwift/MOB1.3/tree/master/CommunicationClass)**
- Subclass UIButton.
- Add a dictionary as a property that has strings as keys and any value as the values.
- Include initializers


**[Leaky Starship](https://github.com/SarinSwift/MOB1.3/tree/master/LeakyStarship-master)**
- Debuging memory leaks in Xcode
- Weak and unowned self for closures and variables

**[Festival](https://github.com/SarinSwift/MOB1.3/tree/master/Festival)**
- Read JSON data from a file
- Serializing a programs internal data structure into some kind of interchange formate using decode and encode
- Creating types conformin to the Codeable protocol (this allows us to create an encoder and decoder)

**[DailyPlanet](https://github.com/SarinSwift/MOB1.3/tree/master/DailyPlanet-master)**
*Feb.12*
1. Configure session
2. Set up the request
3. Make the request
4. Handle the response
5. Present results

**[Lesson10-master](https://github.com/SarinSwift/MOB1.3/tree/master/Lesson10-master)**
*Feb.26*
- Make network requests using Alamofire
- Used get, post, annd delete methods


## [Product Hunt](https://github.com/SarinSwift/MOB1.3/tree/master/ProductHunt)
[MS Tutorial](https://www.makeschool.com/academy/track/standalone/product-hunt-api-tutorial/getting-started)
1. How to work with APIs.
2. How to build a network layer in Swift.
3. How to decode JSON into Swift models.
4. How to take advantage of mock data.
5. How to display data in tableviews with custom UI.

