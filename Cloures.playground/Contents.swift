//: Playground -Cloure Concepts in details.............

import UIKit

//Mark : What is cloure


func Dissplay (name : String) -> ()
{
    print("Displaying.....\(name)")
}
func printString (name : String) {
    
    print(name)
}

//or

func printString(namevalue : String) -> (){
    
    print(namevalue)
}

printString(name: "Khan")


printString(namevalue: "Its Khan")


let printName = {
    //(parameters) -> (return type)
    (name : String)  -> Void
    in
    //    Statements
    print(name)
}

//lets pass this cloure or block into a function...

func fiveTimes(cloure : (_ name : String)->Void){
    
    for _ in 1...5 {
        
        cloure("Khan")
    }
}

//Lets call this function now this is one of the method calling a function by reference..

fiveTimes(cloure: printName)


//With another way to call this same function now we will define the cloure in calling parameter in a function

fiveTimes(cloure: {
    
    //(parameters ) -> (Return type)
    (name : String) -> Void
    
    in
    
    //    (Statements)
    //    print(name)
})


//“Inferring Type From Context”


fiveTimes(cloure: {
    
    name -> Void in
    
    //    print(name)
    
    
})

//Fourth method you will see to more shortage a name parameters


fiveTimes(cloure: {
    name in
    //    print(name);
    
    
})

//now if i remove the name also then it will cause a sytanx error

fiveTimes() {
    
    name in
    print(name);
    
    
}

// A cloure which takes nothing and return nothing



var simplestCloure = {
    print("Hello world")
}

// Another  cloure which takes nothing and return nothing
var anotherSimplest = {
    //(parameters) -> (Returntype)
    ()->()
    
    in
    //Statmetns
    print("HelloWorld ")
    
}

var returntedvalue = ""

//A    cloure which returns some things


let cloureWithReturn = {
    
    (name : String) -> String
    in
    
    return "Thankyou " + name
}

//So you simply called here the cloure with just like functions in swift
cloureWithReturn("Khan")

print(cloureWithReturn("Buddy!"))



func takeThanks(name : String, cloure : (_ name : String)-> String    ){
    
    returntedvalue = cloure(name)
}



takeThanks(name: "Ruby", cloure: cloureWithReturn)


print("Please Captured value by cloure= \(returntedvalue)")










//“Implicit Returns from Single-Expression Closures
//Now this feature means that we can remove the return keyword from a single expression cloures......

//lets take an example of array sorting using cloure......... which we want to sort, using cloure.


var array = [10,5,8,9,0,1,2,6]

//here is an example with the actually fully cloure.
array = array.sorted(by: {
    (a : Int, b : Int) in
    
    return a<b
})

print(array)
//with infer parameters type............
//OR
array = array.sorted(by: {
    
    a, b in return a>b
    
    
})
print(array);

//OR
array = array.sorted(by: {
    a, b in  a>b
})
print(array)


//Shorthand Argument Names

array = array.sorted(by: {
    $0>$1
})
print(array)

//Even more shorter way of cloure
//Operator Functions

array = array.sorted(by: >)




//Trailing Closures

//lets say that we have a function which has a lot of arguments and end part is a cloure then what should we do
//The answer is the trailing cloures.

func PlayerStatus(stadium : String, goal : Bool, cloure : (_ name : String , _ goal :  Bool) -> ())  {
    cloure(stadium, goal)
}

PlayerStatus(stadium: "messi", goal: true, cloure: {
    (Player : String , goal : Bool) -> () in
    goal == true ? (print("\(Player) Played well" )) : (print("\(Player) Played dont well"))
})





PlayerStatus(stadium: "messi", goal: true) {
    (Player : String , goal : Bool) -> () in
    goal == true ? (print("\(Player) Played well" )) : (print("\(Player) Played dont well"))
}




//Capturing Values

//Cloure can capture values from its outer functions or the methods...... and it can also modify those values.



//For example...... we declared a value outside the cloure and changed it through a function and see the result output......

var clourechangedValue = "khan"


func capturedValues(cloure: ()->()){
    cloure();
}
capturedValues {
    clourechangedValue = "Helloworld";
}
print(clourechangedValue)



//Nonescaping Closures

let escapecloure =  {
    () -> Void in
    print("escape cloure")
}

func Displayescapecloure(cloure: ()->()){
    
    cloure();
}
Displayescapecloure {
    escapecloure();
}

// in below you dont have to manage memory the cloure will be automatically return and it wont be reuseable.
func Display (nonescapecloure : () -> ()) {
    nonescapecloure();
}

Display {
    print("Non escape cloure");
}














