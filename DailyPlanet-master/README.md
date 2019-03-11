# DailyPlanet
Base app for Swift URLSession Tutorial

## Completion Handlers
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

