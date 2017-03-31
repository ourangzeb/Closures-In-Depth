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

```

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [markdown-it] - Markdown parser done right. Fast and easy to extend.
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [Breakdance](http://breakdance.io) - HTML to Markdown converter
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ npm run predeploy
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md] [PlDb] |
| Github | [plugins/github/README.md] [PlGh] |
| Google Drive | [plugins/googledrive/README.md] [PlGd] |
| OneDrive | [plugins/onedrive/README.md] [PlOd] |
| Medium | [plugins/medium/README.md] [PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md] [PlGa] |


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantanously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma test
```
#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
Dillinger is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 80, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh

