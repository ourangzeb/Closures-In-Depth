# #Cloures in depth

I have made some examples for the people who want to learn and understand the cloures in depth. I have gathered information from various resources and tried to make this easy to understand. i have also attached a **playground** so you can test the code.

  - what is a cloure?
  - How to use it and when to use it? 
  - what is the syntax and diffent Styles of Cloures?
  - What is the difference between a acloure and a function............
  - Cloures as a reference type?
  - Special types of cloures.......
  - and many more......

# First question which comes into mind What is a cloure?

Modren programming languages have a feature which is called **cloure, block or lambdas**. This feature has a reusable code for self contained unis and it does not have a name. In other languages you call it **lambdas** or **Block** or **Anonymous functions**
  - What is a cloure
  - How to use it and when to use it?
  - what is the syntax and diffent Styles of Cloures?
  - What is the difference between a acloure and a function............
  - Cloures as a reference type?
  - Special types of cloures.......
  - and many more......

#  General sytax in Swift of a Cloure.
```sh
{   (parameters) -> (return type)
        in
    (Statement or Statements)
}
```
**what the heck is this**
  - consider above cloure like a function every function has a name but above code does not have.
  - every function has some parameters or not and has or has not a return value
  - every function may or may not return some thing.
  

# Lets convert a function into a cloure for more understnding.....
``` 
func Display (name : String) -> ()
{
    print("Displaying.....\(name)")
}

```
# OR you can write above syntax as both does the same thing
``` 
func Display (name : String) 
{
    print("Displaying.....\(name)")
}
```

# Now lets convert above function into a cloure or block or Anonymous function
Lets remove the keywords **func** and **Display** and take **(name : String)**
inside curli brackets. So here is our first simple cloure which takes name as a String parameter and returns nothing.... ** But this cloure it self will give error so i have commented into the playground..
**error will be /../Cloures.playground Trailing closure is separated from call site by multiple newlines But why????????? WTF**

``` 
{
    //(parameters) -> (return type)
    (name : String)  -> Void
             in
    //    Statements
    //    print(name)
}

```
# Remove above error and cloure Reference

``` 
let printName = {
    //(parameters) -> (return type)
    (name : String)  -> Void
        in
    //    Statements
    //    print(name)
}
```
    *** (Note) PrintName here has reference of that cloure so simple cloure does not exists itself untill and unless it is called in function or have a reference to a variable ***
you can pass this reference variable we will see this in examples....

# How to use this cloure?

``` 
func fiveTimes(cloure : (_ name : String)->Void){
    
    for _ in 1...5 {
        cloure("Khan")
    }
}
//now call above function with cloure as a parameter
fiveTimes(cloure: printName)
**
khan
khan
khan
khan
khan
**
```
# Another way to use the cloure without parameter

With another way to call this same function now we will define the cloure in calling parameter in a function

```
fiveTimes(cloure: {
        //(parameters ) -> (Return type)
    (name : String) -> Void
            in
    //    (Statements)
       print(name)
})
```
# Now lets move towards different type of a same cloure syntax
    
    - Infer parameters type mostly people use in their code.
    example see i have omit the **String**
```
    fiveTimes(cloure: {
    name -> Void in
        print(name)
    })
```
    - Now lets remove the return type from the cloure **Void**
```
        fiveTimes(cloure: {
                 name  in
                print(name);
        })
```

# Trailing a Cloure
Trailing a cloure means you make short the function call by placing cloure at the end see above example code by removing **cloure** from function parameter. **It is helpfull when your function calling code is expanding too much.**
```
fiveTimes() {
    name in
    print(name);
}
//OR
fiveTimes {
    name in
    print(name);
}

OR //See another example of Trailing cloure

func PlayerStatus(stadium : String, goal : Bool, cloure : (_ name : String , _ goal :  Bool) -> ())  {
    cloure(stadium, goal)
}

PlayerStatus(stadium: "messi", goal: true, cloure: {
    (Player : String , goal : Bool) -> () in
    goal == true ? (print("\(Player) Played well" )) : (print("\(Player) Played dont well"))
})


```
# Calling a cloure like a function

```
let cloureWithReturn = {
    (name : String) -> String
    in
    return "Thankyou " + name
}

print(cloureWithReturn("Matt"))
**output** Thankyou Matt
```

# Capturing Values by cloures 
**we can capture global values in cloure just like nested functions can capture values from the out functions**
See example below.....

```
var returntedvalue = ""

func takeThanks(name : String, cloure : (_ name : String)-> String    ){
    returntedvalue = cloure(name)
}
takeThanks(name: "Ruby", cloure: cloureWithReturn)
print("Please Captured value by cloure= \(returntedvalue)")

**Out put = Please Captured value by cloure= Thankyou Ruby **
```

# Some other examples of built in functions which take cloure 
**see how we can call them with different syntax methods.... This will remove your fear of cloure coz it is only that some people use differn style to call them....**

lets take an example of array sorting using cloure......... which we want to sort, using cloure.

```
var array = [10,5,8,9,0,1,2,6]

//here is an example with the actually fully cloure.
array = array.sorted(by: {
    (a : Int, b : Int) in
    
    return a<b
})
print(array)
**Out put = [0, 1, 2, 5, 6, 8, 9, 10] **

OR

//with infer parameters type............
array = array.sorted(by: {
    a, b in return a>b
})

OR

array = array.sorted(by: {
    a, b in  a>b
})

OR

//Shorthand Argument Names

array = array.sorted(by: {
    $0>$1
})
print(array)

OR


//Even more shorter way of cloure
//Operator Functions

array = array.sorted(by: >)



```

# Nonescape and Escape function

*** nonscaping cloure tells the compiler to be more aggresive beacause it knows the more information about the cloure lifespan ***
what it does mean actually?
in swift 1 and swift 2 the cloures were escaping by default  If you knew your closure wouldn’t escape the function body, you could mark the parameter with the @noescape attribute in swift 1 or swift 2
 in this way we had to write the [weak self] in the cloure which means when cloure is done it should release it from memory.

In Swift 3, it’s the other way around: closure parameters are non-escaping by default. If you intend for it to escape the function, you have to mark it with the @escaping attribute. This means that you dont have to write the [weak self] when writing a cloure.

for example we make a variable in the example below the variable escapecloure holds the cloure reference which makes it escape cloure. escape cloure can be used but you have to manage memory for them. you have to release teh variale for your self. you can also use the escape cloure on multiple places like completion handler of the web response.***

```
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

```
# Autoclosures
**Comming soon**




Special thanks to these websites and Apple Programming book
https://swiftunboxed.com/lang/closures-escaping-noescape-swift3/
https://cocoacasts.com/what-do-escaping-and-noescaping-mean-in-swift-3/
https://krakendev.io/blog/hipster-swift
https://oleb.net/blog/2016/10/optional-non-escaping-closures/
