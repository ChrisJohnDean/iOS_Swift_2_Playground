/*:
 ## More Optionals
 Let's start off with some review of optionals.
 When we have an optional variable, the variable might contain a value or it can contain nil. Optionals are represented with a '?' after the variable type.
 */
/*:
 - Experiment:
 Declare a optional Double value and set it to nil.
 */
var double: Double? = nil

/*:
 - Experiment:
 Assign a value your optional Double.
 */
double = 5.0

/*:
 - Experiment:
 Force unwrap the optional value. Why do you have to be careful about force unwrapping?
 */
double!

/*:
 - Experiment:
 Use conditional unwrapping to verify if the optional has a value. Print the value if there is something, otherwise, print out to indicate there is no value present. Why is conditional unwrapping better than force unwrapping?
 */
if let double = double {
    print(double)
} else {
    print("no value here")
}

/*:
 - Callout(Challenge):
 Create a function that removes the `nil` values from the array and returns a new array with only the valid Strings.
 */
var testData: [String?] = ["Heather", nil, "Mike", "John", nil, nil, "Bob"]

var i = 0
while i < testData.count {
    if testData[i] == nil {
        testData.remove(at: i)
    } else {
        i += 1
    }
}
print(testData)

/*:
 - Callout(Challenge):
 We want to write a function that validates form data filled in by a user. Once we encounter the first field that is blank, we want to indicate to the user that the field is blank.
 If the user has filled in everything correctly, we want to print all information out.
 Below is some test data you can use to test your function.
 */
//// Should pass all checks and print all information
let username: String? = "user1"
let password: String? = "password123"
let email: String? = "user1@lighthouselabs.ca"

// Should stop at password check and indicate password field is empty
//let username: String? = "user1"
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

// Should stop at username check and indicate username field is empty
//let username: String? = nil
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

func validate(username:String?, password:String?, email:String?) {
    if let validUser = username {
        print(validUser)
    } else {
        print("Username field is blank silly!")
    }
    
    if let password = password {
        print(password)
    } else {
        print("password field is blank silly!")
    }
    
    if let email = email {
        print(email)
    } else {
        print("email field is blank silly!")
    }
}

//validate(username: username, password: password, email: email)

/*:
 ## Guard Let
 Depending on how you finished the first challenge, the code you've written might not be as readable or optimal as it could be. So let's take a look at how we can improve this.
 A 'guard' statement is similar to an 'if', but a 'guard' statement will only run its block of code if the conditions are NOT met.
 Let's look at a simple guard example below.
 */
let myNumber = 10

// This function checks if the number given to it is a positive or negative value
func isMyNumberANegativeValue(myNumber: Int){
  
  // This guard condition checks if 'myNumber' is less than zero.
  // Remember, if this condition IS FALSE, the block of code within the else block will run
  // Otherwise, the function will continue
  guard myNumber < 0 else {
    print("I am positive")
    return
  }
  
  print("I am negative!")
}

isMyNumberANegativeValue(myNumber: myNumber)

/*:
 - Experiment:
 Try creating your own guard statement with different conditional statements. Notice which boolean condition causes the code the enter the 'else' block or bypass it entirely.
 */

/*:
 - Experiment:
 Create a function that takes in two number parameters and divide them. We don't like dividing by zero, so ensure this doesn't happen. Otherwise, return the calculated value.
 */

func divide(numOne: Int, numTwo: Int) -> Int {
    guard numOne > 0 && numTwo > 0 else {return 0}
    return numOne/numTwo
}

divide(numOne: 5, numTwo: 10)
/*:
 Let's take a look at another example and see how we can use guard for optionals
 */

let myOptionalNumber: Int? = 10

// This function just checks if the given parameter is nil or not
func isMyNumberAnOptional(myOptionalNumber: Int?){
  
  // This guard checks if 'myOptionalNumber' has a value or not. Similar concept to conditional unwrapping
  // If 'myOptionalNumber' is indeed nil, the else block will run
  // Otherwise, our guard let statement is looking for a valid value, and the code will continue to run
  guard let myUnwrapped = myOptionalNumber else {
    
    print("This value is nil")
    return
  }
  
  // Lastly, you can see we can use the variable 'myUnwrapped' variable declared above within our entire scope of this function now
  // Very convenient!!
  // A regular 'if let' would not allow this
  print("This unwrapped value is \(myUnwrapped)")
}

isMyNumberAnOptional(myOptionalNumber: myOptionalNumber)

/*:
 - Experiment:
 Create a function that takes in an array of numbers. Have the function add all the numbers together and return the result. Make sure to `guard` against an empty array. Use `array.first` to check if there is at least one value in the array.
 */
func addNumbers(array:Array<Int>?) -> Int {
    guard let array = array else {return 0}
    
    var sum = 0
    for i in array {
        sum += i
    }
    
    return sum
}

addNumbers(array: [4,7,9,2])
/*:
 - Callout(Challenge):
 Now that we've learnt this new guard statement, let's rewrite the form validation challenge using the guard statements. How does it improve our current implementation?
 */


func validateAgain(username:String?, password:String?, email:String?) {
    guard let username = username else {
        print("Username field is blank silly!")
        return
    }
    
    guard let password = password else {
        print("password field is blank silly!")
        return
    }
    
    guard let email = email else {
        print("email field is blank silly!")
        return
    }
    print(username, password, email)
}

validateAgain(username: username, password: password, email: email)
//: [Next](@next)

