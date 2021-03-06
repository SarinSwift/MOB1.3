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


**[Completion Handlers](https://github.com/SarinSwift/MOB1.3/tree/master/DailyPlanet-master)**
*Mar.11*  
**1. What is a completion handler**   

A completion handler is a type of closure that gets called once a function has returned  
Using a completion handler: It gets passed in as an argument in a function and gets called when that function is done.  
The point of a completion handler: To tell whatever is calling that function that it's done and to optionally give it some data or an error.  
For example the dataTask function where it takes in a URLRequest, and a completion handler which takes (Data?, Response?, Error?) and returns Void.  

TIPS 👉🏼👉🏼 if the closure is passed in a function as the last argument, we can use the trailing closure syntax.  
Example.  
``` 
let task = session.dataTask(with: urlRequest) { (data, response, error) in 
    // this is where the completion handler code goes
} 
task.resume() 
```

**2. Getting data out of a completion handler**  

Often completion handlers are used for *asyncronous functions*, meaning that we don't want to freeze up the app while waiting for the result.  
Completion handlers allows us to fire the network call without having to wait for the response.  
The completion handler will notify us as soon as the network call has been completed. So, the UI will still work while making the network call!  
⭐️Whenever you want to reload things or get data, response, or error, we'll need to write the code withing the completion handler becasue we need to wait for the completion handler to complete so we have all the information.  
Example.  
```
func reloadTableViewAfterNetworkCall() {
   fetchDoesCallSucceed()
}

func fetchDoesCallSucceed() {
   let task = session.dataTask(with: urlRequest) { (data. response, error) in 
      let success = (error == nil)
      self.hasData = success
      self.tableView.reloadData()
   }
   task.resume()
}
```

**3. Moving networking calls to a different class using completion handlers** 

Completion handlers allows access to data within the networking call function.  
There are other ways as well such as using *Delegates and Protocols*, *Futures and Promises*, etc.  
Example.  
ViewController class:
```
func reloadTableViewAfterNetworkCall() {
   fetchDoesCallSucceed() { success in
      self.hasData = success
      self.tableView.reloadData()
   }
}
```

NetworkingCall class:
```
func fetchDoesCallSucceed(completion: @escaping (Bool) -> ()) {
   let task = session.dataTask(with: urlRequest) { (data. response, error) in 
      let success = (error == nil)
      completion(success)
   }
   task.resume()
}
```

👆🏼👆🏼fetchDoesCallSucceed() takes a completion handler with 1 argument of type Bool. So, when we call it in reloadTableViewAfterNetworkCall(), we pass in a closure with a single argument like ```{ success in ... }```.  
Once the network call is done, ```completion(success)``` is called!


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
   
   
**[Firebase](https://firebase.google.com/)**
*Feb.26*  
- Similar to 1 large JSON file stored in Firebase  
- All data objects hold key-value pairs, where the value can be a string, number, or another object   
- This is one of the differences in Firebase real time database and FireStore  

Tips to store data on firebase:  
  - Avoid nesting data (because when you fetch data from your database, you also get all the other child node's data aswell)  
  - Flatten data structures (data that can be split in to many paths. It can be efficiantly downloaded in seperate calls, as is needed!)  
  - Look for ways to build data that can scale (Using 2 way relationships between users and groups - Users can belong to a group, and groups comprise a list of users)
  
**Writing to the database**  
1. You need an instance of FIRDatabaseReference:  
  ```var ref = Database.database().reference()```  
2. Also would need an autogenerated id:  
  ```let key = ref.child("items").childByAutoId().key```  
3. Creating a new entry to the database!:  
  ```let newItem = 'a dictionary with key-value pairs'```  
  ```ref.child("items").child(key!).setValue(newItem)```  
  
**Retreiving data**  
1. You need an instance of FIRDatabaseReference:  
``` let userRef = Database.database().reference().child("items") ```  
2. Using oberveSingleEvent(_with:)  
This only gets data from the databsae once. And makes an automatic update in data which allows the app to have real time data updates.  
``` userRef.observeSingleEvent(of: .value, with: { (snapshot) in```  
``` print(snapshot)                                             ```  
``` })                                                          ```  

**Firebase Storage**   
1. Create the storage reference  
``` let storageRef = Storage.storage().reference().child("items/\(key)") ```  

This allows for saving file in folders and you can structure the folder hierarchy  
Very important to not forget to change the rules on the sotorage so we can read and write without authenticating the users.  

**Updating data**  
1. Create the reference  
``` let ref = Database.database().reference() ```  
``` ref.child("items").child(key).updateChildValues(["imageUrl": url?.absoluteString]) ```



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

**[Loaner-Collection-Views](https://github.com/SarinSwift/MOB1.3/tree/master/loaner-05-Collection-Views)**
*Feb.28*
- Integrating firebase database  
- Writing, fetching, deleting, editing items from the database   


## [Product Hunt](https://github.com/SarinSwift/MOB1.3/tree/master/ProductHunt)
[MS Tutorial](https://www.makeschool.com/academy/track/standalone/product-hunt-api-tutorial/getting-started)
1. How to work with APIs.
2. How to build a network layer in Swift.
3. How to decode JSON into Swift models.
4. How to take advantage of mock data.
5. How to display data in tableviews with custom UI.

